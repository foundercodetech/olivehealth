// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController phoneCon = TextEditingController();
  final TextEditingController PasswordCon = TextEditingController();

  bool passwordVisible=false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: height * 0.35,
            width: width * 0.47,
            decoration:  const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [gradientyellow, gradientredd],
               )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.2,
                  width: width * 0.3,
                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.imageslogo),fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.2,
                  child:  Center(child: Text(LogIn, style: robotoRegular.copyWith(
                      color: textblack,
                      fontSize: width*0.038,
                      fontWeight: FontWeight.bold),)),
                ),
              ],
            ),
          ),
          SizedBox(height: height*0.04,),
          Center(
            child: SizedBox(
              height: height * 0.24,
              width: width * 0.4,
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                       controller: phoneCon,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                        ),
                        hintText: 'Enter mobile number',
                        prefixIcon: Icon(Icons.phone_android),
                      ),
                    ),
                    TextFormField(
                      controller: PasswordCon,
                      obscureText:passwordVisible,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                        ),
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: Icon(
                              passwordVisible ? Icons.visibility_off:Icons.visibility ),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                        alignLabelWithHint: false,
                        filled: false,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ]
              ),
            ),
          ),
          SizedBox(height: height*0.09,),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context,RoutesName.bottomnav);
            },
            child: Center(
              child: Container(
                height: height*0.07,
                width: width*0.3,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [gradientyellow, gradientredd],
                    ),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child:  Center(child: Text(LogIn,style: robotoRegular.copyWith(color: textblack,fontSize: width*0.03,fontWeight: FontWeight.bold),)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, RoutesName.Forgetpass);
                },
                child: Text(Forgetpass,style: robotoRegular.copyWith(color: textblack,fontSize: width*0.02, decoration: TextDecoration.underline,),)),
          ),
        ],
      ),
    );
  }
}