part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartError extends CartState {}

final class CartGetData extends CartState {
  final List<CartProduct> cartProducts;

  CartGetData({required this.cartProducts});
}
