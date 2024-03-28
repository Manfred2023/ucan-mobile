import 'package:flutter/material.dart';
import 'package:ucan/app/config/colors.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const NotifView();
  }
}

class NotifView extends StatefulWidget {
  const NotifView({super.key});

  @override
  State<NotifView> createState() => _NotifViewState();
}

class _NotifViewState extends State<NotifView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primary,
      appBar: AppBar(backgroundColor: Colors.transparent, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Text("Notification".toUpperCase(),
              style: const TextStyle(
                  color: ColorsApp.onSecondary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        )
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.15,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: ColorsApp.onSecondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "DETAILS",
                    style: TextStyle(
                        color: ColorsApp.primaryLigt,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )),
                Divider(
                  color: ColorsApp.textColorCC,
                ),
                Expanded(child: Center(
                  child: Text('Vous n\'avez pas de notification', style: TextStyle(
                    fontSize: 20
                  ),),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
