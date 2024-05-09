import 'package:hive_bloc/features/cart/domain/repositories/cart_repostiory.dart';

import '../entities/cart.dart';

class GetCartUseCase {
  final CartRepository repostiory;

  GetCartUseCase({required this.repostiory});

  List<CartProduct> call({required String box}) {
    return repostiory.getCart(box);
  }
}

class AddToCartUseCase {
  final CartRepository repostiory;

  AddToCartUseCase({required this.repostiory});

  void call({required CartProduct cartProduct}) {
    return repostiory.addToCart(cartProduct);
  }
}

class DeletFromCartUseCase {
  final CartRepository repostiory;

  DeletFromCartUseCase({required this.repostiory});

  void call({required int index}) {
    return repostiory.deleteFromCart(index);
  }
}

class EditToCartCartUseCase {
  final CartRepository repostiory;

  EditToCartCartUseCase({required this.repostiory});

  void call({required int index, required CartProduct cartProduct}) {
    return repostiory.editToCart(index, cartProduct);
  }
}

class CartIncreaseUseCase {
  final CartRepository repostiory;

  CartIncreaseUseCase({required this.repostiory});

  void call({required int index}) {
    return repostiory.cartIncrease(index);
  }
}

class CartDecreaseUseCase {
  final CartRepository repostiory;

  CartDecreaseUseCase({required this.repostiory});

  void call({required int index}) {
    return repostiory.cartDecrease(index);
  }
}
