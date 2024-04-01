import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olivehealth_delivery/constant/button/borderRowButton.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/image_picker.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import '../../constant/color.dart';


class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {

  final _formKey = GlobalKey<FormState>();

  final name=TextEditingController();
  final age=TextEditingController();
  final phoneno=TextEditingController();
  final email=TextEditingController();


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      backgroundColor: greycolor.shade200,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Edit Profile", style: robotoRegular.copyWith(
            fontSize: width * 0.05,
            color: textblack,
            fontWeight: FontWeight.w500),
        ),
        leading: CustomBackButton(onTap: () {
          Navigator.pop(context);
          },btnColor: Colors.black,),

      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height*0.01,),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.transparent,

                              backgroundImage:
                              myData != '0'
                                  ?
                              Image.memory(base64Decode(myData)).image
                                  : Image.asset(AppAsset.imagesProfile).image,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    _settingModalBottomSheet(context);
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.redAccent,
                                    radius: 18,
                                    child: Icon(Icons.camera_alt_outlined),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.01),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Full Name",style: robotoRegular.copyWith(
                            fontSize: width * 0.038,
                            color: textblack,
                            fontWeight: FontWeight.w500)
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          style: robotoRegular.copyWith(fontSize: width*0.05, color: textblack),
                          controller: name,
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                            ))                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Mobile Number",style: robotoRegular.copyWith(
                            fontSize: width * 0.038,
                            color: textblack,
                            fontWeight: FontWeight.w500)
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter number';
                            }

                            return null;
                          },
                          style: robotoRegular.copyWith(fontSize: width*0.05, color: textblack),
                          controller: phoneno,
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Email Id",style: robotoRegular.copyWith(
                            fontSize: width * 0.038,
                            color: textblack,
                            fontWeight: FontWeight.w500)
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width*0.03),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter mail';
                            }
                            return null;
                          },
                          style: robotoRegular.copyWith(fontSize: width*0.05, color: textblack),
                          controller: email,
                        ),
                      ),
                      SizedBox(height: height*0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: width*0.30,
                            child: BorderRowButton(
                                border: Border.all(color: textblack.withOpacity(0.7)),
                                btnColor: Colors.white,
                                onTap: () {  },
                                child: Center(child: Text("Cancel",style: robotoRegular.copyWith(fontSize: width*0.04,color: textblack,fontWeight: FontWeight.bold),))
                            ),
                          ),
                          Container(
                            width: width*0.30,
                            child: BorderRowButton(
                                border: Border.all(color: textblack.withOpacity(0.7)),
                                btnColor: Colors.white,
                                onTap: () {  },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(AppAsset.imagesCheckicon,height: height*0.03,),
                                    Text("Save",style: robotoRegular.copyWith(fontSize: width*0.04,color: textblack,fontWeight: FontWeight.bold),)
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height*0.03,),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    ));
  }
  String myData = '0';
  void _updateImage(ImageSource imageSource) async {
    String? imageData = await ChooseImage.chooseImageAndConvertToString(imageSource);
    if (imageData != null) {
      setState(() {
        myData = imageData;
      });
    }
  }

  void _settingModalBottomSheet(context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        ),
        context: context,
        builder: (BuildContext bc) {
          return SizedBox(
            height: heights / 7,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  widths / 12, 0, widths / 12, heights / 60),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      _updateImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: heights / 20,
                      width: widths / 2.7,
                      decoration: BoxDecoration(
                        // color: Colors.blue,
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                            "Camera",
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _updateImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: heights / 20,
                      width: widths / 2.7,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                            "Gallery",
                            style: TextStyle(color: textblack),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
