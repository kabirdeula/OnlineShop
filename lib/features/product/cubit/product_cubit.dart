import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/features/product/product.dart';

part 'product_state.dart';

/// A Cubit to manage product-related state and operations.
class ProductCubit extends Cubit<ProductState> {
  /// The use case responsible for fetching product data.
  final ProductUsecase _productUsecase;

  /// Creates a [ProductCubit] with the required use case.
  ProductCubit({required ProductUsecase productUsecase})
      : _productUsecase = productUsecase,
        super(ProductState.initial());

  /// Initializes the Cubit by fetching all products.
  /// Emits the updated state with the fetched products or an error state.
  Future<void> loadAllProducts() async {
    emit(state.copyWith(isLoading: true));
    try {
      final productList = await _productUsecase.fetchAllProducts();
      emit(state.copyWith(isLoading: false, productList: productList));
      log.i("(ProductCubit) Loaded ${productList.length} products.");
    } catch (error) {
      log.e("(ProductCubit) Failed to load products: $error");
      emit(state.copyWith(isLoading: false));
    }
  }

  /// Fetches a product by its ID.
  /// Emits the updated state with the selected product or an error state.
  Future<void> loadProductById({required int productId}) async {
    emit(state.copyWith(isLoading: true));
    try {
      final product =
          await _productUsecase.fetchProductDetails(productId: productId);
      emit(state.copyWith(isLoading: false, selectedProduct: product));
      log.i(
          "(ProductCubit) Loaded product with ID $productId: ${product?.title}");
    } catch (error) {
      log.e("(ProductCubit) Failed to load product with ID $productId: $error");
      emit(state.copyWith(isLoading: false));
    }
  }

  void changeSelectedColor(Color color) {
    emit(state.copyWith(selectedColor: color));
    log.i("(ProductCubit) Changed selected color to $color.");
  }
}
