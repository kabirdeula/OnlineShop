part of 'product_cubit.dart';

/// Represents the state of the [ProductCubit].
class ProductState extends Equatable {
  /// Indicates whether a loading process is ongoing.
  final bool isLoading;

  /// A list of all fetched products.
  final List<Product>? productList;

  /// The selected product fetched by ID.
  final Product? selectedProduct;

  /// Constructor for creating a [ProductState].
  const ProductState({
    this.isLoading = false,
    this.productList = const <Product>[],
    this.selectedProduct,
  });

  /// Factory method to create an initial state.
  factory ProductState.initial() => const ProductState();

  /// Creates a copy of the current state with optional overrides.
  ProductState copyWith({
    bool? isLoading,
    List<Product>? productList,
    Product? selectedProduct,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }

  @override
  List<Object?> get props => [isLoading, productList, selectedProduct];
}
