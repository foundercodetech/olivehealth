import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/styles.dart';

class Forgetpassworrd extends StatefulWidget {
  const Forgetpassworrd({super.key});

  @override
  State<Forgetpassworrd> createState() => _ForgetpassworrdState();
}

class _ForgetpassworrdState extends State<Forgetpassworrd> {
 
 final TextEditingController Oldpass  = TextEditingController();
 final TextEditingController Newpass  = TextEditingController();
 final TextEditingController Confirmpass  = TextEditingController();
 
  bool passwordVisibleOld=false;
  bool passwordVisibleNew=false;
  bool passwordVisibleConfirum=false;
 
  @override
  void initState() {
    super.initState();
    passwordVisibleOld = true;
  }
  void initStatee() {
    super.initState();
    passwordVisibleNew = true;
  }
  void initStateee() {
    super.initState();
    passwordVisibleConfirum = true;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                 color: redlogobtncolor,
              )
          ),
          automaticallyImplyLeading: false,
          leading: CustomBackButton(onTap: () { Navigator.pop(context); },),
          centerTitle: true,
          title:Text("Change Password",style: robotoRegular.copyWith(color: Colors.white,fontSize: width*0.06 ,fontWeight: FontWeight.bold),),

        ),

        body:SingleChildScrollView(
          child: Column(
              children: [
                SizedBox(height: height*0.09,),
                Center(child: Card(
                  elevation: 5,
                  shadowColor: textblack,
                  color: Colors.white,
                  child: SizedBox(
                    height: 450,
                    width: 320,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: height*0.01,),
                            Text('Old Password',style: robotoRegular.copyWith(color: textblack,fontSize:width*0.045,fontWeight: FontWeight.bold),),
                            TextField(
                              style: robotoRegular.copyWith(fontSize: width*0.045,color: Colors.black),
                              controller: Oldpass,
                              obscureText:passwordVisibleOld,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                ),
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisibleOld ? Icons.visibility : Icons
                                          .visibility_off),
                                  onPressed: () {
                                    setState(
                                          () {
                                        passwordVisibleOld = !passwordVisibleOld;
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
                            SizedBox(height: height*0.01,),

                            Text('New Password',style: robotoRegular.copyWith(color: textblack,fontSize:width*0.045,fontWeight: FontWeight.bold),),
                            TextField(
                              style: robotoRegular.copyWith(fontSize: width*0.045,color: Colors.black),

                              controller: Newpass,
                              obscureText:passwordVisibleNew,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                ),
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisibleNew ? Icons.visibility : Icons
                                          .visibility_off),
                                  onPressed: () {
                                    setState(
                                          () {
                                        passwordVisibleNew = !passwordVisibleNew;
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
                            SizedBox(height: height*0.01,),

                            Text('Confirm Password',style: robotoRegular.copyWith(color: textblack,fontSize:width*0.045,fontWeight: FontWeight.bold),),
                            TextField(
                              style: robotoRegular.copyWith(fontSize: width*0.045,color: Colors.black),

                              controller: Confirmpass,
                              obscureText:passwordVisibleConfirum,
                              decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                ),
                                hintText: 'Enter your password',
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisibleConfirum ? Icons.visibility : Icons
                                          .visibility_off),
                                  onPressed: () {
                                    setState(
                                          () {
                                        passwordVisibleConfirum = !passwordVisibleConfirum;
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
                            SizedBox(height: height*0.1,),
                            Container(
                              height:height*0.06,
                              width:width*0.85,
                              decoration: const BoxDecoration(
                                color: redlogobtncolor,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child:  Center(child: Text("UPDATE",style: robotoRegular.copyWith(color: Colors.white,fontSize: width*0.045,fontWeight: FontWeight.bold),)),
                            ),
                            SizedBox(height: height*0.015,),
                          ]
                      ),
                    ),
                  ),
                )
                ),
              ]
          ),
        )
    );
  }
}