import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_bloc/core/const.dart';
import 'package:hive_bloc/features/cart/domain/entities/cart.dart';
import 'package:hive_bloc/features/cart/domain/usecase/cart_usecases.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final DeletFromCartUseCase deletFromCartUseCase;
  final EditToCartCartUseCase editToCartCartUseCase;
  final CartIncreaseUseCase cartIncreaseUseCase;
  final CartDecreaseUseCase cartDecreaseUseCase;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();

  final nameUpdateController = TextEditingController();
  final priceUpdateController = TextEditingController();
  final quantityUpdateController = TextEditingController();

  CartBloc({
    required this.getCartUseCase,
    required this.addToCartUseCase,
    required this.deletFromCartUseCase,
    required this.editToCartCartUseCase,
    required this.cartIncreaseUseCase,
    required this.cartDecreaseUseCase,
  }) : super(CartInitial()) {
    on<CartinitEvent>((event, emit) {
      _handleGetData(emit);
    });

    on<CartAddEvent>((event, emit) {
      CartProduct cartProduct = CartProduct(
        title: nameController.text,
        price: double.parse(priceController.text),
        quantity: int.parse(quantityController.text),
      );
      addToCartUseCase.call(cartProduct: cartProduct);
      _handleGetData(emit);
      Navigator.pop(event.context);
    });

    on<CartEditEvent>((event, emit) {
      CartProduct cartProduct = CartProduct(
        title: nameUpdateController.text,
        price: double.parse(priceUpdateController.text),
        quantity: int.parse(quantityUpdateController.text),
      );
      editToCartCartUseCase.call(cartProduct: cartProduct, index: event.index);
      _handleGetData(emit);
      Navigator.pop(event.context);
    });

    on<CartDeletEvent>((event, emit) {
      deletFromCartUseCase.call(index: event.index);
      _handleGetData(emit);
    });

    on<CartIncreaseEvent>((event, emit) {
      cartIncreaseUseCase.call(index: event.index);
      _handleGetData(emit);
    });
    on<CartDecreaseEvent>((event, emit) {
      cartDecreaseUseCase.call(index: event.index);
      _handleGetData(emit);
    });
  }

  void _handleGetData(Emitter<CartState> emit) {
    List<CartProduct> cartProducts = getCartUseCase.call(box: boxName);
    if (cartProducts.isNotEmpty) {
      emit(CartGetData(cartProducts: cartProducts));
    } else {
      emit(CartError());
    }
  }

  void clearTextControllers() {
    nameController.clear();
    priceController.clear();
    quantityController.clear();
  }
}
