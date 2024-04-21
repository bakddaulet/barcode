import 'package:auto_route/auto_route.dart';
import 'package:barcode/core/errors/error_widget.dart';
import 'package:barcode/core/utils/app_loading_widget.dart';
import 'package:barcode/features/products/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:barcode/features/products/view/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список продуктов'),
        ),
        body: BlocConsumer<ProductListBloc, ProductListState>(
          bloc: BlocProvider.of<ProductListBloc>(context)
            ..add(GetProductList()),
          listener: (context, state) {
            if (state is ProductListError) {
              showErrorSnackbar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is ProductListLoaded) {
              final List<ProductItemModel> products = state.productList;
              return ProductList(products: products);
            } else {
              return const AppLoadingWidget();
            }
          },
        ));
  }
}
