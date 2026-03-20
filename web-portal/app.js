// =============================================
// Appbuelito Family Portal - Application Logic
// Credentials loaded from config.js (gitignored)
// =============================================

var sbClient = null;
var currentAccessCode = null;
var dashboardData = null;
var chartSymptoms = null;
var chartDays = null;
var chartInhaler = null;

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

  // New sections
  updateWeeklyComparison(data.this_week, data.last_week);
  updateCharts(flows, symptoms, data.inhaler_uses_detail || []);
  updateInhalerHistoryTable(data.inhaler_uses_detail || []);
  loadAlertPrefs();

  const syncEl = document.getElementById('last-sync');
  const lastDataDate = data.last_data_date;
  const parts = [];
  if (lastDataDate) parts.push('Ultimo dato registrado: ' + formatDateTime(lastDataDate));
  if (lastDeviceSync) parts.push('Ultima sincronizacion: ' + formatDateTime(lastDeviceSync));
  syncEl.textContent = parts.join(' | ') || '';
}

// Freshness banner
function updateFreshnessBanner(lastDeviceSync) {
  const banner = document.getElementById('freshness-banner');
  if (!lastDeviceSync) { banner.style.display = 'none'; return; }
  const syncDate = new Date(lastDeviceSync);
  const diffHours = (Date.now() - syncDate.getTime()) / (1000 * 60 * 60);
  if (diffHours > 1) {
    banner.style.display = 'block';
    document.getElementById('freshness-time').textContent = formatTimeAgo(syncDate);
  } else {
    banner.style.display = 'none';
  }
}

// Refresh data
async function refreshData() {
  if (!currentAccessCode || !sbClient) { alert('Sesion no iniciada. Recarga la pagina.'); return; }

  const btn = document.querySelector('[onclick="refreshData()"]');
  if (btn) { btn.disabled = true; btn.textContent = '⏳'; }

  try {
    const { data, error } = await sbClient.rpc('get_family_dashboard', { p_access_code: currentAccessCode });
    if (error) {
      alert('Error al actualizar. Recarga la pagina e intentalo de nuevo.');
    } else if (data && !data.error) {
      dashboardData = data;
      showDashboard(data);
    }
  } catch (e) {
    try {
      sbClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
      const { data } = await sbClient.rpc('get_family_dashboard', { p_access_code: currentAccessCode });
      if (data && !data.error) { dashboardData = data; showDashboard(data); }
      else alert('Error al actualizar. Intentalo de nuevo.');
    } catch (e2) {
      alert('Error de conexion. Comprueba tu internet y recarga la pagina.');
    }
  } finally {
    if (btn) { btn.disabled = false; btn.textContent = '🔄'; }
  }
}

// Update summary badges
function updateSummary(flows) {
  const weekAgo = new Date();
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
  if (!flows.length) { el.innerHTML = '<p class="no-data">Sin datos recientes</p>'; return; }
  const latest = flows[0];
  const classification = { green: '🟢 Buen dia', yellow: '🟡 Dia regular', red: '🔴 Mal dia' }[latest.day_classification] || '⚪ Sin clasificar';
  const medIcon = latest.medication_taken === true ? '💊 Tomo medicacion' : latest.medication_taken === false ? '❌ No tomo medicacion' : '';
  el.innerHTML = `
    <p><strong>${formatDate(latest.flow_date)}</strong></p>
    <p style="font-size:22px;margin:8px 0;">${classification}</p>
    ${latest.morning_score != null ? `<p>Puntuacion matutina: <strong>${latest.morning_score}</strong></p>` : ''}
    ${latest.respiratory_stability_score != null ? `<p>Estabilidad respiratoria: <strong>${latest.respiratory_stability_score}</strong></p>` : ''}
    ${medIcon ? `<p style="margin-top:6px;">${medIcon}</p>` : ''}
    ${latest.evening_notes ? `<p style="color:var(--text-secondary);font-style:italic;margin-top:6px;">"${latest.evening_notes}"</p>` : ''}
  `;
}

