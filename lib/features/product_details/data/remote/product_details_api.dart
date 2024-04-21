import 'package:barcode/core/const/api_const.dart';
import 'package:barcode/core/errors/dio_exception.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDetailsApi {
  Future<ProductDetailsModel> getProductDetails();
}

@LazySingleton(as: ProductDetailsApi)
class ProductListImplApi implements ProductDetailsApi {
  late final Dio dio;

  ProductListImplApi(this.dio);

  @override
  Future<ProductDetailsModel> getProductDetails() async {
    try {
      final response = (await dio.get(SERVER+EndPoints.productDetails));
      if (response.data == null) {
        throw ServerException(message: 'Ошибка');
      }

      

      return ProductDetailsModel.fromJson(response.data);
    } on DioException {
      throw ServerException(message: 'Ошибка');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: 'Ошибка');
    }
  }
}
