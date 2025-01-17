import 'package:get_it/get_it.dart';

import 'repository_injection.dart';
import 'service_injection.dart';
import 'usecase_injection.dart';

/// A centralized method to set up dependency injection for the entire application.
void setupDependencyInjection() {
  setupServiceInjection();
  setupRepositoryInjection();
  setupUsecaseInjection();
}

/// The singleton instance of [GetIt] used for dependency injection.
final serviceLocator = GetIt.instance;
