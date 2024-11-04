import 'package:go_router/go_router.dart';

import '../../features/device/presentation/views/device_view.dart';
import '../../features/device/presentation/views/history_view.dart';
import '../../features/device/presentation/views/schedule_view.dart';
import '../../features/home/presentation/views/home_view.dart';

class AppRouter {
  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: '/device/:deviceMac',
            builder: (context, state) => DeviceView(
              deviceMac: state.pathParameters['deviceMac']!,
            ),
            routes: [
              GoRoute(
                path: '/history',
                builder: (context, state) => HistoryView(
                  deviceMac: state.pathParameters['deviceMac']!,
                ),
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