// Update symptoms card
function updateSymptomsCard(flows, symptoms) {
  const card = document.getElementById('symptoms-card');
  const el = document.getElementById('symptoms-info');
  if (!flows.length || !symptoms.length) { card.style.display = 'none'; return; }
  const morningCheck = symptoms.find(s => s.moment === 'morning');
  const recentMorning = symptoms.filter(s => s.moment === 'morning').slice(0, 7);
  const avgBreathing = avg(recentMorning.map(s => s.breathing_today));
  const avgFatigue = avg(recentMorning.map(s => s.fatigue));
  const avgCough = avg(recentMorning.map(s => s.cough));
  if (!morningCheck) { card.style.display = 'none'; return; }
  card.style.display = 'block';
  let html = '';
  if (morningCheck.breathing_today != null) html += symptomItem('🫁', 'Respiracion', morningCheck.breathing_today, 5, avgBreathing);
  if (morningCheck.fatigue != null) html += symptomItem('😴', 'Fatiga', morningCheck.fatigue, 5, avgFatigue);
  if (morningCheck.cough != null) html += symptomItem('🤧', 'Tos', morningCheck.cough, 5, avgCough);
  if (morningCheck.phlegm != null) {
    html += `<div class="symptom-item ${morningCheck.phlegm > 2 ? 'bad' : 'good'}">
      <span class="symptom-emoji">💧</span>
      <span class="symptom-label">Flema</span>
      <span class="symptom-value">${morningCheck.phlegm > 2 ? 'Si' : 'No'}</span></div>`;
  }
  if (morningCheck.saturation != null) {
    const satClass = morningCheck.saturation >= 95 ? 'good' : morningCheck.saturation >= 90 ? 'moderate' : 'bad';
    html += `<div class="symptom-item ${satClass}">
      <span class="symptom-emoji">🩸</span>
      <span class="symptom-label">Saturacion</span>
      <span class="symptom-value">${morningCheck.saturation}%</span></div>`;
  }
  if (morningCheck.pulse != null) {
    html += `<div class="symptom-item">
      <span class="symptom-emoji">💓</span>
      <span class="symptom-label">Pulso</span>
      <span class="symptom-value">${morningCheck.pulse}</span></div>`;
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
    <span class="symptom-value">${labels[value] || value}/${max} ${trend}</span></div>`;
}

function trendArrow(current, avgVal) {
  if (avgVal == null || isNaN(avgVal)) return '';
  const diff = current - avgVal;
  if (diff > 0.5) return '<span class="trend-up">↑</span>';
  if (diff < -0.5) return '<span class="trend-down">↓</span>';
  return '<span class="trend-same">→</span>';
}

function avg(arr) {
  const valid = arr.filter(v => v != null);
  if (!valid.length) return null;
  return valid.reduce((a, b) => a + b, 0) / valid.length;
}

function updateInhalerCard(count) {
  document.getElementById('inhaler-count').textContent = count;
  if (count > 3) {
    document.getElementById('inhaler-card').style.background = '#FFF3E0';
    document.getElementById('inhaler-card').style.borderLeft = '4px solid var(--yellow)';
  }
}

function updateEpisodesCard(count) {
  document.getElementById('episodes-count').textContent = count;
}

function updateEmergencyCard(emergencies) {
  const card = document.getElementById('emergency-card');
  if (!emergencies || !emergencies.length) { card.style.display = 'none'; return; }
  card.style.display = 'flex';
  const info = emergencies.map(e =>
    `${formatDateTime(e.timestamp)}: ${e.type}${e.contact_called ? ' (llamo a ' + e.contact_called + ')' : ''}`
  ).join('<br>');
  document.getElementById('emergency-info').innerHTML = info;
}

function updateDaysTable(flows, symptoms) {
  const tbody = document.getElementById('days-tbody');
  const noData = document.getElementById('no-data');
  if (!flows.length) { tbody.innerHTML = ''; noData.style.display = 'block'; return; }
  noData.style.display = 'none';
  tbody.innerHTML = flows.map(f => {
    const classLabel = { green: 'Estable', yellow: 'Regular', red: 'Malo' }[f.day_classification] || '-';
    const dotClass = f.day_classification || 'none';
    const morningCheck = (symptoms || []).find(s =>
      s.moment === 'morning' && (s.daily_flow_id === f.id || matchDate(s.created_at, f.flow_date))
    );
    const breathingLabel = morningCheck && morningCheck.breathing_today != null ? scoreEmoji(morningCheck.breathing_today) : '-';
    const fatigueLabel = morningCheck && morningCheck.fatigue != null ? scoreEmoji(morningCheck.fatigue) : '-';
    const coughLabel = morningCheck && morningCheck.cough != null ? scoreEmoji(morningCheck.cough) : '-';
    const medBadge = f.medication_taken === true ? '<span class="med-badge yes">Si</span>'
      : f.medication_taken === false ? '<span class="med-badge no">No</span>'
      : '<span class="med-badge unknown">-</span>';
    const notes = f.evening_notes ? `<span class="notes-cell" title="${escapeHtml(f.evening_notes)}">${escapeHtml(f.evening_notes)}</span>` : '-';
    return `<tr>
      <td>${formatDate(f.flow_date)}</td>
      <td><span class="status-dot ${dotClass}"></span>${classLabel}</td>
      <td>${breathingLabel}</td><td>${fatigueLabel}</td><td>${coughLabel}</td>
      <td>${medBadge}</td><td>${notes}</td></tr>`;
  }).join('');
}

// ── D2: Weekly comparison ────────────────────────────────
function updateWeeklyComparison(thisWeek, lastWeek) {
  const card = document.getElementById('weekly-comparison-card');
  if (!thisWeek || !lastWeek) { card.style.display = 'none'; return; }
  card.style.display = 'block';

  function arrow(curr, prev) {
    const c = Number(curr), p = Number(prev);
    if (c > p) return '<span class="cmp-up">↑</span>';
    if (c < p) return '<span class="cmp-down">↓</span>';
    return '<span class="cmp-same">→</span>';
  }

  const rows = [
    { label: '🟢 Dias buenos', curr: thisWeek.green, prev: lastWeek.green, goodUp: true },
    { label: '🟡 Dias regulares', curr: thisWeek.yellow, prev: lastWeek.yellow, goodUp: false },
    { label: '🔴 Dias malos', curr: thisWeek.red, prev: lastWeek.red, goodUp: false },
    { label: '💨 Inhalaciones', curr: thisWeek.inhaler_count, prev: lastWeek.inhaler_count, goodUp: false },
  ];

  document.getElementById('weekly-comparison-grid').innerHTML = rows.map(r => `
    <div class="cmp-row">
      <span class="cmp-label">${r.label}</span>
      <span class="cmp-curr">${r.curr}</span>
      ${arrow(r.curr, r.prev)}
      <span class="cmp-prev">${r.prev} sem. ant.</span>
    </div>`
  ).join('');
}

// ── D1: Charts ───────────────────────────────────────────
function updateCharts(flows, symptoms, inhalerUses) {
  const card = document.getElementById('charts-card');
  if (!flows.length && !inhalerUses.length) { card.style.display = 'none'; return; }
  card.style.display = 'block';

  // Build last 14 days date labels
  const days = [];
  for (let i = 13; i >= 0; i--) {
    const d = new Date();
    d.setDate(d.getDate() - i);
    days.push(d.toISOString().split('T')[0]);
  }
  const shortLabels = days.map(d => { const dd = new Date(d + 'T12:00:00'); return `${dd.getDate()}/${dd.getMonth()+1}`; });

  // Symptoms chart data
  const breathingData = days.map(date => {
    const sym = symptoms.find(s => s.moment === 'morning' && matchDate(s.created_at, date));
    return sym && sym.breathing_today != null ? sym.breathing_today : null;
  });
  const fatigueData = days.map(date => {
    const sym = symptoms.find(s => s.moment === 'morning' && matchDate(s.created_at, date));
    return sym && sym.fatigue != null ? sym.fatigue : null;
  });
  const coughData = days.map(date => {
    const sym = symptoms.find(s => s.moment === 'morning' && matchDate(s.created_at, date));
    return sym && sym.cough != null ? sym.cough : null;
  });

  // Day classification stacked bar
  const greenData = days.map(date => flows.find(f => f.flow_date === date && f.day_classification === 'green') ? 1 : 0);
  const yellowData = days.map(date => flows.find(f => f.flow_date === date && f.day_classification === 'yellow') ? 1 : 0);
  const redData = days.map(date => flows.find(f => f.flow_date === date && f.day_classification === 'red') ? 1 : 0);

  // Inhaler uses per day
  const inhalerPerDay = days.map(date =>
    inhalerUses.filter(u => u.timestamp && u.timestamp.split('T')[0] === date).length
  );

  const chartDefaults = {
    responsive: true,
    plugins: { legend: { labels: { font: { size: 13 } } } },
    scales: { y: { beginAtZero: true } },
  };

  // Destroy old charts
  if (chartSymptoms) { chartSymptoms.destroy(); chartSymptoms = null; }
  if (chartDays) { chartDays.destroy(); chartDays = null; }
  if (chartInhaler) { chartInhaler.destroy(); chartInhaler = null; }

  chartSymptoms = new Chart(document.getElementById('chart-symptoms'), {
    type: 'line',
    data: {
      labels: shortLabels,
      datasets: [
        { label: 'Respiracion', data: breathingData, borderColor: '#1565C0', backgroundColor: 'transparent', spanGaps: true, tension: 0.3 },
        { label: 'Fatiga', data: fatigueData, borderColor: '#F57F17', backgroundColor: 'transparent', spanGaps: true, tension: 0.3 },
        { label: 'Tos', data: coughData, borderColor: '#6A1B9A', backgroundColor: 'transparent', spanGaps: true, tension: 0.3 },
      ],
    },
    options: { ...chartDefaults, scales: { y: { beginAtZero: true, max: 5, ticks: { stepSize: 1 } } } },
  });

  chartDays = new Chart(document.getElementById('chart-days'), {
    type: 'bar',
    data: {
      labels: shortLabels,
      datasets: [
        { label: 'Bueno', data: greenData, backgroundColor: '#2E7D32' },
        { label: 'Regular', data: yellowData, backgroundColor: '#F57F17' },
        { label: 'Malo', data: redData, backgroundColor: '#C62828' },
      ],
    },
    options: { ...chartDefaults, scales: { x: { stacked: true }, y: { stacked: true, beginAtZero: true, max: 1, ticks: { display: false } } } },
  });

  chartInhaler = new Chart(document.getElementById('chart-inhaler'), {
    type: 'bar',
    data: {
      labels: shortLabels,
      datasets: [{ label: 'Inhalaciones', data: inhalerPerDay, backgroundColor: '#0288D1' }],
    },
    options: { ...chartDefaults, scales: { y: { beginAtZero: true, ticks: { stepSize: 1 } } } },
  });
}

// ── D3: Inhaler history table ────────────────────────────
function updateInhalerHistoryTable(uses) {
  const card = document.getElementById('inhaler-history-card');
  const tbody = document.getElementById('inhaler-tbody');
  if (!uses || !uses.length) { card.style.display = 'none'; return; }
  card.style.display = 'block';

  function contextLabel(ctx) {
    const map = { chokingFlow: 'Episodio de ahogo', routine: 'Durante ejercicio', symptomCheck: 'Control de sintomas' };
    return map[ctx] || 'Uso normal';
  }
  function reliefEmoji(level) {
    const emojis = ['😞', '😕', '😐', '😊', '😄'];
    if (!level || level < 1 || level > 5) return '—';
    return emojis[level - 1];
  }

  tbody.innerHTML = uses.map(u => `<tr>
    <td>${formatDateTime(u.timestamp)}</td>
    <td>${contextLabel(u.usage_context)}</td>
    <td>${u.puffs || 1}</td>
    <td style="font-size:22px;">${reliefEmoji(u.relief_level)}</td>
  </tr>`).join('');
}

// ── D4: Alert settings ───────────────────────────────────
async function loadAlertPrefs() {
  if (!sbClient || !currentAccessCode) return;
  try {
    const { data } = await sbClient
      .from('family_access')
      .select('email, alert_on_emergency, alert_on_inactivity_days')
      .eq('access_code', currentAccessCode)
      .single();
    if (data) {
      if (data.email) document.getElementById('alert-email').value = data.email;
      document.getElementById('alert-emergency').checked = data.alert_on_emergency || false;
      document.getElementById('alert-inactivity').value = String(data.alert_on_inactivity_days || 0);
    }
  } catch (_) {}
}

async function saveAlertPrefs() {
  const email = document.getElementById('alert-email').value.trim();
  const alertEmergency = document.getElementById('alert-emergency').checked;
  const inactivityDays = parseInt(document.getElementById('alert-inactivity').value, 10);
  const statusEl = document.getElementById('alerts-status');

  if (!sbClient || !currentAccessCode) return;

  try {
    const { error } = await sbClient
      .from('family_access')
      .update({ email: email || null, alert_on_emergency: alertEmergency, alert_on_inactivity_days: inactivityDays })
      .eq('access_code', currentAccessCode);

    if (error) throw error;
    statusEl.textContent = '✓ Preferencias guardadas';
    statusEl.style.display = 'block';
    statusEl.style.color = 'var(--green)';
    setTimeout(() => { statusEl.style.display = 'none'; }, 3000);
  } catch (e) {
    statusEl.textContent = 'Error al guardar. Intentalo de nuevo.';
    statusEl.style.display = 'block';
    statusEl.style.color = 'var(--red)';
  }
}

// ── PDF Report ───────────────────────────────────────────
async function downloadReport() {
  if (!currentAccessCode || !sbClient) return;
  try {
    const { data, error } = await sbClient.rpc('get_family_report', { p_access_code: currentAccessCode });
    if (error || !data || data.error) { alert('Error al generar el informe. Intentalo de nuevo.'); return; }
    generatePDF(data);
  } catch (e) {
    alert('Error al generar el informe: ' + e.message);
  }
}

function generatePDF(data) {
  if (!window.jspdf && !window.jsPDF) {
    alert('Error: la libreria de PDF no se ha cargado. Recarga la pagina.');
    return;
  }
  const jsPDF = (window.jspdf && window.jspdf.jsPDF) || window.jsPDF;
  const doc = new jsPDF();
  const patient = data.patient || {};
  const flows = data.flows || [];
  const symptoms = data.symptoms || [];
  const counts = data.classification_counts || {};
  const emergencies = data.emergencies || [];
  const inhalerDetail = data.inhaler_uses_detail || [];
  const now = new Date();

  doc.setFontSize(20); doc.setTextColor(21, 101, 192);
  doc.text('Appbuelito', 14, 20);
  doc.setFontSize(14); doc.setTextColor(0);
  doc.text(`Informe de salud - ${patient.name || 'Paciente'}`, 14, 30);
  doc.setFontSize(10); doc.setTextColor(100);
  doc.text(`Diagnostico: ${patient.diagnosis || 'EPOC'}`, 14, 37);
  doc.text(`Periodo: ultimos 30 dias | Generado: ${now.getDate()}/${now.getMonth()+1}/${now.getFullYear()}`, 14, 43);

  doc.setFontSize(14); doc.setTextColor(0);
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
    theme: 'striped', styles: { fontSize: 10 },
    headStyles: { fillColor: [21, 101, 192] },
  });

  // Weekly breakdown
  if (data.weekly_breakdown && data.weekly_breakdown.length) {
    let y = doc.lastAutoTable.finalY + 10;
    doc.setFontSize(12); doc.text('Resumen semanal', 14, y);
    doc.autoTable({
      startY: y + 4,
      head: [['Semana', 'Buenos', 'Regulares', 'Malos', 'Inhalaciones']],
      body: data.weekly_breakdown.map(w => [
        formatDate(w.week_start.split('T')[0]),
        String(w.green), String(w.yellow), String(w.red), String(w.inhaler_count)
      ]),
      theme: 'striped', styles: { fontSize: 9 },
      headStyles: { fillColor: [21, 101, 192] },
    });
  }

  // Day-by-day
  let y2 = doc.lastAutoTable.finalY + 10;
  doc.setFontSize(12); doc.text('Detalle dia a dia', 14, y2);
  doc.autoTable({
    startY: y2 + 4,
    head: [['Fecha', 'Estado', 'Respiracion', 'Fatiga', 'Tos', 'Medicacion', 'Notas']],
    body: flows.map(f => {
      const morningCheck = symptoms.find(s => s.moment === 'morning' && (s.daily_flow_id === f.id || matchDate(s.created_at, f.flow_date)));
      const classLabel = { green: 'Bueno', yellow: 'Regular', red: 'Malo' }[f.day_classification] || '-';
      return [
        formatDate(f.flow_date), classLabel,
        morningCheck && morningCheck.breathing_today != null ? scoreLabel(morningCheck.breathing_today) : '-',
        morningCheck && morningCheck.fatigue != null ? scoreLabel(morningCheck.fatigue) : '-',
        morningCheck && morningCheck.cough != null ? scoreLabel(morningCheck.cough) : '-',
        f.medication_taken === true ? 'Si' : f.medication_taken === false ? 'No' : '-',
        (f.evening_notes || '').substring(0, 30),
      ];
    }),
    theme: 'striped', styles: { fontSize: 8 },
    headStyles: { fillColor: [21, 101, 192] },
    columnStyles: { 6: { cellWidth: 35 } },
  });

  // Inhaler detail
  if (inhalerDetail.length) {
    let y3 = doc.lastAutoTable.finalY + 10;
    doc.setFontSize(12); doc.text('Historial de inhalador', 14, y3);
    doc.autoTable({
      startY: y3 + 4,
      head: [['Fecha/Hora', 'Motivo', 'Pulsaciones', 'Alivio']],
      body: inhalerDetail.map(u => {
        const ctxMap = { chokingFlow: 'Ahogo', routine: 'Ejercicio', symptomCheck: 'Control' };
        const reliefLabels = { 1: 'Nada', 2: 'Poco', 3: 'Regular', 4: 'Bastante', 5: 'Mucho' };
        return [formatDateTime(u.timestamp), ctxMap[u.usage_context] || 'Normal', String(u.puffs || 1), reliefLabels[u.relief_level] || '-'];
      }),
      theme: 'striped', styles: { fontSize: 9 },
      headStyles: { fillColor: [2, 136, 209] },
    });
  }

  // Emergencies
  if (emergencies.length) {
    let y4 = doc.lastAutoTable.finalY + 10;
    doc.setFontSize(12); doc.setTextColor(198, 40, 40);
    doc.text('Eventos de emergencia', 14, y4);
    doc.setTextColor(0);
    doc.autoTable({
      startY: y4 + 4,
      head: [['Fecha/Hora', 'Tipo', 'Contacto', 'Resultado']],
      body: emergencies.map(e => [formatDateTime(e.timestamp), e.type, e.contact_called || '-', e.result || '-']),
      theme: 'striped', styles: { fontSize: 9 },
      headStyles: { fillColor: [198, 40, 40] },
    });
  }

  // Interpretation guide
  let yInterp = doc.lastAutoTable.finalY + 10;
  doc.setFontSize(12); doc.setTextColor(0);
  doc.text('Como leer este informe', 14, yInterp);
  doc.autoTable({
    startY: yInterp + 4,
    head: [['Concepto', 'Significado']],
    body: [
      ['Dia verde (<=10 pts)', 'Dia estable. El paciente respira bien, duerme bien y tiene poca tos.'],
      ['Dia amarillo (11-17 pts)', 'Dia regular. Sintomas moderados. Se reduce la intensidad.'],
      ['Dia rojo (>17 pts)', 'Mal dia. Sintomas importantes. Solo respiracion y relajacion suaves.'],
      ['Puntuacion (5-25)', 'Suma de 5 preguntas matutinas. Cada una de 1 (muy bien) a 5 (muy mal).'],
      ['Escala sintomas (1-5)', '1=muy bien, 2=bien, 3=normal, 4=mal, 5=muy mal.'],
      ['Inhalador de rescate', 'Cada uso indica dificultad respiratoria. Mas usos = peor control.'],
      ['Episodio de ahogo', 'Crisis respiratoria aguda. Activacion del flujo de emergencia.'],
    ],
    theme: 'striped', styles: { fontSize: 8 },
    headStyles: { fillColor: [100, 100, 100] },
    columnStyles: { 0: { cellWidth: 45 } },
  });

  const pageCount = doc.internal.getNumberOfPages();
  for (let i = 1; i <= pageCount; i++) {
    doc.setPage(i);
    doc.setFontSize(8); doc.setTextColor(150);
    doc.text(`Appbuelito | Pag ${i}/${pageCount} | Esta informacion no sustituye la atencion medica profesional.`,
      14, doc.internal.pageSize.height - 10);
  }

  const filename = `appbuelito_informe_${now.getFullYear()}${String(now.getMonth()+1).padStart(2,'0')}${String(now.getDate()).padStart(2,'0')}.pdf`;
  doc.save(filename);
}

function scoreLabel(score) {
  return { 1: 'Muy bien', 2: 'Bien', 3: 'Normal', 4: 'Mal', 5: 'Muy mal' }[score] || String(score);
}

// ── Helpers ──────────────────────────────────────────────
function matchDate(isoStr, flowDate) {
  if (!isoStr) return false;
  return isoStr.split('T')[0] === flowDate;
}

function scoreEmoji(score) {
  return { 1: '😊', 2: '🙂', 3: '😐', 4: '😟', 5: '😣' }[score] || String(score);
}

function escapeHtml(str) {
  const div = document.createElement('div');
  div.textContent = str;
  return div.innerHTML;
}

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
  const mins = Math.floor((Date.now() - date.getTime()) / 60000);
  if (mins < 60) return `hace ${mins} min`;
  const hours = Math.floor(mins / 60);
  if (hours < 24) return `hace ${hours}h`;
  return `hace ${Math.floor(hours / 24)} dia${Math.floor(hours/24) > 1 ? 's' : ''}`;
}

function toggleInterpretation() {
  const body = document.getElementById('interpretation-body');
  const arrow = document.getElementById('interpretation-arrow');
  const visible = body.style.display !== 'none';
  body.style.display = visible ? 'none' : 'block';
  arrow.classList.toggle('open', !visible);
}

function logout() {
  sessionStorage.removeItem('access_code');
  currentAccessCode = null;
  dashboardData = null;
  if (chartSymptoms) { chartSymptoms.destroy(); chartSymptoms = null; }
  if (chartDays) { chartDays.destroy(); chartDays = null; }
  if (chartInhaler) { chartInhaler.destroy(); chartInhaler = null; }
  document.getElementById('dashboard-screen').style.display = 'none';
  document.getElementById('login-screen').style.display = 'block';
  document.getElementById('access-code').value = '';
}

document.addEventListener('DOMContentLoaded', () => {
  checkUrlCode();
  const savedCode = sessionStorage.getItem('access_code');
  if (savedCode && typeof SUPABASE_URL !== 'undefined' && !SUPABASE_URL.includes('YOUR_PROJECT')) {
    document.getElementById('access-code').value = savedCode;
    validateCode();
  }
});
