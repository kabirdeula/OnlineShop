import 'package:online_shop/features/product/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductService _service;

  ProductRepositoryImpl({required ProductService productService})
      : _service = productService;

  @override
  Future<List<Product>> fetchProducts() {
    try {
      return _service.fetchSavedProducts();
    } catch (e) {
      return Future.value(<Product>[]);
    }
  }
}
