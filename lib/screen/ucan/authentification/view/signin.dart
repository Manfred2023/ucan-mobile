import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
    return Scaffold(
      backgroundColor: ColorsApp.primarySecond,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Connexion",
                        style: TextStyle(
                            fontSize: 35,
                            color: ColorsApp.primary,
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
                              Navigator.of(context)
                                  .pushNamed(Routes.signup);
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
                  const SizedBox(height: 35),
                  TextFormField(
                    controller: emailController,
                    textInputAction: TextInputAction.next,
                    // textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: ColorsApp.primary, fontWeight: FontWeight.bold),
                    decoration:   const InputDecoration(
                      hintText: "Email ou telephone",
                      hintStyle: TextStyle(
                        color: ColorsApp.primary
                      ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: ColorsApp.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.primary)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.primary)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.error))),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    obscureText: seepass,
                    controller: passcodeController,
                    textInputAction: TextInputAction.next,
                    // textAlign: TextAlign.justify,
                    style: const TextStyle(
                        color: ColorsApp.primary, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Mot de passe",
                      hintStyle: const TextStyle(
                        color: ColorsApp.primary
                      ),
                      prefixIcon:
                          const Icon(Icons.password, color: ColorsApp.primary),
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
                            color: ColorsApp.primary,
                          )),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.primary)),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(color: ColorsApp.primary)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.forgot);
                    },
                    child: const Text(
                      "Mot de passe oublie",
                      style: TextStyle(
                          fontSize: 12, decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Connexion",
                          style: TextStyle(
                              color: ColorsApp.onSecondary, fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
