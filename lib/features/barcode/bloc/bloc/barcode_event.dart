part of 'barcode_bloc.dart';

sealed class BarcodeEvent extends Equatable {
  const BarcodeEvent();

  @override
  List<Object> get props => [];
}

class GetProduct extends BarcodeEvent {}

class BarCodeScan extends BarcodeEvent {
  final String barcode;

  const BarCodeScan({required this.barcode});
}
