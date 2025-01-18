import 'package:online_shop/features/product/product.dart';

import 'dependency_injection.dart';

void setupServiceInjection() {
  serviceLocator.registerLazySingleton<ProductService>(() => ProductService());
}
