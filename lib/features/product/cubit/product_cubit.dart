import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/features/product/product.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductUsecase _usecase;

  ProductCubit({
    required ProductUsecase productUsecase,
  })  : _usecase = productUsecase,
        super(ProductState.initial());

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      final products = await _usecase.execute();
      emit(state.copyWith(isLoading: false, products: products));
      log.i("(Product Cubit) Products: $state");
    } catch (e) {
      log.e("(Product Cubit) Error fetching products: $e");
      emit(state.copyWith(isLoading: false));
    }
  }
}
