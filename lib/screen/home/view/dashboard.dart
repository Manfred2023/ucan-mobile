import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/authentication/model/authentication.dart';
import 'package:ucan/utils/helpers/app_date.dart';

import '../../../data/account/model/budget.dart';
import '../../../data/account/model/paiement.dart';
import '../../../data/account/model/subaccount.dart';
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
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  Authentication? currentUser;
  Account? account;
  Resume? resume;

  List<Budget>? budget = [];
  bool amount = false;
  bool isLoading = true;
  List<Paiement> paiement = [];
  List<SubAccount> subAccount = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        body: RefreshIndicator(
          onRefresh: () async {
            isLoading = true;
            reload();
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/armchair.svg",
                      height: 50,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (currentUser != null)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (currentUser?.contact?.firstname != null)
                                    Text(
                                      currentUser?.contact?.firstname ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400),
                                    ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    currentUser?.contact!.lastname ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            const Text(
                              'Bienvenue',
                              style: TextStyle(fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                isLoading
                    ? const CardShimmer(
                        color: ColorsApp.textColor,
                        height: 65,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: ColorsApp.primary.withOpacity(0.1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Solde total disponible',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                  Row(
                                    children: [
                                      !amount
                                          ? const Text(
                                              '*******',
                                              style: TextStyle(
                                                  color: ColorsApp.secondary,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : Text(
                                              '${RegexFormat.contentDoubleMoneyFormat(resume!.user!.amount!.toStringAsFixed(2), 'fr')} XAF',
                                              style: const TextStyle(
                                                  color: ColorsApp.secondary,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () {
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
                                          child: amount
                                              ? const Icon(
                                                  TablerIcons.eye,
                                                  color: ColorsApp.secondary,
                                                )
                                              : const Icon(
                                                  TablerIcons.eye_off,
                                                  color: ColorsApp.secondary,
                                                )),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  isLoading = true;
                                  reload();
                                  setState(() {});
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(25)),
                                      color: ColorsApp.onSecondary),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          TablerIcons.reload,
                                          color: ColorsApp.primary,
                                          size: 21,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Actualiser',
                                          style: TextStyle(
                                              color: ColorsApp.primary,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mes dépenses',
                      style: TextStyle(
                          color: ColorsApp.primary,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          TablerIcons.circle_plus_filled,
                          color: ColorsApp.primary,
                        ))
                  ],
                ),
                isLoading
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: budget?.length ?? 0,
                              itemBuilder: (context, index) {
                                final budgetResult = budget![index];

                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    height: 100,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: ColorsApp.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Center(
                                              child: Text(
                                                budgetResult.name ?? '',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 21,
                                                ),
                                              ),
                                            ),
                                          ),
                                          FutureBuilder<String?>(
                                            future:
                                                getSpent(budgetResult.code!),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Text('...');
                                              } else if (snapshot.hasError) {
                                                return const Text(
                                                  'Erreur',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                );
                                              } else if (snapshot.hasData &&
                                                  snapshot.data != null) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data}',
                                                          style: TextStyle(
                                                            color: ColorsApp
                                                                .primary,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                        Text('|'),
                                                        Text(
                                                          ' ${RegexFormat.contentDoubleMoneyFormat(budgetResult.ceiling!.toStringAsFixed(2), 'fr')}',
                                                          style:
                                                              const TextStyle(
                                                            color: ColorsApp
                                                                .secondary,
                                                            fontSize: 19,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Text(
                                                  '... / ${RegexFormat.contentDoubleMoneyFormat(budgetResult.ceiling!.toStringAsFixed(2), 'fr')}',
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Dernières opération',
                      style: TextStyle(
                          color: ColorsApp.primary,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Voir plus',
                          style: TextStyle(
                              color: ColorsApp.primary,
                              //fontSize: 19,
                              fontWeight: FontWeight.w500),
                        )),
                  ],
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
    resume = await getIt<AccountRepository>().resume(token: currentUser!.code!);
    if (resume != null) {
      setState(() {
        isLoading = false;
        budget = resume?.budget;
      });
    }
  }

  Future<String?> getSpent(int code) async {
    final spent = await getIt<AccountRepository>()
        .spent(bubget: code, date: AppDate.dateDto(_startDate));
    if (spent != null) {
      return spent.total.toString();
    }
    return null;
  }

  reload() async {}

  String formatBankNumber(int input) {
    String inputStr = input.toString().padLeft(6, '0');

    // Découper l'entrée en trois parties de deux chiffres
    String part1 = inputStr.substring(0, 2);
    String part2 = inputStr.substring(2, 4);
    String part3 = inputStr.substring(4, 6);

    // Convertir chaque paire en un format bancaire
    String formattedPart1 = '${part1[0]}000';
    String formattedPart2 = '${part2}00';
    String formattedPart3 = '${part3[0]}${part3[1]}80';

    // Combiner les parties avec des espaces
    return '$formattedPart1 $formattedPart2 $formattedPart3';
  }

  String generateVisaCode(String inputCode) {
    // Vérifier que le code d'entrée n'est pas trop long
    if (inputCode.length > 16) {
      return 'Erreur : le code d\'entrée est trop long';
    }

    // Commencer par '4' pour indiquer une carte Visa
    String visaCode = '4' + inputCode;

    // Ajouter des zéros à la fin pour atteindre 16 chiffres si nécessaire
    while (visaCode.length < 16) {
      visaCode += '0';
    }

    // Limiter la longueur à 16 caractères
    visaCode = visaCode.substring(0, 16);

    return visaCode;
  }

  void main() {
    String inputCode = '154353';
    String visaCode = generateVisaCode(inputCode);
    print('Code Visa généré : $visaCode');
  }
}
