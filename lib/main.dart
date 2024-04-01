import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olivehealth_delivery/utils/routes.dart';
import 'package:olivehealth_delivery/utils/routes_name.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: []);

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Olivehealth Delivery',
      initialRoute: RoutesName.splash,
      routes: Routers.routes,

      // home: Splashscreen(),
    );
  }
}


