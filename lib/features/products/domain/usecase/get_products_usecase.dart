import 'package:barcode/core/base_usecase.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:barcode/features/products/domain/repository/product_lists_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
@lazySingleton

class GetProductListUseCase
    extends UseCase<Either<Failure, List<ProductItemModel>>, NoParams> {
  final ProductListRepository repository;

  GetProductListUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProductItemModel>>> call(NoParams params) async {
    return await repository.getProductList();
  }
}
