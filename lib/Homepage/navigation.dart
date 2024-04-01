import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Homepage/dashboard_Grid/Earning_page.dart';
import 'package:olivehealth_delivery/Homepage/dashboard_Grid/completedDelivery.dart';
import 'package:olivehealth_delivery/Homepage/homepage.dart';
import 'package:olivehealth_delivery/Homepage/profileDir/profile_page.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/flushbar.dart';
import 'package:olivehealth_delivery/constant/images.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';

import '../Drawer/drawer.dart';



class Navigationn extends StatefulWidget {
  final int initialIndex;

  const Navigationn({Key? key, this.initialIndex = 0}) : super(key: key);


  @override
  State<Navigationn> createState() => _NavigationnState();
}

class _NavigationnState extends State<Navigationn> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const CompletedDelivery(),
    const Earnings(),
    const Profile(),
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
  Future<bool> _onWillPop() async {
    if (_selectedIndex > 0) {
      setState(() {
        _selectedIndex=0;
      });
      return false; // Do not pop the route
    } else {
      return  await Utils.showExitConfirmation(context)?? false; // Return false if the dialog is dismissed
    }
  }
  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
          drawer: _selectedIndex==0? DrawerPage():DrawerPage(),
          appBar: AppBar(
            backgroundColor: _selectedIndex==0?redlogobtncolor:_selectedIndex==1?redlogobtncolor:_selectedIndex==2?redlogobtncolor:redlogobtncolor,
            title: Text(_selectedIndex==0?"Dashboard":_selectedIndex==1?"Completed delivery":_selectedIndex==2?"My earning":"Profile"),

          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _selectedIndex ==0?
                Icon(Icons.home_outlined, color:Colors.red.shade900, size:heights*0.03,):
                Icon(Icons.home_outlined, color:textblack, size:heights*0.03,),
                label: 'Home',
                backgroundColor:  Colors.grey.shade300,
              ),
              BottomNavigationBarItem(
                icon: _selectedIndex ==1?
                Image.asset(AppAsset.imagesDeliveryicon,height: heights*0.03,color: Colors.red.shade900,):
                Image.asset(AppAsset.imagesDeliveryicon,height: heights*0.03,color: textblack,),
                label: 'My Delivery',
                backgroundColor:  Colors.grey.shade300,
              ),
              BottomNavigationBarItem(
                icon:
                _selectedIndex ==2?
                Image.asset(AppAsset.imagesEarningicon,height: heights*0.03,color: Colors.red.shade900,):
                Image.asset(AppAsset.imagesEarningicon,height: heights*0.03,color: textblack,),
                label: 'My Earnings',
                backgroundColor: Colors.grey.shade300,
              ),
              BottomNavigationBarItem(
                icon:
                _selectedIndex ==3?
                Icon(Icons.person_outline, color:Colors.red.shade900, size:heights*0.03,):
                Icon(Icons.person_outline, color:textblack, size:heights*0.03,),
                label: 'Profile',
                backgroundColor:  Colors.grey.shade300,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: textblack,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
class NavigatorService {
  static void navigateToScreenThree(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomnav,arguments: 0);
  }

  static void navigateToScreenTwo(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomnav,arguments: 1);
  }

  static void navigateToEarning(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomnav,arguments: 2);
  }

  static void navigateToprofile(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomnav,arguments: 3);
  }


}