// Created by Manfred MOUKATE on 7/10/24, 3:56 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 7/10/24, 3:56 PM
import 'package:flutter/material.dart';

import '../../../app/config/colors.dart';
import '../../../data/account/repository/account_repository.dart';
import '../../../data/authentication/model/authentication.dart';
import '../../../data/authentication/repository/authenticate_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/app_date.dart';
import '../../../utils/helpers/regex_format.dart';
import '../../shared/design_system/utils/alert_service.dart';
import '../../shared/design_system/utils/dimens.dart';

class UcanPaiementScreen extends StatelessWidget {
  const UcanPaiementScreen({super.key, required this.type});
  final bool type;

  @override
  Widget build(BuildContext context) {
    return UcanPaiementView(
      type: type,
    );
  }
}

class UcanPaiementView extends StatefulWidget {
  const UcanPaiementView({super.key, required this.type});
  final bool type;
  @override
  State<UcanPaiementView> createState() => _UcanPaiementViewState();
}

class _UcanPaiementViewState extends State<UcanPaiementView> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController motifController = TextEditingController();
  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();
  DateTime selectedDto = DateTime.now();
  Authentication? currentUser;
  final formKey = GlobalKey<FormState>();

  String? message;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onTap: () async {
                          final date = await _selectDateTime(context);
                          if (date != null) {
                            setState(() {
                              dateController.text =
                                  AppDate.dateTimeLetter(date, 'fr');
                              selectedDto = date;
                            });
                          }
                        },
                        readOnly: true,
                        controller: dateController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        // textAlign: TextAlign.justify,
                        style: const TextStyle(
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "Date",
                          hintStyle: TextStyle(
                              color: ColorsApp.primary,
                              fontWeight: FontWeight.w100),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.error),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Date";
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
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "amount",
                          hintStyle: TextStyle(
                              color: ColorsApp.primary,
                              fontWeight: FontWeight.w100),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.error),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Saisir un montant";
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
                        maxLines: 3,
                        style: const TextStyle(
                            color: ColorsApp.primary,
                            fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: "Motif",
                          hintStyle: TextStyle(
                              color: ColorsApp.primary,
                              fontWeight: FontWeight.w100),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: ColorsApp.primary)),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: ColorsApp.error),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Veuillez choisir une raison";
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {
              print(widget.type);
              print(AppDate.dateTime(selectedDto));
              print(
                int.parse(amountController.text),
              );
              print(motifController.text);
              print(currentUser!.code!);
              if (formKey.currentState!.validate()) {
                AlertService.showLoad(context);

                try {
                  message = await getIt<AccountRepository>()
                      .convert(number: int.parse(amountController.text));
                  if (!context.mounted) return;
                  Navigator.of(context).pop();

                  AlertService.showAlert(
                      context: context,
                      isBarrier: false,
                      message: "",
                      type: AlertType.modalDoubleAction,
                      title: "Confirmer l'action" ?? '',
                      content: Padding(
                        padding: const EdgeInsets.all(Dimens.marginMedium),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Vous etes sur le point de ",
                                children: [
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  if (widget.type == true)
                                    const TextSpan(
                                      text: "Créditer ",
                                      style: TextStyle(
                                          color: ColorsApp.primary,
                                          fontWeight: FontWeight.bold),
                                    )
                                  else
                                    const TextSpan(
                                      text: "Débiter",
                                      style: TextStyle(
                                          color: ColorsApp.primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                    text: "Votre compte d'un montant de ",
                                    style:
                                        TextStyle(color: ColorsApp.textColorCC),
                                  ),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: RegexFormat.contentDoubleMoneyFormat(
                                        int.parse(amountController.text)
                                            .toStringAsFixed(2),
                                        'fr'),
                                    style: const TextStyle(
                                        color: ColorsApp.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: " (${message ?? ''})",
                                    style: const TextStyle(
                                        color: ColorsApp.primary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  const TextSpan(
                                    text: 'pour',
                                    style:
                                        TextStyle(color: ColorsApp.textColorCC),
                                  ),
                                  const TextSpan(
                                      text: ' ',
                                      style: TextStyle(
                                          color: ColorsApp.secondary,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                      text: motifController.text,
                                      style: const TextStyle(
                                          color: ColorsApp.primary,
                                          fontWeight: FontWeight.bold)),
                                ],
                                style: const TextStyle(
                                  color: ColorsApp.textColorCC,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      actionRightText: 'continuer' ?? '',
                      onPressRight: () async {
                        try {
                          Navigator.of(context).pop();
                          AlertService.showLoad(context);
                          await getIt<AccountRepository>().savePaiement(
                              type: widget.type,
                              date: AppDate.dateTime(selectedDto),
                              amount: int.parse(amountController.text),
                              motif: motifController.text,
                              auth: currentUser!.code!);
                          if (!context.mounted) return;
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          AlertService.showSnack(context,
                              isSuccess: true,
                              message: 'request_was_successfully_processed',
                              onPressed: () {},
                              actionText: "Okay");
                        } catch (e) {
                          Navigator.of(context).pop();
                          AlertService.showSnack(context, message: e.toString(),
                              onPressed: () {
                            setState(() {});
                          }, actionText: 'Ok');
                        }
                      },
                      onPressLeft: () {
                        Navigator.of(context).pop();
                      },
                      actionLeftText: "cancel");
                } catch (e) {
                  Navigator.of(context).pop();
                  AlertService.showSnack(context,
                      message: e.toString(),
                      onPressed: () {},
                      actionText: "OK");
                }
              }
            },
            child: Container(
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
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              )),
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
    dateController.text = AppDate.dateTimeLetter(_endDate, 'fr');
    currentUser = await getIt<AuthenticateRepository>().getAuth();

    setState(() {});
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
