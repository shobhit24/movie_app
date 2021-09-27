import 'package:flutter/material.dart';
import 'package:movie_app/app_colors.dart';
import 'package:movie_app/styles.dart';

class PrimaryFilledButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final EdgeInsets padding;
  final VoidCallback onTap;
  final TextStyle textStyle ;

  const PrimaryFilledButton({Key? key,
    required this.text,
    required this.onTap,
    this.isActive = true,
    this.padding = const EdgeInsets.all(20.0),
    this.textStyle = Styles.tsWhiteMedium20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.0,
      minWidth: double.infinity,
      onPressed: isActive ? onTap : () {},
      color: isActive ? AppColors.primaryColor : AppColors.primaryColor,
      child: Padding(
        padding: padding,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
    );
  }
}