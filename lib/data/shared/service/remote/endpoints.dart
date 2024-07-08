// Created by Manfred MOUKATE on 6/21/24, 5:50 PM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 6/21/24, 5:50 PM

abstract class Endpoints {
  /// requirement
  static const String city = '/city';
  static const String country = '/country';

  ///auth
  static const String createContact = '/contact/create/';
  static const String createUser = '/user/create/';
  static const String getContact = '/contact/get/';
  static const String getUser = '/user/check/';

  ///login
  static const String auth = '/user/auth/';

  ///
  static const String account = '/account/';
  static const String motif = '/motif/';
  static const String saveMotif = '/motif/create/';

  ///payment
  static const String paiement = '/payment/create/';
  static const String myPaiement = '/payment/history/';
  static const String myPaiementByDate = '/payment/historyByDate/';
  static const String deletePayment = '/payment/delete/';
  static const String convert = '/translate/';
}
