import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';  
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/data/ucan/service/remote/contact_auth.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignupView();
  }
}

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final ContactAuthService _auth = ContactAuthService();

  TextEditingController emailController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
  TextEditingController passcode1Controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool seepass = true;
  bool seepass1 = true;
  bool errorPass = false;
  bool error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primarySecond,
      // appBar: AppBar(
      //     backgroundColor: Colors.transparent,
      //     automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          child: Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Column(
                  children: [
                    Text(
                      "Creer un compte",
                      style: TextStyle(
                          fontSize: 35,
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      controller: usernameController,
                      textInputAction: TextInputAction.next,
                      // textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          hintText: "Pseudo",
                          hintStyle: TextStyle(color: ColorsApp.primaryLigt),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: ColorsApp.primary,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.error))),
                    ),
                    if (error && usernameController.text.isEmpty)
                      const Text(
                        'Nom obligatoire',
                        style: TextStyle(color: ColorsApp.error),
                      )
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                          hintText: "Numero de telephone",
                          hintStyle: TextStyle(color: ColorsApp.primaryLigt),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: ColorsApp.primary,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.error))),
                    ),
                    if (error && phoneController.text.isEmpty)
                      const Text(
                        'telephone obligatoire',
                        style: TextStyle(color: ColorsApp.error),
                      )
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      obscureText: seepass,
                      controller: passcodeController,
                      textInputAction: TextInputAction.next,
                      // textAlign: TextAlign.justify,
                      style: const TextStyle(
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: const TextStyle(color: ColorsApp.primaryLigt),
                        prefixIcon: const Icon(Icons.fingerprint,
                            color: ColorsApp.primary),
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
                            icon: Icon(
                              seepass
                                  ? Icons.remove_red_eye
                                  : Icons.remove_red_eye_outlined,
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
                    if (error && passcodeController.text.isEmpty)
                      const Text(
                        'mot de passe obligatoire',
                        style: TextStyle(color: ColorsApp.error),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Routes.code);
            if (!checkPasscode()) return;
            if (usernameController.text.isEmpty ||
                phoneController.text.isEmpty ||
                emailController.text.isEmpty ||
                passcodeController.text.isEmpty) {
              setState(() {
                error = true;
              });
            } else {
              Navigator.of(context).pushNamed(Routes.code);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                  color: ColorsApp.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Text(
                "Creer mon compte",
                style: TextStyle(color: ColorsApp.onSecondary, fontSize: 20),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ),
    );
  }

  bool checkPasscode() {
    if (passcodeController.text.trim() != passcode1Controller.text.trim()) {
      setState(() {
        errorPass = true;
      });
      return false;
    }
    return true;
  }

  Future<void> signup() async {
    try {
      AlertService.showLoad(context);
      await _auth.singupWithEmail(
          emailController.text.trim(), passcodeController.text);
      if (!context.mounted) return;
      Navigator.of(context).pushNamed(Routes.signin, arguments: User);
    } catch (e) {
      print(e.toString());
      AlertService.showSnack(context,
          message: e.toString(), onPressed: () {}, actionText: "OK");
      Navigator.of(context).pop();
    }
  }
}
