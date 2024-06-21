import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';

import '../../../utils/helpers/g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
  bool seepass = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "Connexion",
                      style: TextStyle(
                          fontSize: 35,
                          color: ColorsApp.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Vous n'avez pas de comptes? ",
                          style: TextStyle(fontSize: 12),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.signup);
                          },
                          child: const Text(
                            "Creer",
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                      hintText: "Email ou telephone",
                      hintStyle: TextStyle(color: ColorsApp.onPrimary),
                      prefixIcon: Icon(
                        Icons.email,
                        color: ColorsApp.onPrimary,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.onPrimary)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.onPrimary)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.error))),
                ),
                SizedBox(height: 25),
                TextFormField(
                  obscureText: seepass,
                  controller: passcodeController,
                  textInputAction: TextInputAction.next,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    hintText: "Mot de passe",
                    hintStyle: const TextStyle(color: ColorsApp.onPrimary),
                    prefixIcon:
                        const Icon(Icons.password, color: ColorsApp.onPrimary),
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (seepass) {
                            setState(() {
                              seepass = false;
                            });
                          } else {
                            setState(() {
                              seepass = true;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: ColorsApp.onPrimary,
                        )),
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                  ),
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.forgot);
                  },
                  child: const Text(
                    "Mot de passe oublie ?",
                    style: TextStyle(
                        fontSize: 12, decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () async {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorsApp.onPrimary,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Connexion",
                  style: TextStyle(color: ColorsApp.onSecondary, fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
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
