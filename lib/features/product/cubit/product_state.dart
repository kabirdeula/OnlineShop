part of 'product_cubit.dart';

class ProductState extends Equatable {
  final bool isLoading;
  final List<Product> products;

  const ProductState({
    this.isLoading = false,
    this.products = const <Product>[],
  });

  factory ProductState.initial() => ProductState();

  ProductState copyWith({
    bool? isLoading,
    List<Product>? products,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [isLoading, products];
}
