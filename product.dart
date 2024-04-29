import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String name;
  double price;

  Product(this.id, this.name, this.price);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

void main() {
  
  Product product = Product(1, 'Laptop', 1500.0);
  print(' before serialization: $product');

  String jsonProduct = json.encode(product.toJson());
  print(' after serialization: $jsonProduct');

  Product decodedProduct = Product.fromJson(json.decode(jsonProduct));
  print(' after deserialization: $decodedProduct');
}
