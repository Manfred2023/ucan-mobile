import 'package:flutter/material.dart';
import 'package:ucan/data/account/model/motif.dart';

import '../../../../app/config/colors.dart';
import '../../../../data/account/repository/account_repository.dart';
import '../../../../utils/dependancies.dart';

class SelectMotif extends StatefulWidget {
  const SelectMotif({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMotif> createState() => _SelectMotifState();
}

class _SelectMotifState extends State<SelectMotif> {
  TextEditingController searchController = TextEditingController();
  List<Motif> motifFiltered = [];
  List<Motif> motifs = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Choisir la raison'),
        actions: [
          IconButton(
            onPressed: () async {
              isLoading = true;
              motifs.clear();
              reload();
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                        itemCount: motifs.length,
                        itemBuilder: (context, index) {
                          final motif = motifs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(motif);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32.0),
                              child: Row(
                                children: [
                                  Text(
                                    motif.name ?? '',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.circle_outlined,
                                    size: 16,
                                    color: ColorsApp.secondary,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  String? language;
  String? search;
  final requis = getIt<AccountRepository>();
  init() async {
    motifs = await requis.getAllMotif();
    if (motifs.isNotEmpty) {
      isLoading = false;
    }
    setState(() {});
  }

  reload() async {
    await getIt<AccountRepository>().getMotifRemote();
    motifs = await getIt<AccountRepository>().getAllMotif();
    if (motifs.isNotEmpty) {
      isLoading = false;
    }
    setState(() {});
  }
}
