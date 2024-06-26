// Created by Manfred MOUKATE on 6/25/24, 5:45 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 5:45 PM

import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/account/model/account.dart';
import 'package:ucan/data/account/model/paiement.dart';
import 'package:ucan/data/account/repository/account_repository.dart';
import 'package:ucan/utils/dependancies.dart';

import '../../../utils/helpers/app_date.dart';
import '../../../utils/helpers/regex_format.dart';

class PaiementSreen extends StatelessWidget {
  const PaiementSreen({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    return PaiementView(
      account: account,
    );
  }
}

class PaiementView extends StatefulWidget {
  const PaiementView({super.key, required this.account});

  final Account account;

  @override
  State<PaiementView> createState() => _PaiementViewState();
}

class _PaiementViewState extends State<PaiementView> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController motifController = TextEditingController();

  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();

  bool isLoading = true;
  List<Paiement> paiement = [];

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
        helpText: helpText ?? '');
    if (selected != null && selected != selectedDate) {
      setState(() {
        selected = selected;
      });
    }
    return selected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: const BoxDecoration(color: ColorsApp.primary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PorteFeuille',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                color: ColorsApp.onSecondary),
                          ),
                          Text(
                            '55 450',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: ColorsApp.onSecondary),
                          )
                        ],
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: ColorsApp.onSecondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '+ Ajouter',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.primary),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Account : ',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      '55 450',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onTap: () async {
                    final date = await _selectDate(
                        context, 'Choisir une date', _endDate);
                    if (date != null) {
                      setState(() {
                        dateController.text = AppDate.dateDto(_endDate);
                        // dateController.text = _endDate.toString();
                      });
                    }
                  },
                  readOnly: true,
                  controller: dateController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.datetime,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Date",
                    hintStyle: TextStyle(
                        color: ColorsApp.primary, fontWeight: FontWeight.w100),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: ColorsApp.error),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Adresse e-mail ou numéro de téléphone";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: amountController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "amount",
                    hintStyle: TextStyle(
                        color: ColorsApp.primary, fontWeight: FontWeight.w100),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: ColorsApp.error),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Montant e-mail ou numéro de téléphone";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: motifController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      color: ColorsApp.primary, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "Motif",
                    hintStyle: TextStyle(
                        color: ColorsApp.primary, fontWeight: FontWeight.w100),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: ColorsApp.primary)),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: ColorsApp.error),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Motif";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: ColorsApp.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Enregistrer",
                    style: TextStyle(
                        color: ColorsApp.onSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Text(
                      'Historique',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                isLoading
                    ? const Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                            itemCount: paiement.length,
                            itemBuilder: (context, index) {
                              final account = paiement[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 2),
                                child: Container(
                                  color: account.type != true
                                      ? ColorsApp.error.withOpacity(0.1)
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
                                              account.motif!.name ?? '',
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
                                              account.date.toString() ?? '',
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
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    init();

    super.initState();
  }

  init() async {
    dateController.text = _endDate.toString();
    if (widget.account.code != null) {
      print(widget.account.code);
      paiement = await getIt<AccountRepository>()
          .getPaiement(token: widget.account.code!);

      if (paiement.isNotEmpty) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
