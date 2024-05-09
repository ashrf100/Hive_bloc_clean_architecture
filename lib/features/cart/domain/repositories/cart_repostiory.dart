import 'package:hive_bloc/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  List<CartProduct> getCart(String box);
  void addToCart(CartProduct cartProduct);
  void deleteFromCart(int index);
  void editToCart(int index, CartProduct cartProduct);
  void cartIncrease(int index);
  void cartDecrease(int index);
}
