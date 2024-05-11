part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartinitEvent extends CartEvent {}

final class CartAddEvent extends CartEvent {
  final BuildContext context;

  CartAddEvent({required this.context});
}

final class CartEditEvent extends CartEvent {
  final int index;
  final BuildContext context;

  CartEditEvent({required this.index, required this.context});
}

final class CartDeletEvent extends CartEvent {
  final int index;

  CartDeletEvent({required this.index});
}

final class CartIncreaseEvent extends CartEvent {
  final int index;

  CartIncreaseEvent({required this.index});
}

final class CartDecreaseEvent extends CartEvent {
  final int index;

  CartDecreaseEvent({required this.index});
}
