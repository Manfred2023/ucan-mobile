import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/account/model/motif.dart';
import 'package:ucan/data/account/model/spent.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import '../service/local/account_db_service.dart';
import '../service/remote/account_remote.dart';

class AccountRepository {
  final AccountRemote _accountRemote;
  final AccountDbService _dbService;

  AccountRepository(this._accountRemote, this._dbService);

  Future<Resume?> resume({required int token}) async {
    final response = await _accountRemote.getResume(token: token);
    return response.response?.toResume();
  }

  Future<List<Motif>?> getMotifRemote() async {
    final response = await _accountRemote.getMotif();
    final motif = response.response?.map((e) => e.toMotif()).toList();
    if (motif != null) await _dbService.saveMotifs(motif);
    return motif;
    ;
  }

  Future<Motif> saveMotif({required String name, int? token}) async {
    final response = await _accountRemote.saveMotif(token: token, name: name);
    return response.response!.toMotif();
  }

  Future<List<Motif>> getAllMotif() async {
    final response = await _dbService.getMotif();
    return response;
  }

  Future<Spent?> spent({
    required int bubget,
    required String date,
  }) async {
    final response = await _accountRemote.getSpent(bubget: bubget, date: date);
    return response.response?.toSpent();
  }

  Future<Pin> deleteHistory({
    required int token,
  }) async {
    final response = await _accountRemote.deleteHistory(token: token);
    return response.toPin();
  }

  Future<String> convert({
    required int number,
  }) async {
    final response = await _accountRemote.convert(number: number);
    return response.message!;
  }
}
