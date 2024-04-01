import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/button/custom_button.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';

class Acceptedreason extends StatefulWidget {
  const Acceptedreason({super.key});

  @override
  State<Acceptedreason> createState() => _AcceptedreasonState();
}

class _AcceptedreasonState extends State<Acceptedreason> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: const BorderSide(color: Colors.white)),
      child: SizedBox(
        height: h*0.30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Appicon.tickicon,
            Text(OrderAccepted,style: robotoRegular.copyWith(fontSize: w*0.05,color:textblack,fontWeight: FontWeight.bold),),
            Text(AreWant,style: robotoRegular.copyWith(fontSize: w*0.04,color:textblack)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  btnColor: acceptbutton,
                  text: "Yes",
                  size: w*0.05,
                  width: w*0.20,
                  height: h*0.05,
                ),
                CustomButton(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  text: "No",
                  btnColor: rejectbutton,

                  size: w*0.05,
                  width: w*0.20,
                  height: h*0.05,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
