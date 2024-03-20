import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart'; 

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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 50, left: 15, right: 15, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/svg/ucanpurple.svg",
                  color: ColorsApp.onSecondary,
                  width: 150,
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                    "Transformez vos rêves en réalité, étape par étape, avec notre application d'épargne intelligente. Planifiez, économisez et réalisez vos objectifs financiers en toute simplicité.", style: TextStyle(
                      color: ColorsApp.onSecondary, fontSize: 20
                    ),),
                    const SizedBox(height: 20,),
                Image.asset('assets/png/checklist.png'),
              ],
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    //AlertService.showLoad(context);
                    Navigator.of(context).pushNamed(Routes.signup);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorsApp.onSecondary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Creer mon compte",
                      style: TextStyle(
                          color: ColorsApp.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous avez deja un compte?", style: TextStyle(
                      color: ColorsApp.primaryDark
                    ),),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.signin);
                        },
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                              color: ColorsApp.onSecondary,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorsApp.onSecondary),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
