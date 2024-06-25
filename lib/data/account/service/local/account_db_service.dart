// Created by Manfred MOUKATE on 6/25/24, 8:58 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:58 PM

import 'package:ucan/data/account/model/motif.dart';
import 'package:ucan/data/account/service/remote/model/motif_api_model.dart';

class AccountDbService {
  Future<void> saveMotif(MotifApiListResponse motifApi) async {
    if (motifApi.response?.toMotif().cites != null) {
      for (final city in citiesApiModel.toCities().cites!) {
        (await CitiesDb.fromCity(city)).save();
      }
      await preferences.setInt('versionCity', citiesApiModel.version!);
      Flogger.i("save cities OK");
    }
  }
}
