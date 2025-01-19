import 'package:online_shop/core/services/services.dart';
import 'package:online_shop/features/product/product.dart';

/// Use case for handling product-related business logic.
/// Interacts with the repository to fetch product data.
class ProductUsecase {
  /// The repository providing access to product data.
  final ProductRepository _productRepository;

  /// Constructor for [ProductUsecase] with the required [ProductRepository].
  ProductUsecase({required ProductRepository productRepository})
      : _productRepository = productRepository;

  /// Fetches all products through the repository.
  Future<List<Product>> fetchAllProducts() async {
    try {
      return await _productRepository.getAllProducts();
    } catch (error) {
      log.e("(ProductUsecase) Error fetching all products: $error");
      return [];
    }
  }

  /// Fetches a single product by its ID through the repository.
  Future<Product?> fetchProductDetails({required int productId}) async {
    try {
      return await _productRepository.getProductById(productId: productId);
    } catch (error) {
      log.e("(ProductUsecase) Error fetching product with ID $productId: $error");
      return null;
    }
  }
}
