import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oflow/core/service_locator.dart';
import 'package:oflow/features/device/data/mqtt_service.dart';
import 'package:oflow/features/device/presentation/bloc/device_bloc.dart';

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
          ShellRoute(
            builder: (_, __, child) => BlocProvider<DeviceBloc>(
              create: (context) => DeviceBloc(
                mqttService: getIt<MqttService>(),
              ),
              child: child,
            ),
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
                    builder: (context, state) => ScheduleView(
                      deviceMac: state.pathParameters['deviceMac']!,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
