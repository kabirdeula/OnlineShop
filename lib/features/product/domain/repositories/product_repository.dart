import 'package:online_shop/features/product/product.dart';

/// Abstract repository interface for handling product-related operations.
/// Provides methods to fetch products and individual product details.
abstract class ProductRepository {
  /// Fetches all products from the data source.
  Future<List<Product>> getAllProducts();

  /// Fetches a single product by its ID.
  Future<Product?> getProductById({required int productId});
}
