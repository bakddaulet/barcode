import 'package:barcode/features/product_details/domain/models/nutrition_info_model.dart';
import 'package:barcode/features/product_details/domain/models/product_image_model.dart';
import 'package:equatable/equatable.dart';

class ProductDetailsModel extends Equatable {
  final String name;
  final String type;
  final double price;
  final List<String> barcodes;
  final String description;
  final NutritionalInfo nutritionalInfo;
  final List<ProductImage> images;

  const ProductDetailsModel({
    required this.name,
    required this.type,
    required this.price,
    required this.barcodes,
    required this.description,
    required this.nutritionalInfo,
    required this.images,
  });

  @override
  List<Object?> get props => [
        name,
        type,
        price,
        barcodes,
        description,
        nutritionalInfo,
        images,
      ];

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    List<String> barcodes = [];
    if (json['barcodes'] != null) {
      barcodes = List<String>.from(json['barcodes']);
    }

    List<ProductImage> images = [];
    if (json['images'] != null) {
      images = List<ProductImage>.from(
          json['images'].map((imageJson) => ProductImage.fromJson(imageJson)));
    }

    return ProductDetailsModel(
      name: json['name'],
      type: json['type'],
      price: json['price'].toDouble(),
      barcodes: barcodes,
      description: json['description'],
      nutritionalInfo: NutritionalInfo.fromJson(json['nutritional_info']),
      images: images,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'price': price,
      'barcodes': barcodes,
      'description': description,
      'nutritional_info': nutritionalInfo.toJson(),
      'images': images.map((image) => image.toJson()).toList(),
    };
  }
}