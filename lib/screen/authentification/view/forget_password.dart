import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ForgotPassView();
  }
}

class ForgotPassView extends StatefulWidget {
  const ForgotPassView({super.key});

  @override
  State<ForgotPassView> createState() => _ForgotPassViewState();
}

class _ForgotPassViewState extends State<ForgotPassView> {
  TextEditingController emailController = TextEditingController();
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.onSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Avez-vous oublie votre mot de passe ??",
                  style: TextStyle(
                      color: ColorsApp.primary,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Ne vous inquiter pas, renseinger votre addresse email ou votre numero",
                  style: TextStyle(
                    color: ColorsApp.primary,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "Creer un compte",
                          style: TextStyle(
                              fontSize: 35,
                              color: ColorsApp.onPrimary,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    color: ColorsApp.primary,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Continuer",
                  style: TextStyle(color: ColorsApp.onSecondary, fontSize: 20),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
