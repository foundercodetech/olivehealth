// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/borderRowButton.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/controller/CompletedeliveryCont.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';


class CancelDelivery extends StatefulWidget {
  const CancelDelivery({super.key});

  @override
  State<CancelDelivery> createState() => _CancelDeliveryState();
}

class _CancelDeliveryState extends State<CancelDelivery> {
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
      appBar: AppBar(
        backgroundColor: redlogobtncolor,
        title: Text("Cancel Delivery",style: robotoRegular.copyWith(fontSize: width*0.055,color: whitecolor),),
        leading: CustomBackButton(onTap: () { Navigator.pop(context); },),
      ),
        body:ScrollConfiguration(
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
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
                                    Text(list[index].code.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: redcolor,fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(list[index].date.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: textblack),),
                                    Text(list[index].amount.toString(),style: robotoRegular.copyWith(fontSize: width*0.038,color: redcolor,fontWeight: FontWeight.bold),),
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
                              width: width*0.35,
                              child: BorderRowButton(
                                onTap: () {
                                  Navigator.pushNamed(context, RoutesName.orderdetails);

                                  },
                              child: Text(ViewDetails,style: robotoRegular.copyWith(fontSize: width*0.04,color: whitecolor),),)
                            ),
                            SizedBox(
                              width: width*0.35,
                              child: BorderRowButton(
                                onTap: () {  },
                                child: Text(Cancelled,style: robotoRegular.copyWith(fontSize: width*0.04,color: whitecolor),),)
                            ),
                          ],
                        ),
                        SizedBox(height: height*0.03),
                      ],
                    );
                  }
              ),
            ],
          ),
        )
    ));
  }
}
