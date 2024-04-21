import 'package:barcode/core/errors/dio_exception.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/products/data/remote/product_list_api.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ProductListRepository {
  Future<Either<Failure, List<ProductItemModel>>> getProductList();
}

@LazySingleton(as: ProductListRepository)
class ProductListRepositoryImpl implements ProductListRepository {
  final ProductListApi remoteDS;

  ProductListRepositoryImpl({
    required this.remoteDS,
  });

  @override
  Future<Either<Failure, List<ProductItemModel>>> getProductList() async {
    try {
      final result = await remoteDS.getProducts();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
