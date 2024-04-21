import 'package:barcode/core/base_usecase.dart';
import 'package:barcode/core/errors/failure.dart';
import 'package:barcode/features/product_details/domain/models/product_details_model.dart';
import 'package:barcode/features/product_details/domain/usecase/get_product_details_usecase.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

@singleton
class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  final GetProductDetailsUseCase getProductDetailsUseCase;

  BarcodeBloc(this.getProductDetailsUseCase) : super(BarcodeInitial()) {
    late ProductDetailsModel product;
    on<GetProduct>((event, emit) async {
      emit(BarcodeLoading());
      final productResult = await getProductDetailsUseCase.call(NoParams());
      productResult.fold(
          (l) => emit(BarcodeError(errorMessage: mapFailureToMessage(l))), (r) {
        product = r;
        emit(BarcodeLoaded());
      });
    });
    on<BarCodeScan>((event, emit) async {
      emit(BarcodeLoading());
      if (product.barcodes.contains(event.barcode)) {
        emit(BarcodeSuccess(product: product));
                emit(BarcodeLoaded());

      } else {
        emit(const BarcodeError(errorMessage: 'Не подходящий баркод'));
                emit(BarcodeLoaded());

      }
    });
  }
}
