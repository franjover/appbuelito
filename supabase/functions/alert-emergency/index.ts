// Supabase Edge Function: alert-emergency
// Sends email alerts to family members when an emergency event is recorded.
// Triggered via Supabase Database Webhook on INSERT into synced_emergency_events.
//
// Required secrets:
//   supabase secrets set RESEND_API_KEY=re_...
//
// Setup webhook in Supabase Dashboard:
//   Database → Webhooks → Create webhook
//   Table: synced_emergency_events, Event: INSERT
//   URL: https://<project-ref>.supabase.co/functions/v1/alert-emergency

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

interface EmergencyPayload {
  type: 'INSERT';
  table: string;
  record: {
    id: number;
    patient_id: string;
    timestamp: string;
    type: string;
    contact_called: string | null;
    result: string | null;
  };
}

Deno.serve(async (req: Request) => {
  // Only accept POST from Supabase webhooks
  if (req.method !== 'POST') {
    return new Response('Method not allowed', { status: 405 });
  }

  const resendKey = Deno.env.get('RESEND_API_KEY');
  if (!resendKey) {
    console.error('RESEND_API_KEY not set');
    return new Response('Server misconfigured', { status: 500 });
  }

  let payload: EmergencyPayload;
  try {
    payload = await req.json();
  } catch {
    return new Response('Invalid JSON', { status: 400 });
  }

  if (payload.type !== 'INSERT' || !payload.record) {
    return new Response('OK (skipped)', { status: 200 });
  }

  const event = payload.record;
  const patientId = event.patient_id;

  // Init Supabase admin client
  const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
  const serviceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
  const sb = createClient(supabaseUrl, serviceKey);

  // Get patient name
  const { data: patient } = await sb
    .from('patients')
    .select('name')
    .eq('id', patientId)
    .single();

  const patientName = patient?.name ?? 'tu familiar';

  // Get family_access rows with alert_on_emergency = true and email set
  const { data: recipients, error } = await sb
    .from('family_access')
    .select('email, label')
    .eq('patient_id', patientId)
    .eq('alert_on_emergency', true)
    .eq('is_active', true)
    .not('email', 'is', null);

  if (error) {
    console.error('Error querying family_access:', error);
    return new Response('DB error', { status: 500 });
  }

  if (!recipients || recipients.length === 0) {
    return new Response('No recipients', { status: 200 });
  }

  const eventDate = new Date(event.timestamp).toLocaleString('es-ES', {
    dateStyle: 'full', timeStyle: 'short', timeZone: 'Europe/Madrid',
  });

  const emailPromises = recipients.map(async (r: { email: string; label: string }) => {
    const html = `
      <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto;">
        <h2 style="color: #C62828;">🚨 Alerta de emergencia - Appbuelito</h2>
        <p>Hola ${r.label},</p>
        <p><strong>${patientName}</strong> ha activado el sistema de emergencia.</p>
        <table style="border-collapse: collapse; width: 100%; margin: 16px 0;">
          <tr>
            <td style="padding: 8px; border: 1px solid #eee; color: #666;">Fecha y hora</td>
            <td style="padding: 8px; border: 1px solid #eee;">${eventDate}</td>
          </tr>
          <tr>
            <td style="padding: 8px; border: 1px solid #eee; color: #666;">Tipo</td>
            <td style="padding: 8px; border: 1px solid #eee;">${event.type}</td>
          </tr>
          ${event.contact_called ? `<tr>
            <td style="padding: 8px; border: 1px solid #eee; color: #666;">Contacto llamado</td>
            <td style="padding: 8px; border: 1px solid #eee;">${event.contact_called}</td>
          </tr>` : ''}
        </table>
        <p style="color: #666; font-size: 13px;">Este aviso se ha generado automaticamente desde Appbuelito.<br>
        Esta informacion no sustituye la atencion medica profesional.</p>
      </div>`;

    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${resendKey}`,
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        from: 'Appbuelito <alertas@appbuelito.es>',
        to: [r.email],
        subject: `🚨 Emergencia: ${patientName} - ${new Date(event.timestamp).toLocaleDateString('es-ES')}`,
        html,
      }),
    });

    if (!res.ok) {
      const err = await res.text();
      console.error(`Failed to send to ${r.email}:`, err);
    } else {
      console.log(`Alert sent to ${r.email}`);
    }
  });

  await Promise.all(emailPromises);
  return new Response('Alerts sent', { status: 200 });
});
