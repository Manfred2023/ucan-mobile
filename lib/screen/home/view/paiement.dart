// Created by Manfred MOUKATE on 6/25/24, 5:45 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/25/24, 5:45 PM

import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';

class PaiementSreen extends StatelessWidget {
  const PaiementSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaiementView();
  }
}

class PaiementView extends StatefulWidget {
  const PaiementView({super.key});

  @override
  State<PaiementView> createState() => _PaiementViewState();
}

class _PaiementViewState extends State<PaiementView> {
  TextEditingController dateController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController motifController = TextEditingController();
  DateTime _endDate = DateTime.now();
  Future<DateTime?> _selectDate(
    BuildContext context,
  ) async {
    var selected = await showDatePicker(
      context: context,
      barrierDismissible: false,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      locale: const Locale("fr"),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (selected != null) {
      return DateTime(
        selected.year,
        selected.month,
        selected.day,
        selected.hour,
        selected.minute,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                color: ColorsApp.greenColor.withOpacity(0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                onTap: () async {
                  final date = await _selectDate(context);
                  if (date != null) {
                    setState(() {
                      dateController.text = date.toString();
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
              SizedBox(
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
              SizedBox(
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
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              Divider(),
              Row()
            ],
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

  init() {
    dateController.text = _endDate.toString();
  }
}
