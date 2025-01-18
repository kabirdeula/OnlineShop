import 'package:flutter/material.dart';
import 'package:online_shop/features/home/home.dart';
import 'package:online_shop/features/product/product.dart';

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
      GoRoute(
        path: AppRoutes.productDetail.path,
        name: AppRoutes.productDetail.name,
        builder: (context, state) {
          final product = state.extra as Product?;
          if (product == null) {
            // Handle the case where product is null
            return const Scaffold(
              body: Center(child: Text('Product not found.')),
            );
          }
          return ProductDetailScreen(
            product: product,
          );
        },
      ),
    ],
  );
}
