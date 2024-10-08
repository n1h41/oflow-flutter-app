import 'package:go_router/go_router.dart';
import 'package:oflow/features/device/presentation/views/device_view.dart';
import 'package:oflow/features/device/presentation/views/schedule_view.dart';
import 'package:oflow/features/home/presentation/views/home_view.dart';

import '../../features/device/presentation/views/history_view.dart';

class AppRouter {
  final _router = GoRouter(
    routes: [
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
