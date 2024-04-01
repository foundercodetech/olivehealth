import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/color.dart';

class BorderRowButton extends StatefulWidget {
  const BorderRowButton({
    Key? key,
    required this.onTap,
    required this.child,
    this.textColor= Colors.white,
    this.btnColor = redlogobtncolor,
    this.border,
    this.size,
  }) : super(key: key);

  final Function() onTap;
  final Widget child;
  final Color textColor; // Change type to Color
  final Color? btnColor;
  final BoxBorder? border;
  final double? size;

  @override
  State<BorderRowButton> createState() => _BorderRowButtonState();
}

class _BorderRowButtonState extends State<BorderRowButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Ink(
        child: Container(
          width: 310,
          height: 50,
          decoration: BoxDecoration(
            color: widget.btnColor,
            borderRadius: BorderRadius.circular(10),
            border: widget.border,
          ),
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: widget.size,
                color: widget.textColor, // Use the provided textColor
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
