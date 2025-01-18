import 'package:online_shop/features/product/product.dart';

class ProductUsecase {
  final ProductRepository _repository;

  ProductUsecase({
    required ProductRepository productRepository,
  }) : _repository = productRepository;

  Future<List<Product>> execute() async => await _repository.fetchProducts();
}
