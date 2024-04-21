import 'package:barcode/core/base_usecase.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:barcode/features/product_details/domain/repository/product_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@lazySingleton

class GetProductDetailsUseCase
    extends UseCase<Either<Failure, ProductDetailsModel>, NoParams> {
  final ProductDetailsRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, ProductDetailsModel>> call(NoParams params) async {
    return await repository.getProductDetails();
  }
}
