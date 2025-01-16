import 'package:online_shop/features/home/home.dart';
import 'package:online_shop/routes/app_routes.dart';

import 'routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.initial.path,
    routes: [
      GoRoute(
        path: AppRoutes.initial.path,
        name: AppRoutes.initial.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
