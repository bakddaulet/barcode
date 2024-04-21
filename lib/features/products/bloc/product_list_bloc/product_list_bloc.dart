// ignore_for_file: depend_on_referenced_packages

import 'package:barcode/core/base_usecase.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/products/domain/models/product_list_model.dart';
import 'package:barcode/features/products/domain/usecase/get_products_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

@singleton
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductListUseCase getProductListUseCase;
  ProductListBloc({required this.getProductListUseCase})
      : super(ProductListInitial()) {
    on<GetProductList>(
      (event, emit) async {
        emit(ProductListLoading());
        final result = await getProductListUseCase.call(NoParams());
        result.fold((l) {
          emit(ProductListError(errorMessage: mapFailureToMessage(l)));
        }, (r) {
          emit(ProductListLoaded(productList: r));
        });
      },
    );
  }
}
