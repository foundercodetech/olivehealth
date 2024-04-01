import 'dart:async';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tanisha();
  }

  tanisha() async {
    Timer(const Duration(seconds: 3), ()=> Navigator.pushNamed(context, RoutesName.login)
    );
  }

  // tanisha() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final userid=prefs.getString("userId")??'0';
  //
  //   userid !='0'? Timer(const Duration(seconds: 3),
  //           ()=> Navigator.pushNamed(context, RoutesName.bottomnav)
  //   ): Navigator.pushNamed(context, RoutesName.login);
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [gradientyellow, gradientredd],
              ),
            ),
            child: Center(
              child: Container(
                height: height*0.30,
                width: width*0.80,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppAsset.imageslogo),fit: BoxFit.fill)),
              ),
            ),
          ),
    ));
  }
}
