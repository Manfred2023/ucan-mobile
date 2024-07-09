//  Created by Jospin MAMBOU on 21/12/2023, 19:12
//  Email websafe21@gmail.com
//  Copyright (c) 2023, All rights reserved
//  Last modified 21/12/2023, 19:12

import 'package:flutter/material.dart';

enum TypeField { text, dropdown }

class TextFormModel {
  final TypeField typeField;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

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
