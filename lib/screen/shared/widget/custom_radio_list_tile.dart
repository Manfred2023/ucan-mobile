import 'package:flutter/material.dart';

import '../../../app/config/colors.dart';

class CustomRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final Widget title;

  const CustomRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 16.0,
            height: 16.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 2.0,
                  color: groupValue == value
                      ? ColorsApp.primary
                      : ColorsApp.onSecondary),
            ),
            child: groupValue == value
                ? Center(
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsApp.primary,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 5,
          ),
          title,
        ],
      ),
    );
  }
}
