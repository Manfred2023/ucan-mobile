import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ucan/app/config/colors.dart';

class CheckNumberScreen extends StatelessWidget {
  const CheckNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheckNumberView();
  }
}

class CheckNumberView extends StatefulWidget {
  const CheckNumberView({super.key});

  @override
  State<CheckNumberView> createState() => _CheckNumberViewState();
}

class _CheckNumberViewState extends State<CheckNumberView> {
  TextEditingController codeController = TextEditingController();
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
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Form(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Verification ",
                      style: TextStyle(
                          fontSize: 35,
                          color: ColorsApp.primary,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Pinput(
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
                              border: Border.all(color: Colors.transparent))),
                      //controller: codeController,
                      onCompleted: (pin) => debugPrint(pin),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: InkWell(
          onTap: () {},
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
                "Envoyer",
                style: TextStyle(color: ColorsApp.onSecondary, fontSize: 20),
                textAlign: TextAlign.center,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
