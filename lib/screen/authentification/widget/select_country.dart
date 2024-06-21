import 'package:flutter/material.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import '../../../data/requirement/repository/requirement_repository.dart';
import '../../../utils/dependancies.dart';
import '../../shared/design_system/utils/dimens.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  TextEditingController searchController = TextEditingController();
  List<Country> countries = [];
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    final isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Choisir le pays'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.marginMedium),
        child: Column(
          children: [
            isLoading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Expanded(
                    child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, index) {
                          final country = countries[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(country);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32.0),
                              child: Text(
                                country.nameen,
                                style: const TextStyle(fontSize: 25),
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
  final requis = getIt<RequirementRepository>();

  init() async {
    countries = await requis.getCountry();
    if (countries.isNotEmpty) {
      isLoading = false;
    }
    setState(() {});
  }
}
