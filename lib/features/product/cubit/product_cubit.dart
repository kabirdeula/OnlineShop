import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      print(products);
      emit(state.copyWith(isLoading: false, products: products));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
