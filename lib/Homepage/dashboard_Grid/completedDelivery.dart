// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/borderRowButton.dart';
import 'package:olivehealth_delivery/constant/button/custom_button.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/controller/CompletedeliveryCont.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';



class CompletedDelivery extends StatefulWidget {

  const CompletedDelivery({super.key});

  @override
  State<CompletedDelivery> createState() => _CompletedDeliveryState();
}

class _CompletedDeliveryState extends State<CompletedDelivery> {

  @override
  void initState() {
    items = List.from(list);

    // TODO: implement initState
    super.initState();
  }

  String? selectedValue;
  String? cashvalue;

  List<Map<String, dynamic>> dropdownItems = [
    {'name': 'All'},
    {'name': 'Days'},
    {'name': 'Weekly'},
    {'name': 'Month'},
  ];
  List<Map<String, dynamic>> cashItems = [
    {'name': 'All'},
    {'name': 'COD'},
    {'name': 'NON-COD'},
  ];

  List<Orderlist> items = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: [
              SizedBox(height: height*0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height*0.05,
                    width: width*0.35,
                    decoration: BoxDecoration(
                        border: Border.all(color: greycolor.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: whitecolor,
                        hint: Text(" All", style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack)),
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                          if (kDebugMode) {
                            print(selectedValue);
                          }
                        },
                        items: dropdownItems
                            .map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item['name'],
                            child: Text(" "+item['name'],
                                style: robotoRegular.copyWith(
                                    fontSize: width*0.04, color: textblack)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    height: height*0.05,
                    width: width*0.35,
                    decoration: BoxDecoration(
                        border: Border.all(color: greycolor.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: whitecolor,
                        hint: Text(" All", style: robotoRegular.copyWith(fontSize: width*0.04, color: textblack)),
                        value: cashvalue,
                        onChanged: (String? newValue) {
                          setState(() {
                            cashvalue = newValue;
                          });
                          if (kDebugMode) {
                            print(cashvalue);
                          }
                        },
                        items: cashItems
                            .map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item['name'],
                            child: Text(" "+item['name'],
                                style: robotoRegular.copyWith(
                                    fontSize: width*0.04, color: textblack)),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.01),
              ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, int index){
                    return Column(
                      children: [
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: height*0.20,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            gradient:
                            const LinearGradient(
                                colors: [gradientone,gradienttwo],
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(OrderCode,style: robotoRegular.copyWith(fontSize: width*0.038,color: textblack,fontWeight: FontWeight.w500),),
                                    Text(list[index].code.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: Colors.green,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(list[index].date.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: textblack),),
                                    Text(list[index].amount.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: greencolor,fontWeight: FontWeight.bold),),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(PaymentStatus,style: robotoRegular.copyWith(fontSize: width*0.038,color: textblack,fontWeight: FontWeight.w500),),
                                    Row(
                                      children: [
                                        Text(list[index].status.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: textblack),),
                                        SizedBox(width: width*0.02,),
                                        Image.asset((list[index].status=="Cash on Delivery"?AppAsset.imagesCodicon:AppAsset.imagesOnlinepayicon),height: height*0.04,width: width*0.06,)
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),


                          ),
                        ),
                        SizedBox(height: height*0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: width*0.43,
                              child: BorderRowButton(
                                  onTap: () {
                                    Navigator.pushNamed(context, RoutesName.orderdetails);
                                  },
                                  border: Border.all(color: textblack.withOpacity(0.7)),
                                  btnColor: whitecolor,
                                child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppAsset.imagesClipboardicon,height: height*0.025,),
                                    Text(ViewDetails,style: robotoRegular.copyWith(fontSize: width*0.04,color: textblack,fontWeight: FontWeight.bold),)
                                  ],
                                )),
                            ),
                            CustomButton(
                              onTap: (){},
                              text: Delivered,
                              btnColor: greencolor,
                              textColor: whitebtncolor,
                              size: width*0.04,
                              width: width*0.43,
                              height: height*0.067,
                            )
                          ],
                        ),
                        SizedBox(height: height*0.03),
                      ],
                    );
                  }
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width*0.45,
            child: BorderRowButton(
                onTap: (){},
                btnColor: greencolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(AppAsset.imagesDeliveryicon,height: height*0.03,color: whitecolor,),
                    Text(CompletedDeliveryy,style: robotoRegular.copyWith(fontSize: width*0.04,color: whitecolor),),
                  ],
            )),
          ),
          SizedBox(
            width: width*0.45,
            child: BorderRowButton(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.PendingNav);
                },
                btnColor: redlogobtncolor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Image.asset(AppAsset.imagesTimericon,height: height*0.03,color: whitecolor,),
                    Text(PendingDelivery,style: robotoRegular.copyWith(fontSize: width*0.04,color: whitecolor),),
                  ],
                )),
          ),

      ],),
    ));

  }
}
