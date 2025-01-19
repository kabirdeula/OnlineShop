import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/features/product/product.dart';

/// Implementation of [ProductRepository] that interacts with the data layer.
class ProductRepositoryImpl implements ProductRepository {
  /// The service responsible for fetching and managing product data.
  final ProductService _productService;

  /// Constructor for [ProductRepositoryImpl] with the required [ProductService].
  ProductRepositoryImpl({required ProductService productService})
      : _productService = productService;

  @override
  Future<List<Product>> getAllProducts() async {
    try {
      // Fetch and save products via the service.
      return await _productService.fetchAndSaveProducts();
    } catch (error) {
      log.e("(Product Repository Impl) Error fetching products: $error");
      return [];
    }
  }

  @override
  Future<Product?> getProductById({required int productId}) async {
    try {
      // Fetch a single product by its ID.
      return await _productService.fetchProduct(productId);
    } catch (error) {
      log.e("(Product Repository Impl) Error fetching product with ID $productId: $error");
      return null;
    }
  }
}
