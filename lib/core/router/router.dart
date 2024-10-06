import 'package:go_router/go_router.dart';
import 'package:oflow/features/home/presentation/views/home_view.dart';

class AppRouter {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );

  GoRouter get router => _router;
}
