import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/custom_button.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/constant_textfield.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/image_picker.dart';
import 'package:image_picker/image_picker.dart';



class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  bool personal = false;

  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  String? selectedValue;

  List<Map<String, dynamic>> dropdownItems = [

    {'name': 'Male'},
    {'name': 'Female' },
    {'name': 'Other'},
  ];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(alignment: Alignment.bottomLeft,
                      child: Text(
                        "PersonalDetails",
                        style: robotoRegular.copyWith(
                            fontSize: width * 0.04, color: textblack,fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: width * 0.32,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.deepPurple.shade100,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            personal = !personal;
                          });
                        },
                        icon: personal == false
                            ? Icon(
                          Icons.edit,
                          color: Colors.indigo.shade900,
                        )
                            : Icon(
                          Icons.done_all,
                          color: Colors.indigo.shade900,
                        )),
                  )
                ],
              ),
              SizedBox(height: height * 0.01),

              if(personal==false)
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        SizedBox(height: height*0.01,),
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.deepPurple.shade100,
                          // backgroundImage: NetworkImage(image.toString()),
                          backgroundImage: const AssetImage(AppAsset.imagesProfile),
                        ),
                        ListTile(
                          leading: Text(
                            "Name",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack,fontWeight: FontWeight.w500),
                          ),

                          trailing: Text(
                            "Delivery Boy xz",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack),
                          ),
                        ),
                        const Divider(
                          color: textblack,
                          indent: 10,
                          endIndent: 10,
                        ),
                        ListTile(
                          leading: Text(
                            "Gender",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack,fontWeight: FontWeight.w500),
                          ),

                          trailing: Text(
                            "Male",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack),
                          ),
                        ),
                        const Divider(
                          color: textblack,
                          indent: 10,
                          endIndent: 10,
                        ),

                        ListTile(
                          leading: Text(
                            "Mobile Number",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack,fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            "1234567890",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack),
                          ),
                        ),
                        const Divider(
                          color: textblack,
                          indent: 10,
                          endIndent: 10,
                        ),

                        ListTile(
                          leading: Text(
                            "Email Id",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack,fontWeight: FontWeight.w500),
                          ),
                          trailing: Text(
                            "delivery@boy.com",
                            style: robotoRegular.copyWith(
                                fontSize: width * 0.04, color: textblack),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              SizedBox(height: height * 0.02,),

              if(personal==true)
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 1),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width*0.034),
                      child: Column(
                        children: [
                          SizedBox(height: height*0.02,),
                          Center(
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 50,
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
                          SizedBox(height: height*0.02,),

                          Constant_text_field(
                            controller: name,
                            style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack),
                            hintText: "Name",
                            hintColor: textblack,
                            border: Border.all(color: textblack),
                            borderRadius: BorderRadius.circular(10),

                          ),
                          SizedBox(height: height*0.02,),

                          Container(
                            width: width,
                            decoration: BoxDecoration(
                                border: Border.all(color: textblack),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                dropdownColor: Colors.red.shade300,
                                hint: Text("    "+"Gender", style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack,fontWeight: FontWeight.bold)),
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                                  if (kDebugMode) {
                                    if (kDebugMode) {
                                      print(selectedValue);
                                    }

                                  }
                                },
                                items: dropdownItems
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item['name'],
                                    child: Text("    "+item['name'],
                                        style: acmeRegular.copyWith(
                                            fontSize: width*0.04, color: textblack)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.02,),

                          Constant_text_field(
                            controller: phone,
                            style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack),
                            hintText: "Mobile Number",
                            hintColor: textblack,
                            border: Border.all(color: textblack),
                            borderRadius: BorderRadius.circular(10),
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: height*0.02,),

                          Constant_text_field(
                            controller: email,
                            style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack),
                            hintText: "Email Id",
                            hintColor: textblack,
                            border: Border.all(color: textblack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: height*0.02,),
                          CustomButton(
                            btnColor: redlogobtncolor,
                              onTap: (){
                                Navigator.pop(context);
                              }, text: "Save",
                          size: width*0.05,
                          height: height*0.06
                          ),
                          SizedBox(height: height*0.02,),

                          // TextFormField(
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter some amount';
                          //     }
                          //     return null;
                          //   },
                          //
                          //   style: robotoRegular.copyWith(fontSize: width*0.06, color: textblack),
                          //   decoration: getInputDecoration('Name', Icons.drive_file_rename_outline),
                          //   maxLength: 10,
                          //   controller: name,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
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
                      child:  Center(
                          child: Text(
                            "Camera",
                            style: robotoRegular.copyWith(color: Colors.red),
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
                      child:  Center(
                          child: Text(
                            "Gallery",
                            style: robotoRegular.copyWith(color: Colors.white),
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
