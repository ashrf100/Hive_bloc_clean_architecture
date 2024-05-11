import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().clearTextControllers();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Cart Item'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          CartBloc cartbloc = context.read<CartBloc>();
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: cartbloc.nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: cartbloc.priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: cartbloc.quantityController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartAddEvent(context: context));
                  },
                  child: const Text('Add Item'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
