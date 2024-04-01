import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/Drawer/DrawerContent/privacy_policy.dart';
import 'package:olivehealth_delivery/Drawer/DrawerContent/terms_condition.dart';
import 'package:olivehealth_delivery/Homepage/Cancel_delivery/canceldelivery.dart';
import 'package:olivehealth_delivery/Homepage/Orders/order_map.dart';
import 'package:olivehealth_delivery/Homepage/Orders/orders.dart';
import 'package:olivehealth_delivery/Homepage/dashboard_Grid/Earning_page.dart';
import 'package:olivehealth_delivery/Homepage/dashboard_Grid/TotalCollection.dart';
import 'package:olivehealth_delivery/Homepage/dashboard_Grid/completedDelivery.dart';
import 'package:olivehealth_delivery/Homepage/navigation.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/Assigned.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/On_the_way.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/Picked.dart';
import 'package:olivehealth_delivery/Homepage/pendingDelivery/pendingNav.dart';
import 'package:olivehealth_delivery/Homepage/profileDir/aboutUs.dart';
import 'package:olivehealth_delivery/Homepage/profileDir/edit_Profile.dart';
import 'package:olivehealth_delivery/Login/forget_password.dart';
import 'package:olivehealth_delivery/Login/login.dart';
import 'package:olivehealth_delivery/splash_screen.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';



class Routers {
  static final Map<String, WidgetBuilder> routes = {
    RoutesName.splash: (context) => const Splashscreen(),
    RoutesName.login: (context) => const LoginPage(),
    RoutesName.bottomnav: (context) => const Navigationn(),
    RoutesName.CompleteDel: (context) => const CompletedDelivery(),
    RoutesName.PendingNav: (context) => const PendingNav(),
    RoutesName.PendingOnway: (context) => const Onway(),
    RoutesName.Pendingpicked: (context) => const Picked_page(),
    RoutesName.Pendingassigned: (context) => const AssignedPage(),
    RoutesName.TotalCol: (context) => const Totalcollection(),
    RoutesName.Earnings: (context) => const Earnings(),
    RoutesName.Forgetpass: (context) => const Forgetpassworrd(),
    RoutesName.editprofile: (context) => const Editprofile(),
    RoutesName.termscond: (context) => const TermsCndition(),
    RoutesName.privacypolicy: (context) => const Privacy_policy(),
    RoutesName.aboutUs: (context) => const AboutUs(),
    RoutesName.CancelDel: (context) => const CancelDelivery(),
    RoutesName.orderdetails: (context) => const Orders_page(),




  };
}
