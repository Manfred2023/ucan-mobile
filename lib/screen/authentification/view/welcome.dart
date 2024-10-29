import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../app/config/colors.dart';
import '../../../app/navigation/route.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const WelcomeView();
  }
}

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(''),
            Padding(
              padding: const EdgeInsets.all(25),
              child: SvgPicture.asset(
                'assets/svg/ucanWhite.svg',
                width: 100,
                height: 100,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3.1,
              decoration: const BoxDecoration(
                  color: ColorsApp.onSecondary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Maîtrisez vos dépenses et devenez maître de votre épargne.",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            //AlertService.showLoad(context);
                            Navigator.of(context).pushNamed(Routes.signup1);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                                color: ColorsApp.primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                                child: Text(
                              "Creer mon compte",
                              style: TextStyle(
                                  color: ColorsApp.onSecondary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Tu as déjà un compte ? ",
                              style: TextStyle(
                                color: ColorsApp.secondary,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.loginStep1);
                                },
                                child: Text(
                                  'Connecte-toi',
                                  style: TextStyle(
                                      color: ColorsApp.primary,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline,
                                      decorationColor: ColorsApp.primary),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
