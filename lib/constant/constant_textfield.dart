import 'dart:math';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/styles.dart';

class Constant_text_field extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? decoration = const InputDecoration();
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly = false;
  final int? maxLines;
  final int? minLines;
  final bool expands = false;
  final int? maxLength;
  final bool obscureText = false;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? iconColor;
  final String? label;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final double? hintSize;
  final double? fontSize;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Color? cursorColor;
  final Widget? prefix;
  final Widget? sufix;
  final BorderRadius? fieldRadius;
  final bool? enabled;
  final void Function()? onTap;
  final bool? autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final Color? hintColor;
  final String? errorText;
  final String? hintText;
  final String? hintStyle;
  final bool? Focusnode;


  Constant_text_field({this.controller,
    this.style,
    this.strutStyle,
    this.textAlignVertical,
    this.textDirection,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.icon,
    this.iconColor,
    this.label,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.onChanged,
    this.height,
    this.width,
    this.hintSize,
    this.fontSize,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.contentPadding,
    this.cursorHeight,
    this.cursorColor,
    this.prefix,
    this.sufix,
    this.fieldRadius,
    this.enabled,
    this.maxLines,
    this.onTap,
    this.autofocus,
    this.onSaved,
    this.validator,
    this.margin,
    this.hintColor,
    this.errorText,
    this.hintText,
    this.hintStyle,
    this.Focusnode,

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextFormField(
        validator:validator ,
        onSaved: onSaved,
        autofocus:autofocus??false,
        //focusNode: Focusnode,
        textAlignVertical: TextAlignVertical.center,
        enabled: enabled,
        controller: controller,
        cursorColor: cursorColor,
        cursorHeight: cursorHeight,
        onChanged: onChanged,
        maxLines: maxLines,
        maxLength: maxLength,
        expands: expands,
        readOnly: readOnly,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style:style==null? robotoRegularwhite :style,
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Color(0xFFF65054)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Color(0xFFF65054)),
          ),
          filled: filled,
          prefixIcon: prefix,
          fillColor:fillColor,
          suffixIcon: sufix,

          // hintStyle: hintStyle==null? robotoRegular.copyWith(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold):hintStyle,
          hintStyle: robotoRegular.copyWith(fontSize: 14, color: hintColor, fontWeight: FontWeight.bold),
          hintText: hintText==null?'wwww':hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),


        ),

      ),
    );
  }
}