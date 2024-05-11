import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/features/cart/domain/entities/cart.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';

class EditPage extends StatelessWidget {
  final CartProduct cartProduct;
  final int index;

  const EditPage({required this.cartProduct, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Cart Item'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          CartBloc cartbloc = context.read<CartBloc>();
          cartbloc.nameUpdateController.text = cartProduct.title;
          cartbloc.priceUpdateController.text = cartProduct.price.toString();
          cartbloc.quantityUpdateController.text =
              cartProduct.quantity.toString();

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: cartbloc.nameUpdateController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: cartbloc.priceUpdateController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: cartbloc.quantityUpdateController,
                  decoration: const InputDecoration(labelText: 'Quantity'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartEditEvent(index: index, context: context));
                  },
                  child: const Text('Save Changes'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
