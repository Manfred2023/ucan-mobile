/*
// Created by Manfred MOUKATE on 6/25/24, 5:45 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 5:45 PM

import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/account/model/paiement.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../app/navigation/route.dart';
import '../../../data/account/model/motif.dart';
import '../../../data/account/repository/account_repository.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/app_date.dart';
import '../../../utils/helpers/g.dart';
import '../../../utils/helpers/regex_format.dart';
import '../../shared/widget/card_shimmer.dart';

class PaiementSreen extends StatelessWidget {
  const PaiementSreen({
    super.key,
    required this.type,
  });

  final bool type;

  @override
  Widget build(BuildContext context) {
    return PaiementView(
      type: type,
    );
  }
}

class PaiementView extends StatefulWidget {
  const PaiementView({super.key, required this.type});

  final bool type;

  @override
  State<PaiementView> createState() => _PaiementViewState();
}

class _PaiementViewState extends State<PaiementView> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController motifController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();
  DateTime selectedDto = DateTime.now();

  bool isLoading = true;
  List<Paiement> paiement = [];
  double totalAmount = 0;
  Motif? motif;
  String? message;
  Authentication? currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: Scaffold(
        backgroundColor: ColorsApp.onSecondary,
        appBar: AppBar(
          backgroundColor: ColorsApp.primary,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  if (widget.type == true)
                    const Text(
                      "Mes recharges",
                      style: TextStyle(
                          color: ColorsApp.onSecondary,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    )
                  else
                    const Text(
                      "Mes dépenses",
                      style: TextStyle(
                          color: ColorsApp.onSecondary,
                          fontWeight: FontWeight.w300,
                          fontSize: 20),
                    ),
                ],
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            isLoading = true;
            reload();
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total  : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      RegexFormat.contentDoubleMoneyFormat(
                          totalAmount.toStringAsFixed(2), 'fr'),
                      style: const TextStyle(
                          color: ColorsApp.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  height: 5,
                ),
                isLoading
                    ? Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            const Column(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context)
                .pushNamed(Routes.paiement, arguments: widget.type);
            if (!context.mounted) return;
            paiement.clear();
            reload();
          },
          child: const Icon(
            Icons.add,
            size: 30,
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

  init() async {
    dateController.text = AppDate.dateTimeLetter(_endDate, 'fr');
    currentUser = await getIt<AuthenticateRepository>().getAuth();

    if (currentUser != null) {
      reload();
    }
  }

  reload() async {
    try {
      paiement.clear();
      totalAmount = 0;
      final paiementRemote = await getIt<AccountRepository>()
          .getPaiement(token: currentUser!.code!);

      if (paiementRemote.isNotEmpty) {
        for (final type in paiementRemote) {
          if (type.type == widget.type) {
            paiement.add(type);
            totalAmount += type.amount ?? 0;
          }
        }
        if (paiement.isNotEmpty) {
          paiement.sort((a, b) => b.date!.compareTo(a.date!));
        }
        setState(() {
          isLoading = false;
        });
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      AlertService.showSnack(context, message: e.toString(), onPressed: () {
        reload();
      }, actionText: "Reload");
    }
  }

  Future<DateTime?> _selectDate(
      BuildContext context, String helpText, DateTime selectedDate) async {
    var selected = await showDatePicker(
        context: context,
        barrierDismissible: false,
        initialDate: selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime.now(),
        locale: const Locale("fr"),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        helpText: helpText);
    if (selected != null && selected != selectedDate) {
      setState(() {
        selected = selected;
      });
    }
    return selected;
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    var selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (selected != null) {
      setState(() {
        selected = selected;
      });
    }
    return selected;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context, 'Choisir une date', _endDate);

    if (!context.mounted) return;
    final time = await _selectTime(context);

    if (date != null && time != null) {
      return DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    }
    return null;
  }
}
*/
