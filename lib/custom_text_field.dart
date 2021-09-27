import 'package:flutter/material.dart';
import 'package:movie_app/app_colors.dart';
import 'package:movie_app/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 0),
      child: Column(
        children: [
          TextField(
            controller: controller,
            style: Styles.tsWhiteSemiBold16,
            keyboardType: inputType,
            decoration: InputDecoration(
              errorText: null,
              errorStyle: Styles.tsWhiteSemiBold16,
              fillColor: AppColors.primaryColor2,
              filled: true,
              hintText: hintText,
              hintStyle: Styles.tsGreyRegular14,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor2,
                ),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor2,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor2,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor2,
                ),
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
