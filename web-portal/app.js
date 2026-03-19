// =============================================
// Appbuelito Family Portal - Application Logic
// Credentials loaded from config.js (gitignored)
// =============================================

var sbClient = null;
var currentAccessCode = null;
var dashboardData = null; // cached for PDF generation

// Initialize Supabase client
function initSupabase() {
  if (sbClient) return true;

  const errorEl = document.getElementById('login-error');

  if (typeof SUPABASE_URL === 'undefined' || SUPABASE_URL.includes('YOUR_PROJECT')) {
    errorEl.textContent = 'Portal no configurado. Falta el archivo config.js.';
    errorEl.style.display = 'block';
    return false;
  }

  if (typeof window.supabase === 'undefined' || !window.supabase.createClient) {
    errorEl.textContent = 'Error cargando la libreria. Recarga la pagina.';
    errorEl.style.display = 'block';
    return false;
  }

  try {
    sbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
    return true;
  } catch (e) {
    errorEl.textContent = 'Error de configuracion: ' + e.message;
    errorEl.style.display = 'block';
    return false;
  }
}

// Check for code in URL params
function checkUrlCode() {
  const params = new URLSearchParams(window.location.search);
  const code = params.get('code');
  if (code) {
    document.getElementById('access-code').value = code;
    validateCode();
  }
}

// Validate access code via RPC function
async function validateCode() {
  const codeInput = document.getElementById('access-code');
  const errorEl = document.getElementById('login-error');
  const btn = document.getElementById('login-btn');
  const code = codeInput.value.trim().toUpperCase();

  if (!code || code.length < 5) {
    errorEl.textContent = 'Introduce un codigo valido.';
    errorEl.style.display = 'block';
    return;
  }

  if (!initSupabase()) return;

  btn.disabled = true;
  btn.textContent = 'Comprobando...';
  errorEl.style.display = 'none';

  try {
    const { data, error } = await sbClient.rpc('get_family_dashboard', {
      p_access_code: code
    });

    if (error) {
      errorEl.textContent = 'Error de conexion. Intentalo de nuevo.';
      errorEl.style.display = 'block';
      btn.disabled = false;
      btn.textContent = 'Entrar';
      return;
    }

    if (data && data.error) {
      errorEl.textContent = data.error;
      errorEl.style.display = 'block';
      btn.disabled = false;
      btn.textContent = 'Entrar';
      return;
    }

    currentAccessCode = code;
    sessionStorage.setItem('access_code', code);
    dashboardData = data;
    showDashboard(data);

  } catch (e) {
    errorEl.textContent = 'Error de conexion. Intentalo de nuevo.';
    errorEl.style.display = 'block';
  } finally {
    btn.disabled = false;
    btn.textContent = 'Entrar';
  }
}

// Show dashboard with data from RPC
function showDashboard(data) {
  document.getElementById('login-screen').style.display = 'none';
  document.getElementById('dashboard-screen').style.display = 'block';

  const patient = data.patient || {};
  document.getElementById('patient-name').textContent = patient.name || 'Paciente';
  document.getElementById('patient-diagnosis').textContent = patient.diagnosis || 'EPOC';

  const flows = data.flows || [];
  const symptoms = data.symptoms || [];
  const inhalerCount = data.inhaler_count || 0;
  const episodesCount = data.episodes_count || 0;
  const emergencies = data.emergencies || [];
  const lastDeviceSync = data.last_device_sync;

  updateFreshnessBanner(lastDeviceSync);
  updateSummary(flows);
  updateTodayCard(flows);
  updateSymptomsCard(flows, symptoms);
  updateInhalerCard(inhalerCount);
  updateEpisodesCard(episodesCount);
  updateEmergencyCard(emergencies);
  updateDaysTable(flows, symptoms);

  const syncEl = document.getElementById('last-sync');
  const lastDataDate = data.last_data_date;
  const parts = [];
  if (lastDataDate) {
    parts.push('Ultimo dato registrado: ' + formatDateTime(lastDataDate));
  }
  if (lastDeviceSync) {
    parts.push('Ultima sincronizacion: ' + formatDateTime(lastDeviceSync));
  }
  syncEl.textContent = parts.join(' | ') || '';
}

// Freshness banner
function updateFreshnessBanner(lastDeviceSync) {
  const banner = document.getElementById('freshness-banner');
  if (!lastDeviceSync) {
    banner.style.display = 'none';
    return;
  }
  const syncDate = new Date(lastDeviceSync);
  const diffMs = Date.now() - syncDate.getTime();
  const diffHours = diffMs / (1000 * 60 * 60);

  if (diffHours > 1) {
    banner.style.display = 'block';
    document.getElementById('freshness-time').textContent = formatTimeAgo(syncDate);
  } else {
    banner.style.display = 'none';
  }
}

