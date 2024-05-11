import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/features/cart/domain/entities/cart.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:hive_bloc/features/cart/presentation/widgets/cart_list_item_widget.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(CartinitEvent());

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CartError) {
          return const Center(child: Text('No items in the cart'));
        }
        if (state is CartGetData) {
          List<CartProduct> cartProducts = state.cartProducts;
          return ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              return CartListItemWidget(
                  item: cartProducts[index], index: index);
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
