import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucan/app/config/colors.dart';

import '../../app/navigation/route.dart';
import '../../data/account/repository/account_repository.dart';
import '../../data/authentication/repository/authenticate_repository.dart';
import '../../data/shared/service/local/db.dart';
import '../../utils/dependancies.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  Timer? timer;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: ColorsApp.primary,
        body: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset(
                'assets/svg/saves.svg',
              ),
            ),
            Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.2),
                  child: Text('')),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Chargement des données, veuillez patienter",
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorsApp.onSecondary,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    color: ColorsApp.onSecondary,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    init();

    /* timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.welcome, (route) => false);
    });*/
  }

  init() async {
    await Db.instance.database;
    await getIt<AccountRepository>().getMotif();
    //await getIt<RequirementRepository>().getCities();
    //await getIt<RequirementRepository>().getCountry();

    final auth = await getIt<AuthenticateRepository>().getAuth();

    if (auth != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.loginStep2, (route) => false,
          arguments: auth);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.welcome, (route) => false);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
