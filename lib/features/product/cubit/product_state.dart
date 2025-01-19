part of 'product_cubit.dart';

/// Represents the state of the [ProductCubit].
class ProductState extends Equatable {
  /// Indicates whether a loading process is ongoing.
  final bool isLoading;

  /// A list of all fetched products.
  final List<Product>? productList;

  /// The selected product fetched by ID.
  final Product? selectedProduct;

  final Color? selectedColor;

  final int counter;

  /// Constructor for creating a [ProductState].
  const ProductState({
    this.isLoading = false,
    this.productList = const <Product>[],
    this.selectedProduct,
    this.selectedColor,
    this.counter = 1,
  });

  /// Factory method to create an initial state.
  factory ProductState.initial() => const ProductState();

  /// Creates a copy of the current state with optional overrides.
  ProductState copyWith({
    bool? isLoading,
    List<Product>? productList,
    Product? selectedProduct,
    Color? selectedColor,
    int? counter,
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      productList: productList ?? this.productList,
      selectedProduct: selectedProduct ?? this.selectedProduct,
      selectedColor: selectedColor ?? this.selectedColor,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        productList,
        selectedProduct,
        selectedColor,
        counter,
      ];
}
