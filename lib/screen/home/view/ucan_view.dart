import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';

class UcanScreen extends StatelessWidget {
  const UcanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const UcanView();
  }
}

class UcanView extends StatefulWidget {
  const UcanView({super.key});

  @override
  State<UcanView> createState() => _UcanViewState();
}

class _UcanViewState extends State<UcanView> {
  bool amount = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: ColorsApp.acce,

      body: SizedBox(
          child: Column(
        children: [
          Container(
            height: 50,
            decoration: const BoxDecoration(
              color: ColorsApp.primary,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.8,
            decoration: const BoxDecoration(
              color: ColorsApp.primary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.account);
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorsApp.onSecondary,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.notif);
                        },
                        child: const CircleAvatar(
                          backgroundColor: ColorsApp.onPrimary,
                          child: Icon(
                            Icons.notifications,
                            color: ColorsApp.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Votre solde courant',
                                style: TextStyle(
                                    color: ColorsApp.onSecondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w200),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    if (amount == false) {
                                      setState(() {
                                        amount = true;
                                      });
                                    } else {
                                      setState(() {
                                        amount = false;
                                      });
                                    }
                                  },
                                  child: const Icon(Icons.remove_red_eye))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              amount
                                  ? const Text(
                                      "****",
                                      style: TextStyle(
                                          color: ColorsApp.onSecondary,
                                          fontSize: 30),
                                    )
                                  : const Text(
                                      "10 000",
                                      style: TextStyle(
                                          color: ColorsApp.onSecondary,
                                          fontSize: 20),
                                    ),
                              const SizedBox(
                                width: 3,
                              ),
                              const Text(
                                "FCFA",
                                style: TextStyle(
                                    color: ColorsApp.onSecondary,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: ColorsApp.onPrimary,
                                    borderRadius: BorderRadius.circular(200)),
                                child: const Icon(
                                  Icons.upload,
                                ),
                              ),
                              const Text(
                                "Envoyer",
                                style: TextStyle(color: ColorsApp.onSecondary),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: ColorsApp.onPrimary,
                                    borderRadius: BorderRadius.circular(200)),
                                child: const Icon(
                                  Icons.download,
                                ),
                              ),
                              const Text(
                                "Retirer",
                                style: TextStyle(color: ColorsApp.onSecondary),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SizedBox(
            height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.wallet,
                        color: ColorsApp.primary,
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          color: ColorsApp.primary,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.signal_cellular_alt,
                        color: Color.fromARGB(255, 105, 102, 102),
                      ),
                      Text(
                        "Activite",
                        style: TextStyle(
                          color: Color.fromARGB(255, 105, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.account_box_rounded,
                        color: Color.fromARGB(255, 105, 102, 102),
                      ),
                      Text(
                        "Compte",
                        style: TextStyle(
                          color: Color.fromARGB(255, 105, 102, 102),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.details,
                        color: Color.fromARGB(255, 105, 102, 102),
                      ),
                      Text(
                        "Autre",
                        style: TextStyle(
                          color: Color.fromARGB(255, 105, 102, 102),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
