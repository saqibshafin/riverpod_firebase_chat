import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_colors.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.textCtrl,
    this.hintText,
    Widget? prefixIcon, // it's like this because we are using "_prefixIcon"
    Widget? suffixIcon,
    int? maxLength,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    bool obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    this.validator,
    this.autovalidateMode,
    super.key,
  })  : _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _maxLength = maxLength,
        _keyboardType = keyboardType,
        _textInputAction = textInputAction,
        _obscureText = obscureText,
        _inputFormatters = inputFormatters;

  final TextEditingController textCtrl;
  final String? hintText;
  final Widget? _prefixIcon;
  final Widget? _suffixIcon;
  final int? _maxLength;
  final TextInputType _keyboardType;
  final TextInputAction _textInputAction;
  final bool _obscureText;
  final List<TextInputFormatter>? _inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textCtrl,
      style: Theme.of(context).textTheme.bodyMedium,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 8, 0, 8),

        fillColor: AppColors.primaryBackground,
        // label: const Text('Enter PIN'),
        // labelStyle: Get.textTheme.titleMedium!
        //     .copyWith(color: AppColors.grey.shade600),
        // floatingLabelStyle: TextStyle(color: AppColors.primary),
        hintText: hintText,
        // hintStyle: Get.textTheme.bodyLarge!
        //     .copyWith(color: AppColors.grey.shade500),
        counterText: "", // To prevent Counter-text take extra height-space.
        errorStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          height: 0.6,
        ),
        counterStyle: TextStyle(
          color: AppColors.primary,
          fontSize: Theme.of(context).textTheme.labelMedium!.fontSize,
          height: 0.6,
        ),

        //
        isDense: true,
        prefixIconConstraints: const BoxConstraints(
          minHeight: 24,
          maxHeight: 24,
          minWidth: 36,
          maxWidth: 36,
        ),
        suffixIconConstraints: const BoxConstraints(
          minHeight: 24,
          maxHeight: 24,
          minWidth: 32,
          maxWidth: 32,
        ),
        prefixIcon: _prefixIcon,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.error)) {
            return AppColors.red;
          } else if (states.contains(MaterialState.focused)) {
            return AppColors.primary;
          } else {
            return AppColors.grey;
          }
        }),
        suffixIcon: _suffixIcon,
        suffixIconColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.error)) {
            return AppColors.red;
          } else if (states.contains(MaterialState.focused)) {
            return AppColors.primary;
          } else {
            return AppColors.grey;
          }
        }),
      ),
      maxLength: _maxLength,
      keyboardType: _keyboardType,
      textInputAction: _textInputAction,
      obscureText: _obscureText,
      obscuringCharacter: "*",
      inputFormatters: _inputFormatters,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
