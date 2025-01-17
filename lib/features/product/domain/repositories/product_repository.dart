import 'package:online_shop/features/product/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts();
}
