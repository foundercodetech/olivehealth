import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Homepage/navigation.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/pendingNav.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/flushbar.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';

// class drawerlist{
//   String name;
//   final IconData icon;
//   final void Function()? ontap;
//   drawerlist(this.name,this.icon,this.ontap);
//
// }

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {



  @override
  Widget build(BuildContext context) {

    // List<drawerlist> list =[
    //   drawerlist(Dashboardd, Icons.dashboard_customize, () { NavigatorService.navigateToScreenThree(context);}),
    //   drawerlist(ChangePassword, Icons.password, () { Navigator.pushNamed(context, RoutesName.Forgetpass);}),
    //   drawerlist(CompletedDeliveryy, Icons.dashboard_customize, () { NavigatorService.navigateToScreenTwo(context);}),
    //   drawerlist(PendingDelivery, Icons.dashboard_customize, () { NavigatorServicePending.navigateToOntheway(context);}),
    //   drawerlist(CancelledDelivery, Icons.cancel_outlined, () { Navigator.pushNamed(context, RoutesName.CancelDel);}),
    //   drawerlist(MyCollection, Icons.dashboard_customize, () {  Navigator.pushNamed(context, RoutesName.TotalCol);}),
    //   drawerlist(PrivacyPolicy, Icons.privacy_tip_outlined, () { Navigator.pushNamed(context, RoutesName.privacypolicy);}),
    //   drawerlist(TermCondition, Icons.dashboard_customize, () { Navigator.pushNamed(context, RoutesName.termscond);}),
    //   drawerlist(AboutUs, Icons.account_box, () { Navigator.pushNamed(context, RoutesName.aboutUs);}),
    //   drawerlist(Logout, Icons.logout, () { Utils.showExitConfirmation(context);}),
    //
    // ];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Drawer(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(color: redlogobtncolor),
              child: InkWell(
                onTap: (){
                  NavigatorService.navigateToprofile(context);
                },
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    btnColor: whitecolor,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: whitecolor,
                        backgroundImage: AssetImage(AppAsset.imageslogo),
                      ),
                      SizedBox(width: width*0.04,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Delivery Boy xz",style: robotoRegular.copyWith(fontSize: width*0.045,color: whitecolor),),
                          Text("delivery@boy.com",style: robotoRegular.copyWith(fontSize: width*0.045,color: whitecolor.withOpacity(0.6)),)
                        ],
                      )
                    ],
                  ),
                ],
            ),
              ),),
            ListTile(
              onTap: (){
                NavigatorService.navigateToScreenThree(context);
              },
              title: Text(Dashboardd,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading: Appicon.dashboardicon,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.Forgetpass);
              },
              title: Text(ChangePassword,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading: Appicon.passwordicon
            ),
            ListTile(
              onTap: (){
                NavigatorService.navigateToScreenTwo(context);
              },
              title: Text(CompletedDeliveryy,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading: Image.asset(AppAsset.imagesDeliveryicon,height: height*0.035,color: greycolor.shade800,),
            ),
            ListTile(
              onTap: (){
                NavigatorServicePending.navigateToOntheway(context);
                },
              title: Text(PendingDelivery,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading: Image.asset(AppAsset.imagesTimericon,height: height*0.035,color: greycolor.shade800,),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.CancelDel);

              },
              title: Text(CancelledDelivery,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading:  Appicon.cancelicon,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.TotalCol);
                },
              title: Text(MyCollection,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading: Image.asset(AppAsset.imagesCollectionicon,height: height*0.035,color: greycolor.shade800,),
            ),
            const Divider(color: textblack,indent: 15,endIndent: 15,),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.privacypolicy);
              },
              title: Text(PrivacyPolicy,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack) ,),
              leading: Appicon.privacyicon,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.termscond);
              },
              title: Text(TermCondition,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack) ,),
              leading: Appicon.termsicon,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.aboutUs);
              },
              title: Text(AboutUss,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack),),
              leading: Appicon.abouticon,
            ),
            ListTile(
              onTap: (){
                Utils.showLogoutConfirmation(context);
              },
              title: Text(Logout,style:robotoRegular.copyWith(fontSize: width*0.043,color: textblack)),
              leading:  Appicon.logouticon,
            ),
            SizedBox(height: height*0.03,),
            Center(child: Text("App version:1.0.1",style: robotoRegular.copyWith(fontSize: width*0.03,color: Colors.grey.shade400,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}
