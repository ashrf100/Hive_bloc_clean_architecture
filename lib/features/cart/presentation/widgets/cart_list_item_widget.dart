import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/core/app_routes.dart';
import 'package:hive_bloc/features/cart/domain/entities/cart.dart';
import 'package:hive_bloc/features/cart/presentation/bloc/cart_bloc.dart';

class CartListItemWidget extends StatelessWidget {
  final CartProduct item;
  final int index;

  const CartListItemWidget({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.editPage,
              arguments: {"cartProduct": item, "index": index});
        },
        title: Text(item.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: \$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text('Quantity: '),
                IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartDecreaseEvent(index: index));
                  },
                  icon: const Icon(Icons.remove),
                ),
                Text(item.quantity.toString()),
                IconButton(
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(CartIncreaseEvent(index: index));
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<CartBloc>().add(CartDeletEvent(index: index));
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
