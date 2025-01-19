import 'package:online_shop/features/product/product.dart';

import 'dependency_injection.dart';

void setupUsecaseInjection() {
  serviceLocator.registerLazySingleton<ProductUsecase>(
    () => ProductUsecase(
      productRepository: serviceLocator<ProductRepository>(),
    ),
  );
}
