// Created by Manfred MOUKATE on 6/24/24, 1:48 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/24/24, 1:48 PM

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pinput/pinput.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../app/config/colors.dart';
import '../../../app/navigation/route.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/g.dart';

class LoginStepTwoScreen extends StatelessWidget {
  const LoginStepTwoScreen({super.key, required this.user});

  final Authentication user;

  @override
  Widget build(BuildContext context) {
    return LoginStepTwoView(user: user);
  }
}

class LoginStepTwoView extends StatefulWidget {
  const LoginStepTwoView({super.key, required this.user});

  final Authentication user;

  @override
  State<LoginStepTwoView> createState() => _LoginStepTwoViewState();
}

class _LoginStepTwoViewState extends State<LoginStepTwoView> {
  TextEditingController codeController = TextEditingController();
  Authentication? user;

  final defaultPinInput = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
          color: ColorsApp.primary, fontWeight: FontWeight.bold, fontSize: 25),
      decoration: BoxDecoration(
          color: ColorsApp.textColorCcLight.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.transparent)));
  @override
  Widget build(BuildContext context) {
    ;
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      'assets/svg/ucanpurple.svg',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Bienvenue",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          TablerIcons.user_circle,
                          color: ColorsApp.secondary,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (widget.user.contact!.gender == "true")
                          Text("Mr")
                        else
                          Text("Mme"),
                        const SizedBox(
                          width: 5,
                        ),
                        if (widget.user.contact!.firstname != null)
                          Text(widget.user.contact!.firstname ?? ''),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.user.contact!.lastname ?? '',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Insérez votre code PIN et gérez vos dépenses en toute confidentialité. ",
                      style: TextStyle(color: ColorsApp.textColorCC),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Pinput(
                    autofocus: true,
                    controller: codeController,
                    length: 6,
                    submittedPinTheme: defaultPinInput.copyWith(
                      textStyle: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      decoration: BoxDecoration(
                        color: ColorsApp.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                    defaultPinTheme: defaultPinInput,
                    focusedPinTheme: defaultPinInput.copyWith(
                      textStyle: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      decoration: BoxDecoration(
                        color: ColorsApp.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.transparent),
                      ),
                    ),
                    //controller: codeController,
                    //onCompleted: (pin) => debugPrint(pin),
                    onCompleted: (String pin) async {
                      if (pin.length == 6) {
                        AlertService.showLoad(context);
                        try {
                          user = await getIt<AuthenticateRepository>().auth(
                              pin: int.parse(codeController.text),
                              code: widget.user.code!);

                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          if (user is Authentication) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              Routes.ucan,
                              (route) => false,
                            );
                          }
                        } catch (e) {
                          Navigator.of(context).pop();
                          codeController.clear();
                          setState(() {});
                          AlertService.showSnack(context,
                              message: e.toString(),
                              onPressed: () {},
                              actionText: 'OK');
                        }
                      }
                    }),
                const SizedBox(height: 25),
                RichText(
                  text: const TextSpan(
                    text:
                        "En cas d'oubli de votre code PIN, veuillez cliquer ici.",
                    children: [
                      TextSpan(
                          text: ' ',
                          style: TextStyle(
                              color: ColorsApp.secondary,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: "PIN oublié",
                        style: TextStyle(
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                    style: TextStyle(color: ColorsApp.textColorCC),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /*  InkWell(
                  onTap: () async {
                    setState(() async {
                      if (codeController.length == 6) {
                        AlertService.showLoad(context);
                        try {
                          user = await getIt<AuthenticateRepository>().auth(
                              pin: int.parse(codeController.text),
                              code: widget.user.code!);

                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          if (user is Authentication) {
                            Navigator.of(context).pushNamed(Routes.ucan);
                          }
                        } catch (e) {
                          Navigator.of(context).pop();
                          codeController.clear();
                          setState(() {});
                          AlertService.showSnack(context,
                              message: e.toString(),
                              onPressed: () {},
                              actionText: 'OK');
                        }
                      }
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorsApp.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Suivant",
                      style: TextStyle(
                          color: ColorsApp.onSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),*/
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginStep1, (route) => false);
                      },
                      child: const Text(
                        "Ce n'est pas vous ??",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorsApp.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
