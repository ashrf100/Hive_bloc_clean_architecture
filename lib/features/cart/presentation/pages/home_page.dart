import 'package:flutter/material.dart';
import 'package:hive_bloc/core/app_routes.dart';
import 'package:hive_bloc/features/cart/presentation/widgets/cart_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addPage);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Cart Items'),
      ),
      body: const CartListWidget(),
    );
  }
}
