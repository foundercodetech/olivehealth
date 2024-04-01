import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:olivehealth_delivery/constant/appbar/CustomAppBar.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/text_constant.dart';


class Privacy_policy extends StatefulWidget {
  const Privacy_policy({super.key});

  @override
  State<Privacy_policy> createState() => _Privacy_policyState();
}

class _Privacy_policyState extends State<Privacy_policy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarTwo(
        title: PrivacyPolicy,
        color: redlogobtncolor, textcolor: whitecolor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: HtmlWidget(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
          ),
        ),
      ),
    );
  }
}