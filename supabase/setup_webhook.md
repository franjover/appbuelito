# Configurar alertas de emergencia por email

## 1. Cuenta Resend
1. Regístrate en https://resend.com (plan gratuito: 3.000 emails/mes)
2. Verifica un dominio o usa el dominio de prueba de Resend
3. Crea una API key en Dashboard → API Keys

## 2. Deploy Edge Function
```bash
# Desde la raíz del proyecto
npx supabase functions deploy alert-emergency --project-ref elcbtkmcwoitsmqeztdd
npx supabase secrets set RESEND_API_KEY=re_xxxx --project-ref elcbtkmcwoitsmqeztdd
```

## 3. Configurar Database Webhook en Supabase Dashboard
1. Ve a: Database → Webhooks → Create webhook
2. Nombre: `alert_on_emergency`
3. Tabla: `synced_emergency_events`
4. Evento: `INSERT`
5. URL: `https://elcbtkmcwoitsmqeztdd.supabase.co/functions/v1/alert-emergency`
6. Headers: `{ "Authorization": "Bearer <SERVICE_ROLE_KEY>" }`

## 4. Verificar
- Registra un evento de emergencia en la app
- Comprueba los logs: Dashboard → Edge Functions → alert-emergency → Logs

## Notas
- El from del email debe ser un dominio verificado en Resend
- Durante desarrollo puedes usar `onboarding@resend.dev` como remitente
- Los familiares activan las alertas desde el portal web → sección "Mis alertas"
