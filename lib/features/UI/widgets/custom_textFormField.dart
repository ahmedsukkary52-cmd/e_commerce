import 'package:e_commerce/core/Utils/color_app.dart';
import 'package:e_commerce/core/Utils/text_app.dart';
import 'package:flutter/material.dart';

typedef ValidatorCallback = String? Function(String?)?;

class CustomTextField extends StatefulWidget {
  const CustomTextField({
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
  });

  final Color? filledColor;
  final String hintText;
  final TextEditingController? controller;
  final ValidatorCallback validator;
  final Widget? prefixIcon;
  final String? prefixText;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool isNumber;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: FocusNode(),
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
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
      hintStyle: TextApp.light18Gray,
      prefixText: widget.prefixText,
      prefixIcon: widget.prefixIcon == null
          ? null
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: widget.prefixIcon,
            ),
      suffixIcon: widget.isPassword ? _buildSuffixIcon() : null,
      enabledBorder: _outlineBorder(ColorApp.gray),
      focusedBorder: _outlineBorder(ColorApp.gray),
      errorBorder: _outlineBorder(ColorApp.redColor),
      focusedErrorBorder: _outlineBorder(ColorApp.redColor),
    );
  }

  Widget _buildSuffixIcon() {
    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility_off : Icons.visibility,
        color: ColorApp.gray,
      ),
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
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
