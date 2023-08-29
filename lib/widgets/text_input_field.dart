import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassword;
  final bool isEnableSuggestions;
  final bool isAutoCorrect;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({
    super.key,
    required this.textEditingController,
    this.isPassword = false,
    this.isEnableSuggestions = false,
    this.isAutoCorrect = false,
    required this.hintText,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: textEditingController,
      enableSuggestions: isEnableSuggestions,
      autocorrect: isAutoCorrect,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
