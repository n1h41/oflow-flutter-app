import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/device/presentation/views/device_view.dart';
import '../../features/device/presentation/views/history_view.dart';
import '../../features/device/presentation/views/schedule_view.dart';
import '../../features/home/presentation/views/home_view.dart';

class AppRouter {
  final _router = GoRouter(
    initialLocation: '/auth/sign-up',
    routes: [
      GoRoute(
        path: '/auth/sign-up',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/auth/sign-in',
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: '/device',
            builder: (context, state) => const DeviceView(),
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => const HistoryView(),
              ),
              GoRoute(
                path: '/schedule',
                builder: (context, state) => const ScheduleView(),
              )
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
