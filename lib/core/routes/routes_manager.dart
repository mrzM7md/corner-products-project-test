import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          path: "/",
          builder: (context, parentState) {
            return const ProductsCategoriesScreen();
          },
        ),
      ]);
}