import 'package:flutter/material.dart';
import 'package:hive_bloc/core/app_routes.dart';

import 'package:hive_bloc/features/cart/presentation/pages/add_page.dart';
import 'package:hive_bloc/features/cart/presentation/pages/edit_page.dart';
import 'package:hive_bloc/features/cart/presentation/pages/home_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.addPage:
        return MaterialPageRoute(builder: (_) => const AddPage());

      case AppRoutes.editPage:
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
              builder: (_) => EditPage(
                  cartProduct: args['cartProduct'], index: args['index']));
        }

        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Page not found!')),
      );
    });
  }
}
