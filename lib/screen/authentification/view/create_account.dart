import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';
import 'package:ucan/utils/helpers/g.dart';

import '../../../app/config/colors.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';

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
  TextEditingController pseudoController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
  bool seepass = true;
  User? userCredential;

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
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  controller: pseudoController,
                  textInputAction: TextInputAction.next,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Pseudo",
                    hintStyle: TextStyle(color: ColorsApp.onPrimary),
                    prefixIcon: Icon((TablerIcons.user_circle),
                        color: ColorsApp.onPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: mobileController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "N de téléphone portable",
                    hintStyle: TextStyle(color: ColorsApp.onPrimary),
                    prefixIcon:
                        Icon((TablerIcons.phone), color: ColorsApp.onPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: ColorsApp.onPrimary),
                    prefixIcon:
                        Icon((TablerIcons.at), color: ColorsApp.onPrimary),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.onPrimary)),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: seepass,
                  controller: passcodeController,
                  textInputAction: TextInputAction.done,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
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
                        icon: Icon(
                          seepass ? TablerIcons.eye_off : TablerIcons.eye,
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
                InkWell(
                  onTap: () async {
                    try {
                      //AlertService.showLoad(context);
                      await getIt<AuthenticateRepository>().signup(
                          emailAddress: emailController.text.trim(),
                          password: passcodeController.text,
                          userName: pseudoController.text);
                      await getIt<AuthenticateRepository>()
                          .phoneAuthentication(phone: mobileController.text);

                      if (!context.mounted) return;

                      //Navigator.of(context).pop();
                      //Navigator.of(context).pushNamed(Routes.code);
                    } catch (e) {
                      Navigator.of(context).pop();
                      AlertService.showSnack(context,
                          message: e.toString(),
                          onPressed: () {},
                          actionText: 'OK');
                    }

                    /*  DatabaseReference ref =
                        FirebaseDatabase.instance.ref("contact");

                    await ref.set({
                      "pseudo": pseudoController.text,
                      "mobile": mobileController.text,
                      "email": emailController.text
                    });
                    DatabaseReference starCountRef =
                        FirebaseDatabase.instance.ref('contact');

                    starCountRef.onValue.listen((DatabaseEvent event) {
                      final data = event.snapshot.value;
                      print('ce ci');
                      print(data);
                      print('ce ci');
                    });*/
                    //AlertService.showLoad(context);
                    /*      DatabaseReference ref =
                        FirebaseDatabase.instance.ref("user/123");

                    await ref.set({
                      "pseudo": pseudoController.text,
                      "mobile": mobileController.text,
                      "email": emailController.text,
                    });
                    if (!context.mounted) return;
                    Navigator.of(context).pop();*/
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
