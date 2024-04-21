
import 'package:barcode/core/injection/get_it.dart';
import 'package:barcode/features/barcode/bloc/bloc/barcode_bloc.dart';
import 'package:barcode/features/products/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductListBloc>(
          create: (context) => getIt<ProductListBloc>(),
        ),
        BlocProvider<BarcodeBloc>(
          create: (context) => getIt<BarcodeBloc>(),
        ),
         
      ],
      child: child,
    );
  }
}
