import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {

  static void flushBarErrorMessage(String message, BuildContext context,Color messageColor) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        messageColor: messageColor,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarsuccessMessage(String message, BuildContext context,Color messageColor) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        messageColor: messageColor,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.check_circle_outline_outlined,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static showExitConfirmation(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width:2, color:Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          decoration: BoxDecoration(
              color: Colors.red.shade300,
               gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientyellow, gradientredd],
          ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(height: height / 30),
              Text("EXIT APP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: height / 30),
              Text("Are you sure want to exit?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                  )),
              SizedBox(height: height * 0.04),
              SizedBox(
                width: width * 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: redlogobtncolor,
                            side: const BorderSide(width:1, color:Colors.white),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: width*0.34,vertical: height*0.02)
                        ),
                        onPressed: (){

                          SystemNavigator.pop();
                          },
                        child: Text("Yes",style: robotoRegular.copyWith(fontSize: width*0.05, color: Colors.white))
                    ),


                    SizedBox(height: height * 0.03),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(width:1, color:redlogobtncolor),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: width*0.34,vertical: height*0.02)
                        ),
                        onPressed: (){

                          Navigator.pop(context, false);
                        },
                        child: Text("No",style: acmeRegular.copyWith(fontSize: width*0.05, color: Colors.black))
                    ),

                  ],
                ),
              )
            ],
          ),
        );
      },
    ) ??
        false;
  }

  static showLogoutConfirmation(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width:2, color:Colors.white),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
      ),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          decoration: BoxDecoration(
              color: Colors.red.shade300,
               gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [gradientyellow, gradientredd],
          ),
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))),
          child: Column(
            children: [
              SizedBox(height: height / 30),
              Text("Logging out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: height / 30),
              Text("Are you sure want to exit?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.05,
                  )),
              SizedBox(height: height * 0.04),
              SizedBox(
                width: width * 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: redlogobtncolor,
                            side: const BorderSide(width:1, color:Colors.white),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: width*0.34,vertical: height*0.02)
                        ),
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.remove('userId');
                          Navigator.pushNamed(context,RoutesName.login);
                          },
                        child: Text("Yes",style: robotoRegular.copyWith(fontSize: width*0.05, color: Colors.white))
                    ),


                    SizedBox(height: height * 0.03),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(width:1, color:redlogobtncolor),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            padding: EdgeInsets.symmetric(horizontal: width*0.34,vertical: height*0.02)
                        ),
                        onPressed: (){
                          Navigator.pop(context, false);
                        },
                        child: Text("No",style: acmeRegular.copyWith(fontSize: width*0.05, color: Colors.black))
                    ),

                  ],
                ),
              )
            ],
          ),
        );
      },
    ) ??
        false;
  }
}

