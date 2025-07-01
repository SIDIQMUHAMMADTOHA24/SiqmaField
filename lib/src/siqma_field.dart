import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SiqmaField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool? disable;
  final bool? autocorrect;
  final bool? obscureText;
  final String? obscuringCharacter;
  final bool? disableSpace;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? fontStyle;
  final TextStyle? labelStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final int? limitLengthText;
  final int? maxLines;
  final int? minLines;
  final TextAlign? textAlign;
  final FormFieldValidator<String>? validator;
  final bool? autofocus;
  final bool? readOnly;
  final bool? filled;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;

  SiqmaField({
    super.key,
    required this.label,
    required this.controller,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.disable,
    this.autocorrect,
    this.obscureText,
    this.obscuringCharacter,
    this.disableSpace,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
    this.fontStyle,
    this.labelStyle,
    this.hintText,
    this.hintStyle,
    this.contentPadding,
    this.limitLengthText,
    this.maxLines,
    this.minLines,
    this.textAlign,
    this.validator,
    this.autofocus,
    this.readOnly,
    this.filled,
    this.fillColor,
    this.inputFormatters,
  });

  final TextInputFormatter sanitizer = TextInputFormatter.withFunction((
    oldValue,
    newValue,
  ) {
    String sanitized = newValue.text
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('&', '&amp;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#x27;')
        .replaceAll('/', '&#x2F;');
    return TextEditingValue(text: sanitized, selection: newValue.selection);
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        enabled: disable ?? true,
        readOnly: readOnly ?? false,
        autofocus: autofocus ?? false,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        obscuringCharacter: obscuringCharacter ?? '*',
        textInputAction: textInputAction,
        autocorrect: autocorrect ?? false,
        style:
            fontStyle ??
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xff111827),
            ),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines ?? 1,

        minLines: minLines,
        validator: validator,
        inputFormatters:
            inputFormatters ??
            [
              if (disableSpace == true)
                FilteringTextInputFormatter.deny(RegExp(r'\s')),
              FilteringTextInputFormatter.deny(RegExp('<|>|&|"|\'|/')),
              sanitizer,
              LengthLimitingTextInputFormatter(limitLengthText ?? 30),
            ],
        decoration: InputDecoration(
          labelText: label,

          labelStyle:
              labelStyle ??
              const TextStyle(
                color: Color(0xff6B7280),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding:
              contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          filled: filled ?? false,
          fillColor: fillColor,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xffE5E7EB),
              width: borderWidth ?? 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xffE5E7EB),
              width: borderWidth ?? 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xffE5E7EB),
              width: borderWidth ?? 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
