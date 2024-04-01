// ignore_for_file: avoid_types_as_parameter_names, deprecated_member_use
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Testname{
  String name;
  String amount;
  String mrp;
  String pname;
  Testname(this.name,this.amount,this.mrp,this.pname);
}

class ReviewBooking extends StatefulWidget {


  const ReviewBooking({super.key});


  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {

  double latitude = 26.88983;
  double longitude = 80.94615;


  // String location= "";
  //
  // void _selectLocation() async {
  //   final selectedLocation = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddAdressMap()),
  //   );
  //   if (selectedLocation != null && selectedLocation is Map<String, dynamic>) {
  //     setState(() {
  //       final  location = selectedLocation['locationName'].toString();
  //       if (kDebugMode) {
  //         print(location);
  //         print("chxhxhxh");
  //       }
  //     });
  //
  //   }
  // }

  List<Testname> list = [
    Testname("Ranjana | 24 | Female", "₹2600", "₹1099", "Fever package - Advance"),
    Testname("Pankaj | 24 | Male", "₹2600", "₹1099", "Haemogram package - Advance"),
    Testname("Payal | 24 | Female", "₹2600", "₹1099", "Fever package - Advance"),
  ];


  Widget showdata(int index,context){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (index % 4 == 0) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: width*0.06,right: width*0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ReviewBookings, style: robotoRegular.copyWith(fontSize: width*0.045,color: textblack,fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close, color: textblack))
                ],
              ),
            ),
            const Divider(color: textblack),
            Container(
              width: width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: greycolor.shade400,width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(SampleCollectionAddress, style: robotoRegular.copyWith(fontSize: width*0.045,color: textblack,fontWeight: FontWeight.bold),),
                      IconButton(
                          onPressed: (){
                            // _selectLocation();
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>AddAdressMap()));
                            // openMap();
                            openMap(latitude,longitude);

                          },
                          icon: const Icon(Icons.remove_red_eye)
                      )
                    ],
                  ),
                 
                  // SizedBox(
                  //   child: Text(location,
                  //       style: robotoRegular.copyWith(
                  //           fontSize: width * 0.04,
                  //           color:  Colors.black45,
                  //           fontWeight: FontWeight.w500),
                  //       textAlign: TextAlign.start,
                  //       maxLines: 4,
                  //       overflow: TextOverflow.ellipsis),
                  // ),
                  
                  // Text(
                  //   "Latitude: 26.88983, Longitude: 80.94615",
                  //   style: robotoRegular.copyWith(
                  //     fontSize: width * 0.04,
                  //     color: Colors.black45,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  //   textAlign: TextAlign.start,
                  // ),
                  Text(
                    "Latitude: $latitude,Longitude: $longitude", // Display the latitude variable
                    style: robotoRegular.copyWith(
                      fontSize: width * 0.04,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: greycolor.shade400,width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sample Collection Time", style: robotoRegular.copyWith(fontSize: width*0.045,color: textblack,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: Text("12th dec 2023 | 1:00 PM - 2:00 PM", style: robotoRegular.copyWith(
                        fontSize: width * 0.04,
                        color: Colors.black45,
                        fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
            ),
            SizedBox(height: height*0.02),
            Text("Tests",style: robotoRegular.copyWith(fontSize: width*0.04,color: textblack,fontWeight: FontWeight.bold),),
            SizedBox(height: height*0.02,),
            ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext, int index){
                  return   Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: greycolor.shade400,width: 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list[index].pname, style: robotoRegular.copyWith(fontSize: width*0.045,color: textblack,fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(list[index].name,style:robotoRegular.copyWith(fontSize: width*0.04,color: redtext,fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(list[index].amount,style: robotoRegular.copyWith(fontSize: width*0.035,color: greycolor,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: greycolor,
                                  decorationThickness: 2.0,
                                ),
                                  textAlign: TextAlign.start,),
                                SizedBox(width: width*0.03,),
                                Text(list[index].mrp,style:robotoRegular.copyWith(fontSize: width*0.045,color: textblack,fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      );
    } else {
      return Container();
    }
  }


  void _incrementCounter() async {
    await showModalBottomSheet(
      elevation: 10,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(15),left: Radius.circular(15))
      ),
      isScrollControlled: true,
      clipBehavior: Clip.antiAlias,
      context: context,
      barrierColor: textblack.withOpacity(0.6),
      useSafeArea: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) => ListView(
          controller: controller,
          children: List<Widget>.generate(
            1, (index) => showdata(index,context),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: _incrementCounter,
      child: Container(
        height: height*0.07,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(color: textblack.withOpacity(0.4))
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(ReviewBookings,style: robotoRegular.copyWith(fontSize: width*0.034,fontWeight: FontWeight.bold),),
              Appicon.forwardicon
            ],
          ),
        ),
      ),
    );
  }
  void openMap(double latitude,double longitude) async {
    double latitude = 26.88983;
    double longitude = 80.94615;

    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      if (kDebugMode) {
        print('Could not launch the map.');
      }
    }
  }

}





