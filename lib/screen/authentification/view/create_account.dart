import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ucan/utils/helpers/g.dart';

import '../../../app/config/colors.dart';
import '../../shared/design_system/utils/alert_service.dart';

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
  TextEditingController emailController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
  TextEditingController passcode1Controller = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  bool seepPass = true;
  bool errorPass = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        body: SafeArea(
          child: DefaultTabController(
            length: steps.length,
            child: Builder(
              builder: (BuildContext context) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Creer un compte",
                      style: TextStyle(
                          fontSize: 35,
                          color: ColorsApp.onPrimary,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TabPageSelector(
                      selectedColor: ColorsApp.onPrimary,
                    ),
                    const Expanded(
                      child: IconTheme(
                        data: IconThemeData(
                            size: 128, color: ColorsApp.onPrimary),
                        child: TabBarView(children: steps),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        signup();
                        /* final TabController controller =
                            DefaultTabController.of(context);

                        if (!controller.indexIsChanging) {
                          controller.animateTo(steps.length - 1);
                        }*/
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorsApp.onPrimary,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "Suivant",
                          style: TextStyle(
                              color: ColorsApp.onSecondary, fontSize: 20),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    )
                  ],
                ),
              ),
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
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "moukatemanfred@gmail.com",
        password: "Manfred500",
      );
      print('Result');
      print(credential);
      print('Result');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static const steps = <Widget>[
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            textCapitalization: TextCapitalization.characters,
            // controller: usernameController,
            textInputAction: TextInputAction.next,
            // textAlign: TextAlign.justify,
            style: TextStyle(
                color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: 'Prénom(s)',
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            textCapitalization: TextCapitalization.characters,
            //controller: usernameController,
            textInputAction: TextInputAction.next,
            // textAlign: TextAlign.justify,
            style: TextStyle(
                color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: 'Nom(s) de famille',
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            //controller: mobileController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: ColorsApp.primary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: "Country",
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            //controller: mobileController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: ColorsApp.primary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: "City",
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            //controller: mobileController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: ColorsApp.primary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: "N de téléphone portable",
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            //controller: mobileController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            style: TextStyle(
                color: ColorsApp.primary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: "Numero whatsapp",
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
        ],
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            textCapitalization: TextCapitalization.characters,
            // controller: usernameController,
            textInputAction: TextInputAction.next,
            // textAlign: TextAlign.justify,
            style: TextStyle(
                color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: 'Email',
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            textCapitalization: TextCapitalization.characters,
            //controller: usernameController,
            textInputAction: TextInputAction.next,
            // textAlign: TextAlign.justify,
            style: TextStyle(
                color: ColorsApp.onPrimary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: 'Mot de passe',
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
          SizedBox(height: 15),
          TextField(
            //controller: mobileController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
                color: ColorsApp.primary, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                labelText: "mot de passe",
                hintStyle: TextStyle(color: ColorsApp.onPrimary),
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
        ],
      ),
    ),
  ];
}
