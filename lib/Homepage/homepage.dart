import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Drawer/drawer.dart';
import 'package:olivehealth_delivery/Homepage/navigation.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/pendingNav.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';


class Dashboard{
  // final IconData icon;
  String images;
  String title;
  String subtitle;
  final Color color;
  final void Function()? onTap;
  Dashboard(this.images,this.title,this.subtitle, this.color, this.onTap);

}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {

    List<Dashboard> list = [
    Dashboard(AppAsset.imagesDeliveryicon, CompletedDeliveryy, "153", greencolor,
    () {
      NavigatorService.navigateToScreenTwo(context);
    }
    ),
    Dashboard(AppAsset.imagesTimericon, PendingDelivery, "19",redcolor,
            () {
              NavigatorServicePending.navigateToOntheway(context);
        }),
    Dashboard(AppAsset.imagesCollectionicon, TotalCollected, "₹1200.00",orangecolor,
            () {
          Navigator.pushNamed(context, RoutesName.TotalCol);
        }),
    Dashboard(AppAsset.imagesEarningicon, Earning, "₹1000",blueecolor,
            () {
              NavigatorService.navigateToEarning(context);
        }),
    ];



    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      drawer: const DrawerPage(),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: height*0.01),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: list[index].onTap,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: list[index].color,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(list[index].images.toString(),color: whitecolor,height: height*0.05),
                          Text(list[index].title,style: robotoRegular.copyWith(fontSize: width*0.04,color: whitecolor),),
                          Text(list[index].subtitle,style: robotoRegular.copyWith(fontSize: width*0.056,color: whitecolor,fontWeight: FontWeight.bold),),

                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.CancelDel);
              },
              child: Container(
                height: height*0.09,
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.bookmark_added_rounded,color: whitecolor,),
                          Text(CancelledDelivery,style: robotoRegular.copyWith(fontSize: width*0.05,color: whitecolor),),
                        ],
                      ),
                      Text("09",style: robotoRegular.copyWith(fontSize: width*0.05,color: whitecolor),),

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        NavigatorServicePending.navigateToOntheway(context);
                        },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: redcolor,
                        child: Icon(Icons.directions_run_outlined,color: whitecolor,size: 30,),
                      ),
                    ),
                    SizedBox(height: height*0.02),
                    Text(Ontheway,style: robotoRegular.copyWith(fontSize: width*0.04,color: redcolor,fontWeight: FontWeight.bold),)
                  ],
                ),
                Column(
                  children: [
                     InkWell(
                       onTap: (){
                         NavigatorServicePending.navigateToPicked(context);

                       },
                       child: CircleAvatar(
                        radius: 30,
                        backgroundColor: orangecolor,
                        child: Image.asset(AppAsset.imagesPickedicon,color: whitecolor,height: height*0.04,),
                    ),
                     ),
                    SizedBox(height: height*0.02),
                    Text(Picked,style: robotoRegular.copyWith(fontSize: width*0.04,color: orangecolor,fontWeight: FontWeight.bold),)

                  ],
                ),
                Column(
                  children: [
                     InkWell(
                       onTap: (){
                         NavigatorServicePending.navigateToAssigned(context);

                       },
                       child: CircleAvatar(
                        radius: 30,
                        backgroundColor: blueecolor,
                        child: Image.asset(AppAsset.imagesAssignIcon,color: whitecolor,height: height*0.04,),
                    ),
                     ),
                    SizedBox(height: height*0.02),
                    Text(Assigned,style: robotoRegular.copyWith(fontSize: width*0.04,color: blueecolor,fontWeight: FontWeight.bold),)

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
