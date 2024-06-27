// Created by Manfred MOUKATE on 6/25/24, 8:58 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 8:58 PM

import '../../model/motif.dart';
import 'model/motif_db.dart';

class AccountDbService {
  Future<void> saveMotifs(List<Motif> motifs) async {
    print(motifs);
    print('result');
    await MotifDb.delete();
    for (Motif motif in motifs) {
      await MotifDb(id: null, code: motif.code!, name: motif.name!).save();
    }
  }

  Future<List<Motif>> getMotif() async {
    final motifsDb = await MotifDb.getAll();
    List<Motif> motifs = [];
    if (motifsDb.isNotEmpty) {
      for (final motif in motifsDb) {
        motifs.add(motif.toMotif());
      }
    }
    return motifs;
  }
}