// Refresh data
async function refreshData() {
  if (!currentAccessCode || !sbClient) {
    alert('Sesion no iniciada. Recarga la pagina.');
    return;
  }

  const btn = document.querySelector('[onclick="refreshData()"]');
  if (btn) { btn.disabled = true; btn.textContent = '⏳'; }

  try {
    const { data, error } = await sbClient.rpc('get_family_dashboard', {
      p_access_code: currentAccessCode
    });
    if (error) {
      console.error('Refresh error:', error);
      alert('Error al actualizar. Recarga la pagina e intentalo de nuevo.');
    } else if (data && !data.error) {
      dashboardData = data;
      showDashboard(data);
    }
  } catch (e) {
    console.error('Refresh exception:', e);
    // Retry: recreate client and try once more
    try {
      sbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
      const { data } = await sbClient.rpc('get_family_dashboard', {
        p_access_code: currentAccessCode
      });
      if (data && !data.error) {
        dashboardData = data;
        showDashboard(data);
      } else {
        alert('Error al actualizar. Intentalo de nuevo.');
      }
    } catch (e2) {
      console.error('Retry failed:', e2);
      alert('Error de conexion. Comprueba tu internet y recarga la pagina.');
    }
  } finally {
    if (btn) { btn.disabled = false; btn.textContent = '🔄'; }
  }
}

// Update summary badges
function updateSummary(flows) {
  const now = new Date();
  const weekAgo = new Date(now);
  weekAgo.setDate(weekAgo.getDate() - 7);

  let green = 0, yellow = 0, red = 0;
  for (const f of flows) {
    const fDate = new Date(f.flow_date + 'T12:00:00');
    if (fDate < weekAgo) continue;
    if (f.day_classification === 'green') green++;
    else if (f.day_classification === 'yellow') yellow++;
    else if (f.day_classification === 'red') red++;
  }
  document.getElementById('green-count').textContent = green;
  document.getElementById('yellow-count').textContent = yellow;
  document.getElementById('red-count').textContent = red;
}

// Update today/latest day card
function updateTodayCard(flows) {
  const el = document.getElementById('today-info');
  if (!flows.length) {
    el.innerHTML = '<p class="no-data">Sin datos recientes</p>';
    return;
  }

  const latest = flows[0];
  const classification = {
    green: '🟢 Buen dia',
    yellow: '🟡 Dia regular',
    red: '🔴 Mal dia',
  }[latest.day_classification] || '⚪ Sin clasificar';

  const medIcon = latest.medication_taken === true ? '💊 Tomo medicacion'
    : latest.medication_taken === false ? '❌ No tomo medicacion' : '';

  el.innerHTML = `
    <p><strong>${formatDate(latest.flow_date)}</strong></p>
    <p style="font-size: 22px; margin: 8px 0;">${classification}</p>
    ${latest.morning_score != null ? `<p>Puntuacion matutina: <strong>${latest.morning_score}</strong></p>` : ''}
    ${latest.respiratory_stability_score != null ? `<p>Estabilidad respiratoria: <strong>${latest.respiratory_stability_score}</strong></p>` : ''}
    ${medIcon ? `<p style="margin-top: 6px;">${medIcon}</p>` : ''}
    ${latest.evening_notes ? `<p style="color: var(--text-secondary); font-style: italic; margin-top: 6px;">"${latest.evening_notes}"</p>` : ''}
  `;
}

