// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Homepage/Orders/orderDetails_page.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import '../../constant/images.dart';


class Orders_page extends StatefulWidget {
  const Orders_page({super.key});

  @override
  State<Orders_page> createState() => _Orders_pageState();
}

class _Orders_pageState extends State<Orders_page> {

  bool check1= false;
  bool change = false;


  @override
  Widget build(BuildContext context) {
    final height =  MediaQuery.of(context).size.height;
    final width =  MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, icon:  Appicon.backwardicon),
        backgroundColor: whitecolor,
        title: Text(ViewDetails,style: robotoRegular.copyWith(fontSize: width*0.05,color: textblack,fontWeight: FontWeight.w500),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: height*0.02),
             ReviewBooking(),
            SizedBox(height: height*0.02),
            Text(PriceDetails,style: robotoRegular.copyWith(fontSize: width*0.05,fontWeight: FontWeight.bold)),
            SizedBox(height: height*0.02),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.grey.shade300)),
              child: Column(
                children: [
                  SizedBox(height: height*0.02,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(TotalAmount,style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.w200),),
                        Text("₹2186",style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.w200),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(HomeCollectionCharge,style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.w200),),
                        Text("FREE",style: robotoRegular.copyWith(fontSize: width*0.037,color: tealtext,fontWeight: FontWeight.w200),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(VIPDiscount,style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.w200),),
                        Text("-₹220",style: robotoRegular.copyWith(fontSize: width*0.037,color: tealtext,fontWeight: FontWeight.w200),)
                      ],
                    ),
                  ),
                  Container(
                    height: height*0.07,
                    decoration:  const BoxDecoration(
                      gradient:  LinearGradient(
                          colors: [gradientone,gradienttwo],
                          begin: Alignment.topRight,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                      color: Color(0xfff7e9e8),),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Amountpaid,style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.bold),),
                          Text("₹1880",style: robotoRegular.copyWith(fontSize: width*0.037,color: textblack,fontWeight: FontWeight.w200),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(PaymentSelect,style: robotoRegular.copyWith(fontSize: width*0.05,fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Text(CashonDelivery,style: robotoRegular.copyWith(fontSize: width*0.038,color: bluecolor),),
                    SizedBox(width: width*0.02,),
                    Image.asset(AppAsset.imagesCodicon,height: height*0.04,width: width*0.06,)
                  ],
                ),
              ],
            ),
            SizedBox(height: height*0.01),

            SizedBox(height: height*0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(GrandTotal,style: robotoRegular.copyWith(fontSize: width*0.05,fontWeight: FontWeight.bold),),
                Text("₹989",style: robotoRegular.copyWith(fontSize: width*0.04,fontWeight: FontWeight.bold,color: bluecolor),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
