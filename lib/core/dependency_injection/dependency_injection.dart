import 'package:get_it/get_it.dart';

import 'cubit_injection.dart';
import 'repository_injection.dart';
import 'service_injection.dart';
import 'usecase_injection.dart';

/// A centralized method to set up dependency injection for the entire application.
void setupDependencyInjection() {
  setupServiceInjection();
  setupRepositoryInjection();
  setupUsecaseInjection();
  setupCubitInjection();
}

/// The singleton instance of [GetIt] used for dependency injection.
final serviceLocator = GetIt.instance;
