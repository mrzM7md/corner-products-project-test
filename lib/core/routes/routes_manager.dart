import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_corner_products/core/routes/app_routes.dart';
import 'package:test_corner_products/features/products_categories/presentation/product_details_screen.dart';
import 'package:test_corner_products/features/products_categories/presentation/products_categories_screen.dart';
import 'package:test_corner_products/page_404.dart';

class RoutesManager {
  static final GoRouter router = GoRouter(initialLocation: "/",
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Page404(),
        );
      },
      routes: [
        GoRoute(
            path: AppRoutes.mainRouter,
            builder: (context, parentState) {
              return const ProductsCategoriesScreen();
            },
            routes: [
              GoRoute(
                name: AppRoutes.detailsRouter,
                path: "${AppRoutes.detailsRouter}/:product_id",
                builder: (context, state) {
                  String productId = state.pathParameters['product_id']!;
                  return ProductDetailsScreen(productId: productId);
                },
              ),
            ])
      ]);
}