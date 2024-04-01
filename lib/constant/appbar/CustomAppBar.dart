// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/styles.dart';



class CustomAppBarTwo extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final Color color;
  final Color textcolor;
  final void Function() ? ontap;

  const CustomAppBarTwo({Key? key,
    required this.title,
    this.ontap,
    required this.color, required this.textcolor,
  }): preferredSize = const Size.fromHeight(54.0), super(key: key);

  @override
  _CustomAppBarTwoState createState() => _CustomAppBarTwoState();
}

class _CustomAppBarTwoState extends State<CustomAppBarTwo> {
  @override


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 1,
      title: Text(widget.title,  style: robotoRegular.copyWith(
          fontSize: width * 0.05,
          color: widget.textcolor ,
          fontWeight: FontWeight.w500)
      ),
      backgroundColor: widget.color,
      automaticallyImplyLeading: true,
    leading: CustomBackButton(
    //   onTap:
      onTap: widget.ontap==null?() {
      Navigator.pop(context);
      }:widget.ontap!,
    ));

  }


}
