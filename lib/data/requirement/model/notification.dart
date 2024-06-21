// Created by Jospin MAMBOU on 29/08/2023, 15:16
// Email websafe21@gmail.com
// Copyright (c) 2023, All rights reserved
// Last modified 29/08/2023, 15:16

class TypeNotification {
  static const success = "success";
  static const warning = "warning";
  static const classic = "classic";
}

class Notification {
  final String title;
  final String message;
  final String type;

  Notification(
      {required this.title, required this.message, required this.type});

  @override
  String toString() {
    return 'Notification{title: $title, message: $message, type: $type}';
  }
}
