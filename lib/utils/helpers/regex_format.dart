// Created by Jospin MAMBOU on 15/12/2022, 10:13
// Email websafe21@gmail.com
// Copyright (c) 2022. All rights reserved.
// Last modified 15/12/2022, 10:10

/// Helper to do format
class RegexFormat {
  static const String regexEmail = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  static bool isEmailAddress(String email) {
    if (RegExp(regexEmail).hasMatch(email)) return true;
    return false;
  }

  /// Format money
  ///
  /// To String [price]
  static String moneyFormat(String price) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ' ');
      return value;
    }
    return price;
  }

  static String format(String number, {int numberSpace = 2}) {
    if (number.length > 2) {
      var value = number;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{4})+(?!\d))'), ' ');
      return value;
    }
    return number;
  }

  static String moneyFormatPackage(String price, String language) {
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        language == 'en' ? ',' : '.',
      );
      return value;
    }
    return price;
  }

  /// Double de
  ///
  /// To String [price]
  static String contentDoubleMoneyFormat(String price, String language) {
    final list = price.split('.');

    final secondEn = (int.parse(list[1]) > 0) ? '.${list[1]}' : '';
    final secondFr = (int.parse(list[1]) > 0) ? ',${list[1]}' : '';
    if (language == 'en') {
      return list.length > 1
          ? '${moneyFormat(list[0])}$secondEn'
          : moneyFormat(list[0]);
    }
    return list.length > 1
        ? '${moneyFormat(list[0])}$secondFr'
        : moneyFormat(list[0]);
  }

  static String contentDoubleMoneyPackage(String price, String language) {
    final list = price.split('.');

    final secondEn = (int.parse(list[1]) > 0) ? '.${list[1]}' : '';
    final secondFr = (int.parse(list[1]) > 0) ? ',${list[1]}' : '';
    if (language == 'en') {
      return list.length > 1
          ? '${moneyFormatPackage(list[0], language)}$secondEn'
          : moneyFormatPackage(list[0], language);
    }
    return list.length > 1
        ? '${moneyFormatPackage(list[0], language)}$secondFr'
        : moneyFormatPackage(list[0], language);
  }

  /// Format phone number in Cameroon number
  ///
  /// To String [phone]
  static String formatPhone(String phone, {String mask = "xxx xx xx xx"}) {
    final formattedNumber = StringBuffer();
    var numberIndex = 0;
    if (phone.startsWith('237')) {
      phone = phone.substring(3);
    }

    for (var i = 0; i < mask.length; i++) {
      if (mask[i] == 'x') {
        if (numberIndex < phone.length) {
          formattedNumber.write(phone[numberIndex]);
          numberIndex++;
        }
      } else {
        formattedNumber.write(mask[i]);
      }
    }

    return formattedNumber.toString();
  }

  static String formatTest(String number, {String mask = "xxx xx xx xx"}) {
    final formattedNumber = StringBuffer();
    var numberIndex = 0;
    if (number.startsWith('237')) {
      number = number.substring(3);
    }

    for (var i = 0; i < mask.length; i++) {
      if (mask[i] == 'x') {
        if (numberIndex < number.length) {
          formattedNumber.write(number[numberIndex]);
          numberIndex++;
        }
      } else {
        formattedNumber.write(mask[i]);
      }
    }

    return formattedNumber.toString();
  }

  /// Encode number
  /// Ex: 237696870887 -> 696 8 . . . 87
  ///
  /// To String [phone]
  static String encodePhoneNumber(String phone) {
    var value = phone;
    value = value.replaceAll(RegExp(r'\D'), '');
    if (value.length == 12) {
      value = value.substring(4);
    }
    value = value.replaceAll(RegExp(r'\B(?=(\d{2})+(?!\d))'), ' ');
    if (value.length == 11) {
      value = '6$value';
    } else {
      value = value[0] + value.substring(2);
    }
    return '${value.substring(0, 3)} ${value[4]} . . . ${value.substring(10)}';
  }

  static String convertToCamelCase(String convert) {
    var value = convert.replaceAll('_', ' ');
    return value.replaceAllMapped(
      RegExp(r'(?<=\s|^)([a-z])'),
      (match) => match.group(1)?.toUpperCase() ?? '',
    );
  }

  /// Encode number
  /// Ex: 1 -> 01
  ///
  /// To String [phone]
  static String number(dynamic number) {
    if (number < 10) {
      return '0$number';
    }
    return moneyFormat(number.toString());
  }

  static String numberDouble(double number, String language) {
    if (number < 0) {
      return number.toStringAsFixed(2);
    }
    if (number < 10) {
      return '0${number.toStringAsFixed(2)}';
    }
    return contentDoubleMoneyFormatWithZero(
        number.toStringAsFixed(2).toString(), language);
  }

  static String contentDoubleMoneyFormatWithZero(
      String price, String language) {
    final list = price.split('.');

    final secondEn = '.${list[1]}';
    final secondFr = ',${list[1]}';
    if (language == 'en') {
      return '${moneyFormat(list[0])}$secondEn';
    }
    return '${moneyFormat(list[0])}$secondFr';
  }
}
