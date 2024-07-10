import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/app/navigation/route.dart';
import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../data/account/model/paiement.dart';
import '../../../data/account/repository/account_repository.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/app_date.dart';
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
  List<Paiement> paiement = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
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
                  Navigator.of(context).pushNamed(Routes.account);
                },
                icon: SvgPicture.asset('assets/icons/user.svg')),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            isLoading = true;
            reload();
            setState(() {});
          },
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
                isLoading
                    ? const CardShimmer(
                        color: ColorsApp.textColor,
                        height: 150,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorsApp.primary.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          TablerIcons.eye_off,
                                          color:
                                              ColorsApp.primary.withOpacity(0),
                                        )),
                                    !amount
                                        ? const Text(
                                            '******',
                                            style: TextStyle(
                                                color: ColorsApp.secondary,
                                                fontSize: 50,
                                                fontWeight: FontWeight.w100),
                                          )
                                        : Flexible(
                                            child: Text(
                                              RegexFormat
                                                  .contentDoubleMoneyFormat(
                                                      account!.amount!
                                                          .toStringAsFixed(2),
                                                      'fr'),
                                              style: const TextStyle(
                                                  color: ColorsApp.secondary,
                                                  fontSize: 45,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ),
                                    IconButton(
                                        onPressed: () {
                                          if (amount) {
                                            setState(() {
                                              amount = false;
                                            });
                                          } else {
                                            setState(() {
                                              amount = true;
                                            });
                                          }
                                        },
                                        icon: amount
                                            ? const Icon(
                                                TablerIcons.eye,
                                                color: ColorsApp.primary,
                                              )
                                            : const Icon(
                                                TablerIcons.eye_off,
                                                color: ColorsApp.primary,
                                              )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        color: ColorsApp.primary,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  Routes.paiementList,
                                                  arguments: false);
                                            },
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                color: ColorsApp.withrow,
                                                child: const Center(
                                                    child: Text(
                                                  'Dépense',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: ColorsApp
                                                          .onSecondary),
                                                ))),
                                          )),
                                          Expanded(
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                  Routes.paiementList,
                                                  arguments: true);
                                            },
                                            child: Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                color: ColorsApp.primary,
                                                child: const Center(
                                                    child: Text(
                                                  'Recharge',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16,
                                                      color: ColorsApp
                                                          .onSecondary),
                                                ))),
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Historique des transactions",
                      style: TextStyle(
                          color: ColorsApp.textColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 19),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Column(
                              children: [
                                CardShimmer(
                                  color: ColorsApp.textColor,
                                  height: 65,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                        ],
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: paiement.length,
                            itemBuilder: (context, index) {
                              final account = paiement[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Container(
                                  color: account.type != true
                                      ? ColorsApp.onPrimary.withOpacity(0.1)
                                      : ColorsApp.greenColor.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              account.motif!.toString() ?? '',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              RegexFormat
                                                  .contentDoubleMoneyFormat(
                                                      account.amount!
                                                          .toStringAsFixed(2),
                                                      'fr'),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              AppDate.dateTimeWithDay(
                                                  account.date!, 'fr'),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              ],
            ),
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
    setState(() {});
    reload();
    setState(() {});
  }

  reload() async {
    if (currentUser != null) {
      try {
        account =
            await getIt<AccountRepository>().account(token: currentUser!.code!);
        paiement = await getIt<AccountRepository>().getPaiement(
          token: currentUser!.code!,
        );
        if (paiement.isNotEmpty) {
          paiement.sort((a, b) => b.date!.compareTo(a.date!));
        }

        setState(() {
          isLoading = false;
        });
      } catch (e) {
        AlertService.showSnack(context,
            message: e.toString(), onPressed: () {}, actionText: "OK");
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
