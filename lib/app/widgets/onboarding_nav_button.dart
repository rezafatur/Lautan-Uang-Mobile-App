import 'package:flutter/material.dart';
import 'package:lautan_uang/core/theme/colors.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';

class onboardNavButton extends StatelessWidget {
  const onboardNavButton(
      {Key? key, required this.name, required this.onPressed})
      : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: AzureishWhiteColor,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: onboardNavText,
        ),
      ),
    );
  }
}
