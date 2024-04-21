import 'package:equatable/equatable.dart';

class ProductItemModel extends Equatable {
  final int id;
  final String name;
  final double price;
  final String category;
  final String weight;
  final String expiry;

  const ProductItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.weight,
    required this.expiry,
  });

  @override
  List<Object?> get props => [id, name, price, category, weight, expiry];
  
  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      category: json['category'],
      weight: json['weight'],
      expiry: json['expiry'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'category': category,
      'weight': weight,
      'expiry': expiry,
    };
  }
}
