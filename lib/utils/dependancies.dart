import 'package:get_it/get_it.dart';
import 'package:ucan/data/requirement/repository/requirement_repository.dart';

import '../data/authentication/repository/authenticate_repository.dart';
import '../data/authentication/service/remote/authenticate_remote.dart';
import '../data/requirement/repository/requiremen_data_repository.dart';
import '../data/requirement/repository/requiremen_mock_repository.dart';
import '../data/requirement/service/remote/requirement_api_service.dart';

final getIt = GetIt.instance;

abstract class Dependencies {
  static Future<void> register({
    required bool useMocks,
  }) async {
    getIt.registerSingleton<AuthenticateRepository>(
        AuthenticateRepository(AuthenticateRemote()));

    getIt.registerSingleton<RequirementRepository>(
      useMocks
          ? RequirementMockRepository()
          : RequirementDataRepository(
              RequirementApiService(),
            ),
    );
  }
}
