import 'package:barcode/core/const/api_const.dart';
import 'package:barcode/core/errors/dio_exception.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ProductListApi {
  Future<List<ProductItemModel>> getProducts();
}

@LazySingleton(as: ProductListApi)
class ProdcutListImplApi implements ProductListApi {
  late final Dio dio;

  ProdcutListImplApi(this.dio);

  @override
  Future<List<ProductItemModel>> getProducts() async {
    try {
      final response = (await dio.get(SERVER+EndPoints.productList));
      if (response.data == null) {
        throw ServerException(message: 'Ошибка');
      }

      final List<dynamic> results = response.data as List<dynamic>;

      return results.map((json) => ProductItemModel.fromJson(json)).toList();
    } on DioException {
      throw ServerException(message: 'Ошибка');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Ошибка');
    }
  }
}
