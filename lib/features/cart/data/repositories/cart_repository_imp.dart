import 'package:hive_bloc/features/cart/data/datasources/cart_local_data_source.dart';
import 'package:hive_bloc/features/cart/data/model/Cart_Product_model.dart';
import 'package:hive_bloc/features/cart/domain/entities/cart.dart';
import 'package:hive_bloc/features/cart/domain/repositories/cart_repostiory.dart';

class CartRepositoryImpl implements CartRepository {
  final CartlocalDataSource cartlocalDataSource;

  CartRepositoryImpl({required this.cartlocalDataSource});

  @override
  void addToCart(CartProduct cartProduct) {
    cartlocalDataSource.addToCart(CartProductModel(
        name: cartProduct.title,
        price: cartProduct.price,
        quantity: cartProduct.quantity));
  }

  @override
  void cartDecrease(int index) {
    cartlocalDataSource.cartDecrease(index);
  }

  @override
  void cartIncrease(int index) {
    cartlocalDataSource.cartIncrease(index);
  }

  @override
  void deleteFromCart(int index) {
    cartlocalDataSource.deleteFromCart(index);
  }

  @override
  void editToCart(int index, CartProduct cartProduct) {
    cartlocalDataSource.editToCart(
      index,
      CartProductModel(
        name: cartProduct.title,
        price: cartProduct.price,
        quantity: cartProduct.quantity,
      ),
    );
  }

  @override
  List<CartProduct> getCart(String box) {
    var cartProductModel = cartlocalDataSource.getCart(box);

    List<CartProduct> cartProduct = cartProductModel.values
        .map((e) => CartProduct(
              title: e.name,
              price: e.price,
              quantity: e.quantity,
            ))
        .toList();

    return cartProduct;
  }
}
