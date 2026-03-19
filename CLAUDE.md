# Appbuelito - CLAUDE.md

## Project Overview
App de acompañamiento diario para pacientes con EPOC (Enfermedad Pulmonar Obstructiva Crónica). Diseñada para personas mayores hispanohablantes con enfoque en accesibilidad.

**Stack**: Flutter 3.11+ / Dart / Riverpod / Drift (SQLite) / GoRouter

## Architecture
Clean Architecture with 4 layers:
- **lib/core/**: Constants, theme, reusable widgets
- **lib/data/**: Database (Drift ORM), DAOs, preferences, models
- **lib/domain/**: Business logic services (DailyFlowService, RoutineEngine, EmergencyService, NotificationService, VideoSourceService)
- **lib/presentation/**: Providers (Riverpod), router (GoRouter), screens

## Key Concepts
- **Daily Flow State Machine**: checklist → morningQuestionnaire → routineActive → eveningQuestionnaire → archived
- **Day Classification**: Green (≤10 pts), Yellow (≤17 pts), Red (>17 pts) — determines exercise difficulty
- **Routine Engine**: Generates 5 daily exercise blocks adapted to classification and historical tolerance
- **8AM Reset Rule**: Before 8AM, the app considers it "yesterday" for flow purposes
- **Choking Flow ("Me ahogo")**: Guided breathing emergency response with escalation protocol

## Build & Run Commands
```bash
# Install dependencies
flutter pub get

# Run code generation (Drift, Freezed, Riverpod)
dart run build_runner build --delete-conflicting-outputs

# Run app
flutter run

# Run tests
flutter test

# Analyze code
flutter analyze
```

## Code Generation
This project uses `build_runner` for:
- **Drift**: Database tables & DAOs (`.g.dart` files)
- **Freezed**: Immutable models (`.freezed.dart` files)
- **Riverpod Generator**: Provider code generation
- **JSON Serializable**: JSON serialization

Always run `dart run build_runner build --delete-conflicting-outputs` after modifying tables, models, or annotated providers.

## UI Guidelines
- **Minimum text size**: 18sp body, 24sp titles
- **Minimum touch target**: 56dp buttons
- **High contrast**: Use semantic colors from `AppColors`
- **Language**: All UI text in Spanish
- **Emojis in UI**: Used for Likert scales and visual cues (breathing exercises)

## Database
- Drift ORM with SQLite via `sqlite3_flutter_libs`
- 14 tables defined in `lib/data/local/database/tables/`
- 6 DAOs in `lib/data/local/database/daos/`
- Database singleton via Riverpod provider

## Navigation
- GoRouter with named routes (30 routes in `RouteNames`)
- Shell route for main app (bottom nav + ChokingFAB)
- Fullscreen overlays for emergency flows

## Screens (16 total)
- **Splash**: Auto-init, onboarding check, flow creation
- **Onboarding**: 5-step wizard (welcome, personal, health, contact, summary)
- **Home**: Hub with day classification, next action, quick access
- **Checklist**: Mandatory/optional prep items with warnings
- **Morning Questionnaire**: 5 questions → day classification → routine generation
- **Routine Overview**: 5 blocks with status, navigate to block detail
- **Block Detail**: Execute exercises with timer, feedback form per task
- **Evening Questionnaire**: Day review + archive flow
- **Choking Flow**: Guided breathing (4s-2s-6s), up to 3 micro-sessions, escalation
- **Emergency**: Long-press call, SMS to contacts, 112 fallback
- **Inhaler Registry**: Log puffs, context, relief level
- **History**: Archived days list with classification colors
- **Day Detail**: Full summary of an archived day (blocks, inhaler, episodes)
- **Settings**: Profile summary, navigation to sub-screens
- **Edit Profile**: Edit patient info (name, diagnosis, meds, oxygen, etc.)
- **Emergency Contacts**: Add/edit/delete contacts

## Android Config
- `minSdk`: 21
- Permissions: CALL_PHONE, SEND_SMS, POST_NOTIFICATIONS, VIBRATE, SCHEDULE_EXACT_ALARM, INTERNET

## Dependencies (Key)
- `flutter_riverpod` / `riverpod_annotation`: State management
- `drift` / `drift_dev`: Database ORM
- `go_router`: Navigation
- `freezed_annotation` / `freezed`: Immutable models
- `video_player` / `chewie`: Exercise videos
- `flutter_local_notifications`: Daily reminders
- `fl_chart`: Health data charts
- `pdf` / `printing`: Report generation
- `share_plus`: Report sharing
- `url_launcher`: Phone calls / SMS
- `permission_handler`: Runtime permissions

## Conventions
- Spanish for all user-facing strings
- English for code (variable names, comments)
- Riverpod for all state management
- Streams (watchable queries) for reactive UI
- All screens in separate folders under `lib/presentation/screens/`
- Widgets specific to a screen go in a `widgets/` subfolder
