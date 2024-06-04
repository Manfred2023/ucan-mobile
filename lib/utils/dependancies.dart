import 'package:get_it/get_it.dart';

import '../data/authentication/repository/authenticate_repository.dart';
import '../data/authentication/service/remote/authenticate_remote.dart';

final getIt = GetIt.instance;

abstract class Dependencies {
  static Future<void> register() async {
    getIt.registerSingleton<AuthenticateRepository>(
        AuthenticateRepository(AuthenticateRemote()));
  }
}
