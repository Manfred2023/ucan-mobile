import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/authentication/model/authentication.dart';

import '../../../data/account/repository/account_repository.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/regex_format.dart';
import '../../shared/widget/card_shimmer.dart';

class UcanHomeScreen extends StatelessWidget {
  const UcanHomeScreen({super.key});

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
  Authentication? currentUser;
  Account? account;
  bool amount = false;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.welcome, (route) => false);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: ColorsApp.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text(
                      "Se deconnecter",
                      style: TextStyle(
                          color: ColorsApp.onSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: ColorsApp.primary,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.notif);
                },
                icon: const Icon(Icons.notifications)),
            IconButton(
              onPressed: () {
                isLoading = true;
                reload();
                setState(() {});
              },
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            reload();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  if (currentUser != null)
                    Row(
                      children: [
                        const Text(
                          "Bienvenue, ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        if (currentUser!.contact?.firstname != null)
                          Text(
                            currentUser!.contact!.firstname ?? '',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          currentUser!.contact!.lastname ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: ColorsApp.primary.withOpacity(0.1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Portefeuille',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w100),
                              ),
                              isLoading
                                  ? const SizedBox(
                                      width: 250,
                                      child: CardShimmer(
                                        color: ColorsApp.textColor,
                                        height: 20,
                                      ),
                                    )
                                  : Text(
                                      RegexFormat.contentDoubleMoneyFormat(
                                          account!.amount!.toStringAsFixed(2),
                                          'fr'),
                                      style: const TextStyle(
                                          color: ColorsApp.secondary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                            ],
                          ),
                          isLoading
                              ? Container()
                              : Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            Routes.paiement,
                                            arguments: [account, true]);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorsApp.onSecondary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Créditer',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            Routes.paiement,
                                            arguments: [account, false]);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: ColorsApp.onSecondary,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Débiter',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
    init();
    reload();
    super.initState();
  }

  Future<void> init() async {
    currentUser = await getIt<AuthenticateRepository>().getAuth();

    if (currentUser == null) {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.loginStep1, (route) => false);
    } else {
      reload();
    }
    setState(() {});
  }

  reload() async {
    if (currentUser != null) {
      account =
          await getIt<AccountRepository>().account(token: currentUser!.code!);

      setState(() {
        isLoading = false;
      });
    }
  }
}
