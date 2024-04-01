import 'package:flutter/material.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({
    Key? key,
    required this.onTap,
    this.btnColor = Colors.white,
  }) : super(key: key);

  final Function() onTap;

  final Color? btnColor;

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.arrow_back_ios,color: widget.btnColor,),
      ),
    );
  }
}