// Update symptoms card with morning questionnaire data
function updateSymptomsCard(flows, symptoms) {
  const card = document.getElementById('symptoms-card');
  const el = document.getElementById('symptoms-info');

  if (!flows.length || !symptoms.length) {
    card.style.display = 'none';
    return;
  }

  // Find morning symptom check for the latest flow
  const latestFlowId = flows[0].flow_date; // match by date proximity
  const morningCheck = symptoms.find(s => s.moment === 'morning');
  const eveningCheck = symptoms.find(s => s.moment === 'evening');

  if (!morningCheck && !eveningCheck) {
    card.style.display = 'none';
    return;
  }

  card.style.display = 'block';

  // Calculate 7-day averages for trend comparison
  const recentMorning = symptoms.filter(s => s.moment === 'morning').slice(0, 7);
  const avgBreathing = avg(recentMorning.map(s => s.breathing_today));
  const avgFatigue = avg(recentMorning.map(s => s.fatigue));
  const avgCough = avg(recentMorning.map(s => s.cough));

  let html = '';

  if (morningCheck) {
    if (morningCheck.breathing_today != null) {
      html += symptomItem('🫁', 'Respiracion', morningCheck.breathing_today, 5, avgBreathing);
    }
    if (morningCheck.fatigue != null) {
      html += symptomItem('😴', 'Fatiga', morningCheck.fatigue, 5, avgFatigue);
    }
    if (morningCheck.cough != null) {
      html += symptomItem('🤧', 'Tos', morningCheck.cough, 5, avgCough);
    }
    if (morningCheck.phlegm != null) {
      const phlegmVal = morningCheck.phlegm > 2 ? 'Si' : 'No';
      html += `<div class="symptom-item ${morningCheck.phlegm > 2 ? 'bad' : 'good'}">
        <span class="symptom-emoji">💧</span>
        <span class="symptom-label">Flema</span>
        <span class="symptom-value">${phlegmVal}</span>
      </div>`;
    }
    if (morningCheck.saturation != null) {
      const satClass = morningCheck.saturation >= 95 ? 'good' : morningCheck.saturation >= 90 ? 'moderate' : 'bad';
      html += `<div class="symptom-item ${satClass}">
        <span class="symptom-emoji">🩸</span>
        <span class="symptom-label">Saturacion</span>
        <span class="symptom-value">${morningCheck.saturation}%</span>
      </div>`;
    }
    if (morningCheck.pulse != null) {
      html += `<div class="symptom-item">
        <span class="symptom-emoji">💓</span>
        <span class="symptom-label">Pulso</span>
        <span class="symptom-value">${morningCheck.pulse}</span>
      </div>`;
    }
  }

  el.innerHTML = html;
}

function symptomItem(emoji, label, value, max, avgVal) {
  const severity = value <= 2 ? 'good' : value <= 3 ? 'moderate' : 'bad';
  const labels = { 1: 'Muy bien', 2: 'Bien', 3: 'Normal', 4: 'Mal', 5: 'Muy mal' };
  const trend = avgVal != null ? trendArrow(value, avgVal) : '';
  return `<div class="symptom-item ${severity}">
    <span class="symptom-emoji">${emoji}</span>
    <span class="symptom-label">${label}</span>
    <span class="symptom-value">${labels[value] || value}/${max} ${trend}</span>
  </div>`;
}

function trendArrow(current, avg) {
  if (avg == null || isNaN(avg)) return '';
  const diff = current - avg;
  if (diff > 0.5) return '<span class="trend-up">↑</span>';
  if (diff < -0.5) return '<span class="trend-down">↓</span>';
  return '<span class="trend-same">→</span>';
}

function avg(arr) {
  const valid = arr.filter(v => v != null);
  if (!valid.length) return null;
  return valid.reduce((a, b) => a + b, 0) / valid.length;
}

// Update inhaler card
function updateInhalerCard(count) {
  document.getElementById('inhaler-count').textContent = count;
  if (count > 3) {
    document.getElementById('inhaler-card').style.background = '#FFF3E0';
    document.getElementById('inhaler-card').style.borderLeft = '4px solid var(--yellow)';
  }
}

// Update episodes card
function updateEpisodesCard(count) {
  document.getElementById('episodes-count').textContent = count;
}

// Update emergency card
function updateEmergencyCard(emergencies) {
  const card = document.getElementById('emergency-card');
  if (!emergencies || !emergencies.length) {
    card.style.display = 'none';
    return;
  }
  card.style.display = 'flex';
  const info = emergencies.map(e =>
    `${formatDateTime(e.timestamp)}: ${e.type}${e.contact_called ? ' (llamo a ' + e.contact_called + ')' : ''}`
  ).join('<br>');
  document.getElementById('emergency-info').innerHTML = info;
}

