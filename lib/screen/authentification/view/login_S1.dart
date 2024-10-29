import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ucan/app/config/colors.dart';

import '../../../app/navigation/route.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/g.dart';
import '../../shared/design_system/utils/alert_service.dart';

class LoginStepOneScreen extends StatelessWidget {
  const LoginStepOneScreen({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return const LoginStepOneView();
  }
}

class LoginStepOneView extends StatefulWidget {
  const LoginStepOneView({super.key});

  @override
  State<LoginStepOneView> createState() => _LoginStepOneViewState();
}

class _LoginStepOneViewState extends State<LoginStepOneView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();

  bool seepass = true;
  Contact? contact;
  Authentication? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          G.loseFocus();
        },
        child: Scaffold(
          backgroundColor: ColorsApp.primary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(child: Text('')),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                decoration: const BoxDecoration(
                  color: ColorsApp.onSecondary,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome back!',
                            style: TextStyle(
                                color: ColorsApp.primary,
                                fontWeight: FontWeight.w500,
                                fontSize: 23),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Pour vous connecter, saisissez votre adresse e-mail ou votre numéro de téléphone.',
                            style: TextStyle(
                              color: ColorsApp.textColorCC,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.phone,
                              // textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                hintText: "Numéro de téléphone",
                                hintStyle: TextStyle(
                                    color: ColorsApp.primary,
                                    fontWeight: FontWeight.w100),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: ColorsApp.primary)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: ColorsApp.primary)),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(color: ColorsApp.error),
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
                            height: 30,
                          ),
                          RichText(
                            text: const TextSpan(
                              text:
                                  "En cas d'oubli ou de perte de votre adresse électronique, veuillez cliquer ici.",
                              children: [
                                TextSpan(
                                    text: ' ',
                                    style: TextStyle(
                                        color: ColorsApp.secondary,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                  text: "Adresse e-mail oubliée",
                                  style: TextStyle(
                                      color: ColorsApp.primary,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                              style: TextStyle(
                                  color: ColorsApp.textColorCC,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  AlertService.showLoad(context);
                                  contact =
                                      await getIt<AuthenticateRepository>()
                                          .getContact(
                                    mobile:
                                        int.parse(emailController.text.trim()),
                                  );
                                  if (!context.mounted) return;
                                  //Navigator.of(context).pop();
                                  if (contact is Contact) {
                                    user = await getIt<AuthenticateRepository>()
                                        .getUser(token: contact!.code!);
                                    if (!context.mounted) return;
                                    if (user is Authentication) {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          Routes.loginStep2, (route) => false,
                                          arguments: user);
                                    } else {
                                      Navigator.pushNamedAndRemoveUntil(context,
                                          Routes.signup2, (route) => false,
                                          arguments: contact);
                                    }
                                  }
                                } catch (e) {
                                  Navigator.of(context).pop();
                                  AlertService.showSnack(context,
                                      message: e.toString(),
                                      onPressed: () {},
                                      actionText: "OK");
                                }
                              }
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
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Vous n'avez pas de compte ?",
                                style: TextStyle(color: ColorsApp.textColorCC),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Routes.signup1);
                                },
                                child: const Text(
                                  "Creer",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ColorsApp.primary),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          if (Platform.isIOS)
                            Column(
                              children: [
                                const SizedBox(height: 15),
                                /* InkWell(
                                      onTap: () async {
                                        final credential = await SignInWithApple
                                            .getAppleIDCredential(
                                          scopes: [
                                            AppleIDAuthorizationScopes.email,
                                            AppleIDAuthorizationScopes.fullName,
                                          ],
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.black26,
                                                offset: Offset(0, 0),
                                                blurRadius: 2.0)
                                          ],
                                          color: ColorsApp.onSecondary,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/apple.svg',
                                                  height: 25,
                                                  width: 25,
                                                ),
                                                const Text(
                                                  "Continuer avec Apple",
                                                  style: TextStyle(
                                                    color: ColorsApp.primary,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const Text(''),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),*/
                              ],
                            ),
                          const SizedBox(height: 15),
                          InkWell(
                            onTap: () async {
                              try {
                                if (!context.mounted) return;
                              } catch (e) {
                                AlertService.showSnack(context,
                                    message: e.toString(),
                                    onPressed: () {},
                                    actionText: 'OK');
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 0),
                                      blurRadius: 2.0)
                                ],
                                color: ColorsApp.onSecondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/google.svg',
                                        height: 25,
                                        width: 25,
                                      ),
                                      const Text(
                                        "Continuer avec Google",
                                        style: TextStyle(
                                          color: ColorsApp.primary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          InkWell(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 0),
                                      blurRadius: 2.0)
                                ],
                                color: ColorsApp.onSecondary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/facebook.svg',
                                        height: 25,
                                        width: 25,
                                      ),
                                      const Text(
                                        "Continuer avec Facebook",
                                        style: TextStyle(
                                          color: ColorsApp.primary,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  Future<void> init() async {}
}
