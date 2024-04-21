import 'package:barcode/core/errors/dio_exception.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/product_details/data/remote/product_details_api.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure,ProductDetailsModel>> getProductDetails();
}

@LazySingleton(as: ProductDetailsRepository)
class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  final ProductDetailsApi remoteDS;

  ProductDetailsRepositoryImpl({
    required this.remoteDS,
  });

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails() async {
    try {
      final result = await remoteDS.getProductDetails();

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
