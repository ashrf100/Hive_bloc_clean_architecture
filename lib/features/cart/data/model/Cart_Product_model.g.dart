// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cart_Product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductModelAdapter extends TypeAdapter<CartProductModel> {
  @override
  final int typeId = 1;

  @override
  CartProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductModel(
      name: fields[0] as String,
      price: fields[1] as double,
      quantity: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
