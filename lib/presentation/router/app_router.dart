import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/checklist/checklist_screen.dart';
import '../screens/questionnaire/morning_questionnaire_screen.dart';
import '../screens/questionnaire/evening_questionnaire_screen.dart';
import '../screens/routine/routine_overview_screen.dart';
import '../screens/choking/choking_flow_screen.dart';
import '../screens/emergency/emergency_screen.dart';
import '../screens/history/history_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/inhaler/inhaler_registry_screen.dart';
import '../screens/blocks/block_detail_screen.dart';
import '../screens/history/day_detail_screen.dart';
import '../screens/settings/emergency_contacts_screen.dart';
import '../screens/settings/edit_profile_screen.dart';
import '../screens/settings/family_access_screen.dart';
import '../screens/report/report_screen.dart';
import '../screens/trends/trends_screen.dart';
import '../screens/inhaler/inhaler_history_screen.dart';
import '../../core/widgets/choking_fab.dart';

/// Shell wrapper that adds the "Me ahogo" FAB to all main screens.
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: ChokingFab(
        onPressed: () => context.pushNamed(RouteNames.chokingFlow),
      ),
    );
  }
}

/// Main app router configuration.
GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      // Splash (no shell)
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Onboarding (no shell)
      GoRoute(
        path: '/onboarding',
        name: RouteNames.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      // Choking flow (no shell - fullscreen)
      GoRoute(
        path: '/choking',
        name: RouteNames.chokingFlow,
        builder: (context, state) => const ChokingFlowScreen(),
      ),

      // Emergency (no shell - fullscreen)
      GoRoute(
        path: '/emergency',
        name: RouteNames.emergency,
        builder: (context, state) => const EmergencyScreen(),
      ),

      // Main app with shell (FAB + bottom nav)
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          // Home tab
          GoRoute(
            path: '/home',
            name: RouteNames.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                path: 'checklist',
                name: RouteNames.checklist,
                builder: (context, state) => const ChecklistScreen(),
              ),
              GoRoute(
                path: 'morning-questionnaire',
                name: RouteNames.morningQuestionnaire,
                builder: (context, state) => const MorningQuestionnaireScreen(),
              ),
              GoRoute(
                path: 'evening-questionnaire',
                name: RouteNames.eveningQuestionnaire,
                builder: (context, state) => const EveningQuestionnaireScreen(),
              ),
              GoRoute(
                path: 'routine',
                name: RouteNames.routineOverview,
                builder: (context, state) => const RoutineOverviewScreen(),
              ),
              GoRoute(
                path: 'inhaler',
                name: RouteNames.inhalerRegistry,
                builder: (context, state) => const InhalerRegistryScreen(),
                routes: [
                  GoRoute(
                    path: 'history',
                    name: RouteNames.inhalerHistory,
                    builder: (context, state) => const InhalerHistoryScreen(),
                  ),
                ],
              ),
              GoRoute(
                path: 'block/:blockId',
                name: RouteNames.block,
                builder: (context, state) {
                  final blockId = int.parse(state.pathParameters['blockId']!);
                  return BlockDetailScreen(blockId: blockId);
                },
              ),
            ],
          ),

          // History tab
          GoRoute(
            path: '/history',
            name: RouteNames.history,
            builder: (context, state) => const HistoryScreen(),
            routes: [
              GoRoute(
                path: 'day/:flowId',
                name: RouteNames.dayDetail,
                builder: (context, state) {
                  final flowId = int.parse(state.pathParameters['flowId']!);
                  return DayDetailScreen(flowId: flowId);
                },
              ),
              GoRoute(
                path: 'trends',
                name: RouteNames.trends,
                builder: (context, state) => const TrendsScreen(),
              ),
            ],
          ),

          // Settings tab
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'contacts',
                name: RouteNames.contacts,
                builder: (context, state) => const EmergencyContactsScreen(),
              ),
              GoRoute(
                path: 'edit-profile',
                name: RouteNames.editProfile,
                builder: (context, state) => const EditProfileScreen(),
              ),
              GoRoute(
                path: 'report',
                name: RouteNames.report,
                builder: (context, state) => const ReportScreen(),
              ),
              GoRoute(
                path: 'family-access',
                name: RouteNames.familyAccess,
                builder: (context, state) => const FamilyAccessScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Main shell with bottom navigation and the choking FAB.
class MainShell extends StatelessWidget {
  final Widget child;
  const MainShell({super.key, required this.child});

  int _currentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/history')) return 1;
    if (location.startsWith('/settings')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: ChokingFab(
        onPressed: () => context.pushNamed(RouteNames.chokingFlow),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex(context),
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              context.goNamed(RouteNames.home);
            case 1:
              context.goNamed(RouteNames.history);
            case 2:
              context.goNamed(RouteNames.settings);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: 'Historial',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
