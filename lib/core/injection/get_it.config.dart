// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/barcode/bloc/bloc/barcode_bloc.dart' as _i11;
import '../../features/product_details/data/remote/product_details_api.dart'
    as _i3;
import '../../features/product_details/domain/repository/product_details_repository.dart'
    as _i5;
import '../../features/product_details/domain/usecase/get_product_details_usecase.dart'
    as _i8;
import '../../features/products/bloc/product_list_bloc/product_list_bloc.dart'
    as _i10;
import '../../features/products/data/remote/product_list_api.dart' as _i6;
import '../../features/products/domain/repository/product_lists_repo.dart'
    as _i7;
import '../../features/products/domain/usecase/get_products_usecase.dart'
    as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ProductDetailsApi>(
        () => _i3.ProductListImplApi(gh<_i4.Dio>()));
    gh.lazySingleton<_i5.ProductDetailsRepository>(() =>
        _i5.ProductDetailsRepositoryImpl(
            remoteDS: gh<_i3.ProductDetailsApi>()));
    gh.lazySingleton<_i6.ProductListApi>(
        () => _i6.ProdcutListImplApi(gh<_i4.Dio>()));
    gh.lazySingleton<_i7.ProductListRepository>(() =>
        _i7.ProductListRepositoryImpl(remoteDS: gh<_i6.ProductListApi>()));
    gh.lazySingleton<_i8.GetProductDetailsUseCase>(
        () => _i8.GetProductDetailsUseCase(gh<_i5.ProductDetailsRepository>()));
    gh.lazySingleton<_i9.GetProductListUseCase>(
        () => _i9.GetProductListUseCase(gh<_i7.ProductListRepository>()));
    gh.singleton<_i10.ProductListBloc>(() => _i10.ProductListBloc(
        getProductListUseCase: gh<_i9.GetProductListUseCase>()));
    gh.singleton<_i11.BarcodeBloc>(
        () => _i11.BarcodeBloc(gh<_i8.GetProductDetailsUseCase>()));
    return this;
  }
}
