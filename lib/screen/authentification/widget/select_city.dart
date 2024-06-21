import 'package:flutter/material.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import '../../../app/config/colors.dart';
import '../../../data/requirement/model/city.dart';
import '../../../data/requirement/repository/requirement_repository.dart';
import '../../../utils/dependancies.dart';
import '../../shared/design_system/utils/dimens.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController searchController = TextEditingController();
  List<CitySimple> citiesFiltered = [];
  List<City> cities = [];
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Choisir la ville'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.marginMedium),
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
                        itemCount: cities.length,
                        itemBuilder: (context, index) {
                          final city = cities[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pop(city);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 32.0),
                              child: Row(
                                children: [
                                  Text(
                                    city.name,
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
  final requis = getIt<RequirementRepository>();
  init() async {
    cities = await requis.getCities();
    if (cities.isNotEmpty) {
      isLoading = false;
    }
    setState(() {});
  }
}
