import 'package:hive/hive.dart';

part 'Cart_Product_model.g.dart';

@HiveType(typeId: 1)
class CartProductModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final double price;
  @HiveField(2)
  int quantity;

  CartProductModel({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
