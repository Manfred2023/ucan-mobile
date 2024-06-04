import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
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

      body: SafeArea(
        child: SizedBox(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                color: ColorsApp.onPrimary,
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
                            backgroundColor: ColorsApp.onPrimary,
                            child: Icon(
                              Icons.account_circle_outlined,
                              color: ColorsApp.onSecondary,
                              size: 35,
                            ),
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
                                  style:
                                      TextStyle(color: ColorsApp.onSecondary),
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
                                  style:
                                      TextStyle(color: ColorsApp.onSecondary),
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
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[200]!,
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: 15,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )),
      ),
      /* bottomNavigationBar: const SafeArea(
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
      ),*/
    );
  }
}
