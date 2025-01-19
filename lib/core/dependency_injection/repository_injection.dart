import 'package:online_shop/features/product/product.dart';

import 'dependency_injection.dart';

void setupRepositoryInjection() {
  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      productService: serviceLocator<ProductService>(),
    ),
  );
}
