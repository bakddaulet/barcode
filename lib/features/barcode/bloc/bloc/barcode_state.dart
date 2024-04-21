part of 'barcode_bloc.dart';

sealed class BarcodeState extends Equatable {
  const BarcodeState();

  @override
  List<Object> get props => [];
}

final class BarcodeInitial extends BarcodeState {}

final class BarcodeLoading extends BarcodeState {}

final class BarcodeLoaded extends BarcodeState {}

final class BarcodeSuccess extends BarcodeState {
  final ProductDetailsModel product;

  const BarcodeSuccess({required this.product});
}

final class BarcodeError extends BarcodeState {
  final String errorMessage;

  const BarcodeError({required this.errorMessage});
}
