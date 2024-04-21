import 'package:auto_route/auto_route.dart';
import 'package:barcode/core/router/app_router.dart';
import 'package:barcode/features/products/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.products,
  });

  final List<ProductItemModel> products;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
        onRefresh: () async {
          BlocProvider.of<ProductListBloc>(context)
            .add(GetProductList());
        },
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductItemCard(product: products[index]);
          },
        ));
  }
}

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.product,
  });

  final ProductItemModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(const BarcodeRoute()),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        margin: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.barcode_reader),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Цена:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text('${product.price} тг'),
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Категория:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(product.category),
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Вес:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(product.weight),
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Срок годности:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text(product.expiry),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}