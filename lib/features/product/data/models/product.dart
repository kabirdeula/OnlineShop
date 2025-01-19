import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@HiveType(typeId: 0)
@freezed
class Product with _$Product {
  @HiveType(typeId: 0)
  const factory Product({
    @HiveField(0) required int id,
    @HiveField(1) required String title,
    @HiveField(2) required String description,
    @HiveField(3) required String image,
    @HiveField(4) required double price,
    @HiveField(5) required double size,
    @HiveField(6) required String color,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
