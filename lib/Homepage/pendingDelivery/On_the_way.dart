// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Homepage/Orders/orders.dart';
import 'package:olivehealth_delivery/constant/button/borderRowButton.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/controller/CompletedeliveryCont.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';

class Onway extends StatefulWidget {
  const Onway({super.key});

  @override
  State<Onway> createState() => _OnwayState();
}

class _OnwayState extends State<Onway> {

  @override
  void initState() {
    items = List.from(list);

    // TODO: implement initState
    super.initState();
  }
  List<Orderlist> items = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(child: Scaffold(

      body:ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundColor: redcolor,
                child: Icon(Icons.directions_run_outlined,color: whitecolor,size: 30,),
              ),
              title:Text(Ontheway,style: robotoRegular.copyWith(fontSize: width*0.04,color: redcolor,fontWeight: FontWeight.bold),)

            ),
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
                          SizedBox(
                            width: width*0.43,
                            child: BorderRowButton(
                                onTap: () {  },
                                border: Border.all(color: textblack.withOpacity(0.7)),
                                btnColor: whitecolor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(AppAsset.imagesCheckicon,height: height*0.03,),
                                    Text(Markasdelivered,style: robotoRegular.copyWith(fontSize: width*0.04,color: textblack,fontWeight: FontWeight.bold),)
                                  ],
                                )),
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
