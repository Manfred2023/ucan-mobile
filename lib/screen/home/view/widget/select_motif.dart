import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/account/model/motif.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../../data/account/repository/account_repository.dart';
import '../../../../data/authentication/model/authentication.dart';
import '../../../../data/authentication/repository/authenticate_repository.dart';
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
  Authentication? currentUser;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    final isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      backgroundColor: ColorsApp.onSecondary,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Choisir la raison',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
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
            SizedBox(
              height: 55,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: searchController,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        hintText: "Recherche...",
                        hintStyle: TextStyle(
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.w100),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.primary)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.error),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Adresse e-mail ou numéro de téléphone";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (searchController.text.isNotEmpty && motifFiltered.isEmpty)
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          try {
                            AlertService.showLoad(context);
                            final motifResult =
                                await getIt<AccountRepository>().saveMotif(
                              name: searchController.text,
                            );
                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                            Navigator.of(context).pop(motifResult);
                          } catch (e) {
                            Navigator.of(context).pop();
                            AlertService.showSnack(context,
                                message: e.toString(),
                                onPressed: () {},
                                actionText: 'Ok');
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(9),
                            ),
                          ),
                          child: const Center(
                              child: Text(
                            "Enregister",
                            style: TextStyle(
                              color: ColorsApp.onSecondary,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                        itemCount:
                            isSearching ? motifFiltered.length : motifs.length,
                        itemBuilder: (context, index) {
                          final motif = isSearching
                              ? motifFiltered[index]
                              : motifs[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(motif);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    motif.name ?? '',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Divider(
                                    color: ColorsApp.primary.withOpacity(0.2),
                                  )
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
    searchController.addListener(filterMotif);
  }

  void filterMotif() {
    final allMotifs = [...motifs];
    if (searchController.text.isNotEmpty) {
      allMotifs.retainWhere((motif) {
        final searchItem = searchController.text.trim().toLowerCase();
        final cityName = motif.name!.trim().toLowerCase();
        final nameMatches = cityName.contains(searchItem);
        if (nameMatches) {
          return true;
        }
        return false;
      });

      setState(() {
        motifFiltered = allMotifs;
      });
    }
  }

  String? language;
  String? search;
  final requis = getIt<AccountRepository>();

  init() async {
    motifs = await requis.getAllMotif();
    currentUser = await getIt<AuthenticateRepository>().getAuth();
    setState(() {
      this.motifs = motifs;
      isLoading = false;
    });
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
