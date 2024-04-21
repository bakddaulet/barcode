import 'package:auto_route/auto_route.dart';
import 'package:barcode/features/product_details/domain/models/nutrition_info_model.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductDetailsModel product;

  @override
  Widget build(BuildContext context) {
    final NutritionalInfo nutrition = product.nutritionalInfo;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Тип: ${product.type}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Цена: ${product.price.toStringAsFixed(1)} тг',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Штрих-коды:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            ...product.barcodes
                .map(
                  (e) => Text(e),
                )
                .toList(),
            const SizedBox(height: 16.0),
            const Text(
              'Описание:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(product.description),
            const SizedBox(height: 16.0),
            const Text(
              'Пищевая информация (на 100 г):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text('Калории: ${nutrition.calories}'),
            Text('Жиры: ${nutrition.fat} г'),
            Text('Углеводы: ${nutrition.carbohydrates} г'),
            Text('Белки: ${nutrition.protein} г'),
            const SizedBox(height: 16.0),
            const Text(
              'Изображения:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
             SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: AspectRatio(
                                                        aspectRatio: 10 / 9, 
                          
                            child: Image.network(
                              product.images[index].url,
                              width: 200.0,
                              height: 300.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(product.images[index].altText),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