// Update enriched days table
function updateDaysTable(flows, symptoms) {
  const tbody = document.getElementById('days-tbody');
  const noData = document.getElementById('no-data');
  const allSymptoms = symptoms || [];

  if (!flows.length) {
    tbody.innerHTML = '';
    noData.style.display = 'block';
    return;
  }

  noData.style.display = 'none';

  tbody.innerHTML = flows.map(f => {
    const classLabel = {
      green: 'Estable',
      yellow: 'Regular',
      red: 'Malo',
    }[f.day_classification] || '-';

    const dotClass = f.day_classification || 'none';

    // Find morning symptoms for this flow's date
    const morningCheck = allSymptoms.find(s =>
      s.moment === 'morning' && s.daily_flow_id === f.id
    ) || findSymptomByDate(allSymptoms, f.flow_date, 'morning');

    const breathingLabel = morningCheck && morningCheck.breathing_today != null
      ? scoreEmoji(morningCheck.breathing_today) : '-';
    const fatigueLabel = morningCheck && morningCheck.fatigue != null
      ? scoreEmoji(morningCheck.fatigue) : '-';
    const coughLabel = morningCheck && morningCheck.cough != null
      ? scoreEmoji(morningCheck.cough) : '-';

    const medBadge = f.medication_taken === true
      ? '<span class="med-badge yes">Si</span>'
      : f.medication_taken === false
        ? '<span class="med-badge no">No</span>'
        : '<span class="med-badge unknown">-</span>';

    const notes = f.evening_notes
      ? `<span class="notes-cell" title="${escapeHtml(f.evening_notes)}">${escapeHtml(f.evening_notes)}</span>`
      : '-';

    return `<tr>
      <td>${formatDate(f.flow_date)}</td>
      <td><span class="status-dot ${dotClass}"></span>${classLabel}</td>
      <td>${breathingLabel}</td>
      <td>${fatigueLabel}</td>
      <td>${coughLabel}</td>
      <td>${medBadge}</td>
      <td>${notes}</td>
    </tr>`;
  }).join('');
}

function findSymptomByDate(symptoms, flowDate, moment) {
  return symptoms.find(s => {
    if (s.moment !== moment) return false;
    if (!s.created_at) return false;
    const sDate = s.created_at.split('T')[0];
    return sDate === flowDate;
  });
}

function scoreEmoji(score) {
  const emojis = { 1: '😊', 2: '🙂', 3: '😐', 4: '😟', 5: '😣' };
  return emojis[score] || String(score);
}

function escapeHtml(str) {
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}

// ── PDF Report ──────────────────────────────────────────

async function downloadReport() {
  if (!currentAccessCode || !sbClient) return;

  try {
    // Fetch extended 30-day data for report
    const { data, error } = await sbClient.rpc('get_family_report', {
      p_access_code: currentAccessCode
    });

    if (error || !data || data.error) {
      alert('Error al generar el informe. Intentalo de nuevo.');
      return;
    }

    generatePDF(data);
  } catch (e) {
    alert('Error al generar el informe: ' + e.message);
  }
}

