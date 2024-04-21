import 'package:auto_route/auto_route.dart';
import 'package:barcode/core/errors/error_widget.dart';
import 'package:barcode/core/router/app_router.dart';
import 'package:barcode/features/barcode/bloc/bloc/barcode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

@RoutePage()
class BarcodeScreen extends StatelessWidget {
  const BarcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<BarcodeBloc, BarcodeState>(
        bloc: BlocProvider.of<BarcodeBloc>(context)..add(GetProduct()),
        listener: (context, state) {
          if (state is BarcodeError) {
            showErrorSnackbar(context, state.errorMessage);
          } else if (state is BarcodeSuccess) {
            context.router.push(ProductDetailsRoute(product: state.product));
          }
        },
        builder: (context, state) {
          if (state is BarcodeLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                 const SimpleBarcodeScannerPage(),
                          )).then((barcode) {
                        if (barcode is String) {
                          context
                              .read<BarcodeBloc>()
                              .add(BarCodeScan(barcode: barcode));
                        }
                      });
                    },
                    child: const Text('Сканировать баркод'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
