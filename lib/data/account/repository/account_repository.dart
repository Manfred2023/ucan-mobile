import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/account/model/motif.dart';

import '../service/remote/account_remote.dart';

class AccountRepository {
  final AccountRemote _authenticate;

  AccountRepository(this._authenticate);

  Future<Account?> account({required int token}) async {
    final response = await _authenticate.getAccount(token: token);
    return response.response!.toAccount();
  }

  Future<List<Motif>?> getMotif() async {
    final response = await _authenticate.getMotif();
    return response.response!.map((e) => e.toMotif()).toList();
    ;
  }

  Future<Motif> saveMotif({required String name, int? token}) async {
    final response = await _authenticate.saveMotif(token: token, name: name);
    return response.response!.toMotif();
  }
}
