import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';
import 'package:ucan/utils/helpers/g.dart';

import '../../../app/config/colors.dart';
import '../../../app/config/constant.dart';
import '../../../app/navigation/route.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../data/requirement/repository/requirement_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/h_phonenumber.dart';

class SignupOneScreen extends StatelessWidget {
  const SignupOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignupOneView();
  }
}

class SignupOneView extends StatefulWidget {
  const SignupOneView({super.key});

  @override
  State<SignupOneView> createState() => _SignupOneViewState();
}

class _SignupOneViewState extends State<SignupOneView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController hideController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController hidecityController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  bool _isMen = true;
  City? city;
  String? country;
  Contact? contact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorsApp.onSecondary,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/ucanpurple.svg',
                              width: 40,
                              height: 40,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Créer un compte',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: RadioListTile<bool>(
                                      activeColor: ColorsApp.secondary,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: const Text(
                                        "Mme",
                                        style: TextStyle(),
                                      ),
                                      value: false,
                                      groupValue: _isMen,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isMen = value!;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile<bool>(
                                      activeColor: ColorsApp.secondary,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      title: const Text(
                                        "Mr",
                                        style: TextStyle(),
                                      ),
                                      value: true,
                                      groupValue: _isMen,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          _isMen = value!;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: firstnameController,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: ColorsApp.secondary,
                                  fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                labelText: 'Prenom',
                                labelStyle: const TextStyle(
                                    color: ColorsApp.secondary,
                                    fontFamily: Constants.roboto),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: lastnameController,

                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: ColorsApp.secondary,
                                  fontWeight: FontWeight.w700),
                              decoration: InputDecoration(
                                  labelText: 'Nom',
                                  labelStyle: const TextStyle(
                                      color: ColorsApp.secondary,
                                      fontFamily: Constants.roboto),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorsApp.formField),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorsApp.formField),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10))),

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "lastName";
                                }
                                return null;
                              },

                              //initialValue: messages.text,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  color: ColorsApp.secondary,
                                  fontWeight: FontWeight.w700),
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [
                                AutofillHints.email,
                              ],
                              decoration: InputDecoration(
                                labelText: "email",
                                labelStyle: const TextStyle(
                                    color: ColorsApp.secondary,
                                    fontFamily: Constants.roboto),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: TextFormField(
                                      controller: countryController,
                                      style: const TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.w700),
                                      readOnly: true,
                                      keyboardType: TextInputType.text,
                                      onTap: () async {
                                        final countrySelect =
                                            await Navigator.of(context)
                                                .pushNamed(
                                          Routes.selectCountry,
                                        ) as Country?;
                                        if (countrySelect != null) {
                                          setState(() {
                                            countryController.text =
                                                countrySelect.dialcode
                                                    .toString();
                                          });
                                        }
                                      },
                                      decoration: InputDecoration(
                                        labelText: 'Pays',
                                        labelStyle: const TextStyle(
                                            color: ColorsApp.secondary,
                                            fontFamily: Constants.roboto),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsApp.formField),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsApp.formField),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        suffixIcon: const Icon(
                                            TablerIcons.chevron_down),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "country";
                                        }
                                        return null;
                                      },
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: phoneController,

                                    autofillHints: const [
                                      AutofillHints.telephoneNumber,
                                    ],
                                    textInputAction: TextInputAction.next,
                                    style: const TextStyle(
                                        color: ColorsApp.secondary,
                                        fontWeight: FontWeight.w700),
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        labelText: "Mobile",
                                        labelStyle: const TextStyle(
                                            color: ColorsApp.secondary,
                                            fontFamily: Constants.roboto),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsApp.formField),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: ColorsApp.formField),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "mobileNumberLong";
                                      }
                                      if (!RegExp(HPhoneNumber.regexNumberCam)
                                              .hasMatch(
                                                  value.replaceAll(' ', '')) &&
                                          value.isNotEmpty) {
                                        return 'mobile number invalide';
                                      }
                                      return null;
                                    },

                                    //initialValue: messages.text,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: cityController,
                              style: const TextStyle(
                                  color: ColorsApp.secondary,
                                  fontWeight: FontWeight.w700),
                              readOnly: true,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              onTap: () async {
                                if (countryController.text.isEmpty) {
                                  AlertService.showSnack(context,
                                      message: "pleaseSelectCountryFirst",
                                      onPressed: () {},
                                      actionText: "OK");
                                } else {
                                  final citySelect = await Navigator.of(context)
                                      .pushNamed(Routes.selectCity) as City?;
                                  if (citySelect != null) {
                                    setState(() {
                                      cityController.text = citySelect.name;
                                      hidecityController.text =
                                          citySelect.code!.toString();
                                    });
                                  }
                                }
                              },
                              decoration: InputDecoration(
                                labelText: "Ville",
                                labelStyle: const TextStyle(
                                    color: ColorsApp.secondary,
                                    fontFamily: Constants.roboto),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: ColorsApp.formField),
                                    borderRadius: BorderRadius.circular(10)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(10)),
                                suffixIcon:
                                    const Icon(TablerIcons.chevron_down),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "city";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: locationController,
                              textInputAction: TextInputAction.done,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(
                                  color: ColorsApp.secondary,
                                  fontWeight: FontWeight.w700),
                              onEditingComplete: () {
                                print("object");
                              },
                              decoration: InputDecoration(
                                  labelText: 'Quartier',
                                  labelStyle: const TextStyle(
                                      color: ColorsApp.secondary,
                                      fontFamily: Constants.roboto),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorsApp.formField),
                                      borderRadius: BorderRadius.circular(10)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: ColorsApp.formField),
                                      borderRadius: BorderRadius.circular(10)),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10)),
                                  errorBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10))),

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "location";
                                }
                                return null;
                              },
                              //initialValue: messages.text,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      )),
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
                      if (_formKey.currentState!.validate()) {
                        try {
                          AlertService.showLoad(context);
                          contact = await getIt<AuthenticateRepository>()
                              .createContact(
                                  firstname: firstnameController.text.trim(),
                                  lastname: lastnameController.text.trim(),
                                  mobile: phoneController.text.trim(),
                                  gender: _isMen,
                                  email: emailController.text.trim(),
                                  city: hidecityController.text,
                                  location: locationController.text);
                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          print(contact);
                          if (contact is Contact) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.signup2, (route) => false,
                                arguments: contact);
                          }
                        } catch (e) {
                          Navigator.of(context).pop();
                          AlertService.showSnack(context,
                              message: e.toString(),
                              onPressed: () {},
                              actionText: 'Okay');
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
                        "Créer mon compte",
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
                        "Vous avez déjà compte ?",
                        style: TextStyle(color: ColorsApp.textColorCC),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.loginStep1);
                        },
                        child: const Text(
                          "Se connecter",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: ColorsApp.primary),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  final requis = getIt<RequirementRepository>();
  init() async {}
}
