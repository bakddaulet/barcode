import 'package:auto_route/auto_route.dart';
import 'package:barcode/features/barcode/view/screen/barcode_page.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:barcode/features/product_details/view/screen/product_details_page.dart';
import 'package:barcode/features/products/view/screen/product_list_page.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: ProductListRoute.page,
        ),
         AutoRoute(
          page: BarcodeRoute.page,
        ),
        AutoRoute(
          page: ProductDetailsRoute.page,
        ),
      ];
}
