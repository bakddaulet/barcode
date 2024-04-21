import 'package:equatable/equatable.dart';

class ProductImage extends Equatable {
  final String url;
  final String altText;

  const ProductImage({
    required this.url,
    required this.altText,
  });

  @override
  List<Object?> get props => [url, altText];

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      url: json['url'],
      altText: json['alt_text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'alt_text': altText,
    };
  }
}