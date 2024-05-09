import 'package:hive/hive.dart';
import 'package:hive_bloc/features/cart/data/model/Cart_Product_model.dart';

abstract class CartlocalDataSource {
  Box<CartProductModel> getCart(String box);
  void addToCart(CartProductModel cartProduct);
  void deleteFromCart(int index);
  void editToCart(int index, CartProductModel cartProduct);
  void cartIncrease(int index);
  void cartDecrease(int index);
}

class CartlocalDataSourceHttp implements CartlocalDataSource {
  final Box<CartProductModel> box;

  CartlocalDataSourceHttp({required this.box});

  @override
  void addToCart(CartProductModel cartProduct) {
    box.add(cartProduct);
  }

  @override
  void cartDecrease(int index) {
    CartProductModel item = box.getAt(index)!;
    item.quantity--;
    box.putAt(index, item);
  }

  @override
  void cartIncrease(int index) {
    CartProductModel item = box.getAt(index)!;
    item.quantity++;
    box.putAt(index, item);
  }

  @override
  void deleteFromCart(int index) {
    box.deleteAt(index);
  }

  @override
  void editToCart(int index, CartProductModel cartProduct) {
    box.putAt(index, cartProduct);
  }

  @override
  Box<CartProductModel> getCart(String box) {
    return Hive.box<CartProductModel>(box);
  }
}
