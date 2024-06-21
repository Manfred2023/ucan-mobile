import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../app/navigation/route.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../shared/design_system/view/ds_button.dart';

class CheckNumberScreen extends StatelessWidget {
  const CheckNumberScreen({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return CheckNumberView(contact: contact);
  }
}

class CheckNumberView extends StatefulWidget {
  CheckNumberView({super.key, required this.contact});

  final Contact contact;

  @override
  State<CheckNumberView> createState() => _CheckNumberViewState();
}

class _CheckNumberViewState extends State<CheckNumberView> {
  TextEditingController codeController = TextEditingController();
  Authentication? auth;
  final defaultPinInput = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
          color: ColorsApp.primary, fontWeight: FontWeight.bold, fontSize: 25),
      decoration: BoxDecoration(
          color: ColorsApp.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.transparent)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        body: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Bienvenu(e)',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.contact.firstname != null)
                          Text(
                            widget.contact.firstname!,
                            style: const TextStyle(
                              fontSize: 30,
                              color: ColorsApp.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        Text(
                          widget.contact.lastname!,
                          style: const TextStyle(
                            fontSize: 30,
                            color: ColorsApp.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Créer un code PIN ",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: ColorsApp.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Pour faciliter l'access a votre compte",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: ColorsApp.textColorDark,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Pinput(
                          controller: codeController,
                          length: 6,
                          defaultPinTheme: defaultPinInput,
                          focusedPinTheme: defaultPinInput.copyWith(
                              textStyle: const TextStyle(
                                  color: ColorsApp.onPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              decoration: BoxDecoration(
                                  color: ColorsApp.textColorCcLight,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.transparent))),
                          //controller: codeController,
                          onCompleted: (pin) => debugPrint(pin),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: DSPrimaryButton(
              borderRadius: 100,
              backgroundColor: ColorsApp.primary,
              forceUpperCase: false,
              text: 'Créer mon compte',
              height: 54,
              textStyle:
                  const TextStyle(color: ColorsApp.onSecondary, fontSize: 20),
              onPressed: () async {
                if (codeController.length == 6) {
                  AlertService.showLoad(context);
                  try {
                    auth = await getIt<AuthenticateRepository>().createUser(
                        pin: int.parse(codeController.text),
                        code: widget.contact.code!,
                        contact: widget.contact.code!);
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.account, (route) => false,
                        arguments: auth);
                  } catch (e) {
                    Navigator.of(context).pop();
                    AlertService.showSnack(context,
                        message: e.toString(),
                        onPressed: () {},
                        actionText: 'Okay');
                  }
                }
              }),
        ),
      ),
    );
  }
}
