import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryLigtPls,
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(Routes.notif);
              },
              child: const CircleAvatar(
                backgroundColor: ColorsApp.primaryLigt,
                child: Icon(
                  Icons.notifications,
                  color: ColorsApp.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorsApp.accent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
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
                        color: Color.fromARGB(255, 105, 102, 102),
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(
                          color: Color.fromARGB(255, 105, 102, 102),
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
                        color: ColorsApp.primary,
                      ),
                      Text(
                        "Compte",
                        style: TextStyle(
                          color: ColorsApp.primary,
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
