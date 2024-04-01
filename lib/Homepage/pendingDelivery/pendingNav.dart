// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/Assigned.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/On_the_way.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/Picked.dart';
import 'package:olivehealth_delivery/constant/button/custombackbutton.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';


class PendingNav extends StatefulWidget {
  final int initialIndex;

  const PendingNav({Key? key, this.initialIndex = 0}) : super(key: key);


  @override
  State<PendingNav> createState() => _PendingNavState();
}

class _PendingNavState extends State<PendingNav> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Onway(),
    const Picked_page(),
    const AssignedPage()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void initState() {
  //   _selectedIndex = widget.initialIndex;
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is int) {
        setState(() {
          _selectedIndex = args; // Assign received data to the variable
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Pending Delivery",style: robotoRegular.copyWith(fontSize: widths*0.045,color: textblack,fontWeight: FontWeight.w500),),
          leading: CustomBackButton(
            onTap: () {
              Navigator.pop(context);
              },
            btnColor: textblack,
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex ==0?
              const CircleAvatar(
                radius: 15,
                 backgroundColor: redcolor,
               child: Icon(Icons.directions_run_outlined,color: whitecolor,size: 20,),
              ): CircleAvatar(
                  radius: 15,
                 backgroundColor: Colors.grey.shade100,
                child: const Icon(Icons.directions_run_outlined,color: textblack,size: 20,),
              ),
              label: 'On the Way',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex ==1?
            CircleAvatar(
            radius: 15,
            backgroundColor: orangecolor,
            child: Image.asset(AppAsset.imagesPickedicon,color: whitecolor,height: heights*0.03,),
            ):
            CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey.shade100,
              child: Image.asset(AppAsset.imagesPickedicon,color: textblack,height: heights*0.03,),
             ),
              label: 'Picked',
            ),
            BottomNavigationBarItem(
              icon:
              _selectedIndex ==2?
            CircleAvatar(
             radius: 15,
              backgroundColor: blueecolor,
               child: Image.asset(AppAsset.imagesAssignIcon,color: whitecolor,height: heights*0.03,),
              ):
                 CircleAvatar(
                   radius: 15,
                   backgroundColor: Colors.grey.shade100,
                    child: Image.asset(AppAsset.imagesAssignIcon,color: textblack,height: heights*0.03,),
                 ),
              label: 'Assigned',
            ),

          ],
          currentIndex: _selectedIndex,
          selectedItemColor: textblack,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
class NavigatorServicePending {
  static void navigateToOntheway(BuildContext context) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (context) => const PendingNav(initialIndex: 0)),
    // );
    Navigator.pushNamed(context, RoutesName.PendingNav,arguments:0);

  }
  static void navigateToPicked(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.PendingNav,arguments:1);


  }
  static void navigateToAssigned(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.PendingNav,arguments:2);
  }


}