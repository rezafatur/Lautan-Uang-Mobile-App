import 'package:flutter/material.dart';
import 'package:lautan_uang/core/theme/text_theme.dart';
import 'package:lautan_uang/core/utils/size_configs.dart';

class onboardTextButton extends StatelessWidget {
  const onboardTextButton(
      {Key? key,
      required this.buttonName,
      required this.onPressed,
      required this.backgroundColor})
      : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: SizeConfig.blockHorizontal! * 15,
        width: SizeConfig.blockHorizontal! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: onboardNavText,
          ),
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
        ),
      ),
    );
  }
}
