import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormTextField extends StatelessWidget {
  final TextEditingController fieldController;
  final String labelText;
  final String? hintText;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final Color? fillColor;
  final bool? filled;
  final Color? focusColor;
  final Color? hoverColor;
  final String? Function(String?)? customizedValidation;
  final Widget? prefixIcon;

  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  const CustomFormTextField({
    Key? key,
    required this.fieldController,
    required this.labelText,
    this.hintText,
    this.inputFormatters,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.filled,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.customizedValidation,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      controller: fieldController,
      decoration: decoration ??
          InputDecoration(
            filled: filled,
            fillColor: fillColor ?? Colors.white,
            focusColor: focusColor,
            hoverColor: hoverColor,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.teal),
            ),
            labelText: labelText,
            hintText: hintText,
          ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: style,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      validator: customizedValidation ??
          (value) {
            // Default validation logic
            if (value == null || value.isEmpty) {
              return 'Please enter: $labelText';
            }
            fieldController.text = value;
            return null;
          },
    );
  }
}
