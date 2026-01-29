import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String?)?;

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.prefixText,
    this.onChanged,
    this.filledColor,
    this.isPassword = false,
    this.isNumber = false,
    this.hintTextStyle,
    this.focusBorderColor,
    this.enableBorderColor,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false
  });

  final Color? filledColor;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final String hintText;
  final TextStyle? hintTextStyle;
  final TextEditingController? controller;
  final ValidatorCallback validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool isNumber;
  final bool readOnly;
  bool obscureText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  void initState() {
    super.initState();
    widget.obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
      cursorColor: ColorApp.primaryBlue,
      style: TextApp.light18Gray,
      decoration: _buildInputDecoration(context),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      errorStyle: TextApp.medium15Red,
      filled: true,
      fillColor: widget.filledColor ?? ColorApp.primaryWhite,
      hintText: widget.hintText,
      hintStyle: widget.hintTextStyle ?? TextApp.light18Gray,
      prefixText: widget.prefixText,
      prefixIcon: widget.prefixIcon == null
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: widget.prefixIcon,
            ),
      suffixIcon: widget.isPassword ? _buildSuffixIcon() : widget.suffixIcon,
      enabledBorder: _outlineBorder(widget.enableBorderColor ?? ColorApp.gray),
      focusedBorder: _outlineBorder(widget.focusBorderColor ?? ColorApp.gray),
      errorBorder: _outlineBorder(ColorApp.redColor),
      focusedErrorBorder: _outlineBorder(ColorApp.redColor),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        widget.obscureText ? Icons.visibility_off : Icons.visibility,
        color: ColorApp.gray,
      ),
      onPressed: () {
        setState(() {
          widget.obscureText = !widget.obscureText;
        });
      },
    );
  }

  OutlineInputBorder _outlineBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
