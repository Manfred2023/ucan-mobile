import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';

import '../../../app/navigation/route.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../shared/widget/custom_divider.dart';
import '../../shared/widget/custom_list_tile.dart';
import '../../shared/widget/modal_bottom.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountView();
  }
}

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
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
  Authentication? currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.foreground,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        title: Text(
          'Mes informations personnelles',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: ColorsApp.onSecondary,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: RadioListTile<bool>(
                              activeColor: ColorsApp.secondary,
                              contentPadding: const EdgeInsets.all(0.0),
                              title: const Text(
                                "Femme",
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
                                'Homme',
                                style: const TextStyle(),
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
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.text,
                                textEditingController: firstnameController,
                                description:
                                    'petite description du champ de saisi',
                                label: "Firstname", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'Location';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              firstnameController.text = value;
                            });
                          }
                        });
                      },
                      title: "Firstname",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (firstnameController.text.trim().isNotEmpty)
                            Text(firstnameController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.text,
                                textEditingController: lastnameController,
                                textCapitalization:
                                    TextCapitalization.characters,
                                description:
                                    'petite description du champ de saisi',
                                label: "Lastname", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'Location';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              lastnameController.text = value;
                            });
                          }
                        });
                      },
                      title: "Lastname",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (lastnameController.text.trim().isNotEmpty)
                            Text(lastnameController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.emailAddress,
                                textEditingController: emailController,
                                description:
                                    'petite description du champ de saisi',
                                label: "Email", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'Email';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              emailController.text = value;
                            });
                          }
                        });
                      },
                      title: "Email",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (emailController.text.trim().isNotEmpty)
                            Text(emailController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: ColorsApp.onSecondary,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.text,
                                textEditingController: countryController,
                                description:
                                    'petite description du champ de saisi',
                                label: "Country", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'Country';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              countryController.text = value;
                            });
                          }
                        });
                      },
                      title: "Country",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (countryController.text.trim().isNotEmpty)
                            Text(countryController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.text,
                                textEditingController: cityController,
                                description:
                                    'petite description du champ de saisi',
                                label: "City", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'City';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              cityController.text = value;
                            });
                          }
                        });
                      },
                      title: "City",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (cityController.text.trim().isNotEmpty)
                            Text(cityController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.phone,
                                textEditingController: phoneController,
                                description:
                                    'Petite description du champ de saisie',
                                label: "mobile", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'mobile';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              phoneController.text = value;
                            });
                          }
                        });
                      },
                      title: "Mobile",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (phoneController.text.trim().isNotEmpty)
                            Text(phoneController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                    CustomListTile(
                      onTap: () {
                        ModalService.showTextFieldForm(context,
                                keyboardType: TextInputType.phone,
                                textEditingController: locationController,
                                description:
                                    'petite description du champ de saisi',
                                label: "location", validation: (value) {
                          if (value!.isEmpty && value.trim().isEmpty) {
                            return 'location';
                          }
                          return null;
                        }, isRequired: true, save: 'Enregistrer')
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              locationController.text = value;
                            });
                          }
                        });
                      },
                      title: "Location",
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (locationController.text.trim().isNotEmpty)
                            Text(locationController.text.trim().toLowerCase(),
                                style: const TextStyle(
                                    color: ColorsApp.primary, fontSize: 16))
                          else
                            const Icon(
                              Icons.navigate_next,
                              color: ColorsApp.secondary,
                            ),
                        ],
                      ),
                    ),
                    const CustomDivider(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () async {
            await getIt<AuthenticateRepository>().disconnect();
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.loginStep1, (route) => false);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
                color: ColorsApp.primary,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              "Se déconnecter",
              style: TextStyle(
                  color: ColorsApp.onSecondary,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            )),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    currentUser = await getIt<AuthenticateRepository>().getAuth();
    if (currentUser != null) {
      lastnameController.text = currentUser!.contact!.lastname!;
      firstnameController.text = currentUser!.contact!.firstname!;
      phoneController.text = currentUser!.contact!.mobile!;
      emailController.text = currentUser!.contact!.email!;
      cityController.text = currentUser!.contact!.city!.name;
      countryController.text = currentUser!.contact!.city!.country.namefr;
      locationController.text = currentUser!.contact!.location!;
      if (currentUser!.contact!.gender! != true) {
        _isMen = true;
      } else {
        _isMen = false;
      }
    }

    setState(() {});
  }
}
