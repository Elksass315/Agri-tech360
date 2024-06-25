import 'package:get_it/get_it.dart';

import 'core/Di/setup_for_cubits.dart';
import 'core/Di/setup_for_repos.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setUpServiceLocator() async {

    SetupForRepos().setupForRepos();

    SetupForCubits().setUpForCubits();
  }
}
