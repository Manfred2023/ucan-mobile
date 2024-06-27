// Created by Manfred MOUKATE on 6/25/24, 5:45 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 5:45 PM

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:ucan/app/config/colors.dart';
import 'package:ucan/data/account/model/paiement.dart';
import 'package:ucan/screen/shared/design_system/utils/alert_service.dart';

import '../../../app/navigation/route.dart';
import '../../../data/account/model/account.dart';
import '../../../data/account/model/motif.dart';
import '../../../data/account/repository/account_repository.dart';
import '../../../utils/dependancies.dart';
import '../../../utils/helpers/app_date.dart';
import '../../../utils/helpers/g.dart';
import '../../../utils/helpers/regex_format.dart';

class PaiementSreen extends StatelessWidget {
  const PaiementSreen({
    super.key,
    required this.object,
  });

  final List<dynamic> object;

  @override
  Widget build(BuildContext context) {
    return PaiementView(
      object: object,
    );
  }
}

class PaiementView extends StatefulWidget {
  const PaiementView({super.key, required this.object});

  final List<dynamic> object;

  @override
  State<PaiementView> createState() => _PaiementViewState();
}

class _PaiementViewState extends State<PaiementView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController motifController = TextEditingController();

  DateTime _startDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
  DateTime _endDate = DateTime.now();
  DateTime selectedDto = DateTime.now();

  bool isLoading = true;
  List<Paiement> paiement = [];
  Motif? motif;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        G.loseFocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primary,
          actions: [
            Row(
              children: [
                if (widget.object.last == true)
                  const Text(
                    "Mes entrées ",
                    style: TextStyle(
                        color: ColorsApp.onSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                else
                  const Text(
                    "Mes dépenses",
                    style: TextStyle(
                        color: ColorsApp.onSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                IconButton(
                  onPressed: () {
                    isLoading = true;
                    reload();
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    'Account : ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '55 450',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: _formKey,
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
                        onTap: () async {
                          motif = await Navigator.of(context)
                              .pushNamed(Routes.selectMotif) as Motif?;
                          setState(() {
                            if (motif != null) {
                              motifController.text = motif!.name!;
                            }
                          });
                        },
                        controller: motifController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        readOnly: true,
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
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    AlertService.showLoad(context);
                    try {
                      await getIt<AccountRepository>().savePaiement(
                          type: widget.object.last,
                          date: AppDate.dateTime(selectedDto),
                          amount: int.parse(amountController.text),
                          motif: motif!.code!,
                          account: widget.object.first.code!);
                      if (!context.mounted) return;
                      Navigator.of(context).pop();
                      AlertService.showSnack(context,
                          isSuccess: true,
                          message: 'request_was_successfully_processed',
                          onPressed: () {},
                          actionText: "Okay");
                      amountController.clear();
                      motifController.clear();
                      isLoading = true;
                      reload();
                      setState(() {});
                    } catch (e) {
                      Navigator.of(context).pop();
                      AlertService.showSnack(context, message: e.toString(),
                          onPressed: () {
                        reload();
                        setState(() {});
                      }, actionText: 'Ok');
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
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Historique',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                    onPressed: () async {
                      _startDate =
                          (await _selectDate(context, 'Debut', _startDate))!;
                      if (_startDate.isAfter(_endDate)) {
                        DateTime syncedDate = DateTime(
                          _startDate.year,
                          _startDate.month,
                          _startDate.day,
                        );
                        _startDate = syncedDate;
                        _endDate = syncedDate;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppDate.dateTimeWithoutTime(_startDate, 'fr'),
                          style: const TextStyle(color: ColorsApp.secondary),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/icons/chevron.svg',
                          color: ColorsApp.secondary,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text('-'),
                  ),
                  TextButton(
                    onPressed: () async {
                      _endDate = (await _selectDate(context, 'Fin', _endDate))!;
                      if (_endDate.isBefore(_startDate)) {
                        DateTime syncedDate = DateTime(
                          _endDate.year,
                          _endDate.month,
                          _endDate.day,
                        );
                        _startDate = syncedDate;
                        _endDate = syncedDate;
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          AppDate.dateTimeWithoutTime(_endDate, 'fr'),
                          style: const TextStyle(color: ColorsApp.secondary),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          'assets/icons/chevron.svg',
                          color: ColorsApp.secondary,
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
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
                            return Slidable(
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (_) async {
                                      AlertService.showLoad(context);
                                      try {
                                        await getIt<AccountRepository>()
                                            .deleteHistory(
                                                token: account.code!);
                                        if (!context.mounted) return;
                                        Navigator.of(context).pop();
                                      } catch (e) {
                                        Navigator.of(context).pop();
                                        AlertService.showSnack(context,
                                            isSuccess: true,
                                            message:
                                                'request_was_successfully_processed',
                                            onPressed: () {},
                                            actionText: "Okay");
                                        isLoading = true;
                                        reload();
                                        setState(() {});
                                      }
                                    },
                                    backgroundColor: ColorsApp.onPrimary,
                                    foregroundColor: ColorsApp.surface,
                                    icon: TablerIcons.trash,
                                    // label: 'Del',
                                  ),
                                ],
                              ),
                              child: Padding(
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
                                              AppDate.dateTime(account.date!),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
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
    );
  }

  @override
  void initState() {
    init();
    reload();
    super.initState();
  }

  init() async {
    dateController.text = AppDate.dateTimeLetter(_endDate, 'fr');

    if (widget.object.isNotEmpty &&
        widget.object.first.code != null &&
        widget.object.first is Account) {
      final paiementRemote = await getIt<AccountRepository>()
          .getPaiement(token: widget.object.first.code!);

      if (paiementRemote.isNotEmpty) {
        for (final type in paiementRemote) {
          if (type.type == widget.object.last) {
            paiement.add(type);
          }
        }

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
    }
  }

  reload() async {
    if (widget.object.isNotEmpty &&
        widget.object.first.code != null &&
        widget.object.first is Account) {
      final paiementRemote = await getIt<AccountRepository>()
          .getPaiement(token: widget.object.first.code!);

      if (paiementRemote.isNotEmpty) {
        for (final type in paiementRemote) {
          if (type.type == widget.object.last) {
            paiement.add(type);
          }
        }

        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            isLoading = false;
          });
        }
      }
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

    if (!mounted) return;
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
