// Created by Manfred MOUKATE on 7/10/24, 8:35 AM
// Email moukatemanfred@gmail.com
// Copyright (c) 2024. All rights reserved.
// Last modified 7/10/24, 8:35 AM

import 'package:flutter/material.dart';

enum TypeField { text, dropdown }

class TextFormModel {
  final TypeField typeField;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  final int? maxLines;

  final VoidCallback? onTap;
  final bool? readOnly;
  final TextStyle? style;
  final bool autoFocus;
  final DropdownButtonFormField? dropdownButtonFormField;
  final InputDecoration decoration;
  final String desc;
  final String? Function(String? value)? validator;

  TextFormModel(
      {required this.controller,
      this.focusNode,
      this.maxLines = 1,
      this.dropdownButtonFormField,
      this.textCapitalization,
      this.typeField = TypeField.text,
      this.textInputAction,
      this.keyboardType,
      this.style,
      this.onTap,
      this.readOnly,
      this.autoFocus = false,
      required this.desc,
      required this.decoration,
      this.validator})
      : assert(typeField == TypeField.text || dropdownButtonFormField != null,
            'Dropdown field must have dropdownButtonFormField when type is dropdown');
}
