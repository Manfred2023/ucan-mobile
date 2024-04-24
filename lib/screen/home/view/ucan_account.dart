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
      backgroundColor: ColorsApp.onSecondary,
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
                backgroundColor: ColorsApp.onPrimary,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