function generatePDF(data) {
  if (!window.jspdf && !window.jsPDF) {
    alert('Error: la libreria de PDF no se ha cargado. Recarga la pagina e intentalo de nuevo.');
    return;
  }
  const jsPDF = (window.jspdf && window.jspdf.jsPDF) || window.jsPDF;
  const doc = new jsPDF();
  const patient = data.patient || {};
  const flows = data.flows || [];
  const symptoms = data.symptoms || [];
  const counts = data.classification_counts || {};
  const emergencies = data.emergencies || [];

  const now = new Date();
  const title = `Informe de salud - ${patient.name || 'Paciente'}`;

  // Header
  doc.setFontSize(20);
  doc.setTextColor(21, 101, 192);
  doc.text('Appbuelito', 14, 20);
  doc.setFontSize(14);
  doc.setTextColor(0);
  doc.text(title, 14, 30);
  doc.setFontSize(10);
  doc.setTextColor(100);
  doc.text(`Diagnostico: ${patient.diagnosis || 'EPOC'}`, 14, 37);
  doc.text(`Periodo: ultimos 30 dias | Generado: ${now.getDate()}/${now.getMonth()+1}/${now.getFullYear()}`, 14, 43);

  // Summary
  doc.setFontSize(14);
  doc.setTextColor(0);
  doc.text('Resumen', 14, 55);

  doc.autoTable({
    startY: 60,
    head: [['Metrica', 'Valor']],
    body: [
      ['Dias registrados', String(counts.total || 0)],
      ['Dias buenos (verde)', String(counts.green || 0)],
      ['Dias regulares (amarillo)', String(counts.yellow || 0)],
      ['Dias malos (rojo)', String(counts.red || 0)],
      ['Usos inhalador rescate', String(data.inhaler_count || 0)],
      ['Episodios de ahogo', String(data.episodes_count || 0)],
      ['Eventos de emergencia', String(emergencies.length)],
    ],
    theme: 'striped',
    styles: { fontSize: 10 },
    headStyles: { fillColor: [21, 101, 192] },
  });

  // Day-by-day table
  let y = doc.lastAutoTable.finalY + 15;
  doc.setFontSize(14);
  doc.text('Detalle dia a dia', 14, y);

  const dayRows = flows.map(f => {
    const morningCheck = symptoms.find(s =>
      s.moment === 'morning' && (s.daily_flow_id === f.id || matchDate(s.created_at, f.flow_date))
    );

    const classLabel = { green: 'Bueno', yellow: 'Regular', red: 'Malo' }[f.day_classification] || '-';
    const breathing = morningCheck && morningCheck.breathing_today != null ? scoreLabel(morningCheck.breathing_today) : '-';
    const fatigue = morningCheck && morningCheck.fatigue != null ? scoreLabel(morningCheck.fatigue) : '-';
    const cough = morningCheck && morningCheck.cough != null ? scoreLabel(morningCheck.cough) : '-';
    const med = f.medication_taken === true ? 'Si' : f.medication_taken === false ? 'No' : '-';
    const notes = f.evening_notes || '';

    return [formatDate(f.flow_date), classLabel, breathing, fatigue, cough, med, notes.substring(0, 30)];
  });

  doc.autoTable({
    startY: y + 5,
    head: [['Fecha', 'Estado', 'Respiracion', 'Fatiga', 'Tos', 'Medicacion', 'Notas']],
    body: dayRows,
    theme: 'striped',
    styles: { fontSize: 8 },
    headStyles: { fillColor: [21, 101, 192] },
    columnStyles: {
      6: { cellWidth: 35 },
    },
  });

  // Emergencies
  if (emergencies.length > 0) {
    y = doc.lastAutoTable.finalY + 15;
    doc.setFontSize(14);
    doc.setTextColor(198, 40, 40);
    doc.text('Eventos de emergencia', 14, y);
    doc.setTextColor(0);

    const emergRows = emergencies.map(e => [
      formatDateTime(e.timestamp),
      e.type,
      e.contact_called || '-',
      e.result || '-',
    ]);

    doc.autoTable({
      startY: y + 5,
      head: [['Fecha/Hora', 'Tipo', 'Contacto', 'Resultado']],
      body: emergRows,
      theme: 'striped',
      styles: { fontSize: 9 },
      headStyles: { fillColor: [198, 40, 40] },
    });
  }

  // Footer
  const pageCount = doc.internal.getNumberOfPages();
  for (let i = 1; i <= pageCount; i++) {
    doc.setPage(i);
    doc.setFontSize(8);
    doc.setTextColor(150);
    doc.text(
      `Appbuelito - Informe de salud | Pagina ${i} de ${pageCount} | Esta informacion no sustituye la atencion medica profesional.`,
      14, doc.internal.pageSize.height - 10
    );
  }

  // Download
  const filename = `appbuelito_informe_${now.getFullYear()}${String(now.getMonth()+1).padStart(2,'0')}${String(now.getDate()).padStart(2,'0')}.pdf`;
  doc.save(filename);
}

function scoreLabel(score) {
  const labels = { 1: 'Muy bien', 2: 'Bien', 3: 'Normal', 4: 'Mal', 5: 'Muy mal' };
  return labels[score] || String(score);
}

function matchDate(isoStr, flowDate) {
  if (!isoStr) return false;
  return isoStr.split('T')[0] === flowDate;
}

// ── Helpers ──────────────────────────────────────────

function formatDate(dateStr) {
  const months = ['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'];
  const d = new Date(dateStr + 'T12:00:00');
  return `${d.getDate()} ${months[d.getMonth()]}`;
}

function formatDateTime(isoStr) {
  if (!isoStr) return '';
  const d = new Date(isoStr);
  const months = ['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'];
  return `${d.getDate()} ${months[d.getMonth()]} ${d.getHours()}:${String(d.getMinutes()).padStart(2,'0')}`;
}

function formatTimeAgo(date) {
  const diffMs = Date.now() - date.getTime();
  const mins = Math.floor(diffMs / 60000);
  if (mins < 60) return `hace ${mins} min`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `hace ${hours}h`;
  const days = Math.floor(hours / 24);
  return `hace ${days} dia${days > 1 ? 's' : ''}`;
}

// Logout
function logout() {
  sessionStorage.removeItem('access_code');
  currentAccessCode = null;
  dashboardData = null;
  document.getElementById('dashboard-screen').style.display = 'none';
  document.getElementById('login-screen').style.display = 'block';
  document.getElementById('access-code').value = '';
}

// On page load
document.addEventListener('DOMContentLoaded', () => {
  checkUrlCode();
  const savedCode = sessionStorage.getItem('access_code');
  if (savedCode && typeof SUPABASE_URL !== 'undefined' && !SUPABASE_URL.includes('YOUR_PROJECT')) {
    document.getElementById('access-code').value = savedCode;
    validateCode();
  }
});
