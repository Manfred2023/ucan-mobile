import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:pinput/pinput.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../app/navigation/route.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/g.dart';

class SignupTwoScreen extends StatelessWidget {
  const SignupTwoScreen({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return SignupTwoView(contact: contact);
  }
}

class SignupTwoView extends StatefulWidget {
  SignupTwoView({super.key, required this.contact});

  final Contact contact;

  @override
  State<SignupTwoView> createState() => _SignupTwoViewState();
}

class _SignupTwoViewState extends State<SignupTwoView> {
  TextEditingController codeController = TextEditingController();
  Authentication? auth;
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
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorsApp.onSecondary,
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
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
                  'Bienvenue',
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
                    if (widget.contact.gender == "true")
                      Text("Mr")
                    else
                      Text("Mme"),
                    const SizedBox(
                      width: 5,
                    ),
                    if (widget.contact.firstname != null)
                      Text(
                        widget.contact.firstname!,
                      ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.contact.lastname!,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Créer votre code PIN et gérez vos dépenses en toute confidentialité. ",
                  style: TextStyle(color: ColorsApp.textColorCC),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Pinput(
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
                            onCompleted: (String pin) async {
                              AlertService.showLoad(context);
                              try {
                                auth = await getIt<AuthenticateRepository>()
                                    .createUser(
                                        pin: int.parse(codeController.text),
                                        contact: widget.contact.code!);
                                if (!context.mounted) return;
                                if (auth is Authentication) {
                                  print("Voici le resultat");
                                  print(auth);
                                  print("Voici le resultat");
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.ucan,
                                    (route) => false,
                                  );
                                }
                              } catch (e) {
                                Navigator.of(context).pop();
                                AlertService.showSnack(context,
                                    message: e.toString(),
                                    onPressed: () {},
                                    actionText: 'Okay');
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
