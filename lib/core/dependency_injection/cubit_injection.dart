import 'package:online_shop/features/product/product.dart';

import 'dependency_injection.dart';

void setupCubitInjection() {
  serviceLocator.registerFactory<ProductCubit>(
    () => ProductCubit(productUsecase: serviceLocator<ProductUsecase>()),
  );
}
