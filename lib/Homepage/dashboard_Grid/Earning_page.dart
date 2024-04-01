// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:olivehealth_delivery/constant/color.dart';
import 'package:olivehealth_delivery/constant/styles.dart';
import 'package:olivehealth_delivery/controller/Collectioncont/collectionTabController.dart';
import 'package:olivehealth_delivery/controller/Collectioncont/collection_tabview.dart';


class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    itemCategories = List.from(listt);
    subItem = List.from(listview);
    super.initState();
  }


  ///allcategory
  List<CollectionTablist> itemCategories = [];

  ///subcategory
  List<CollectionTabViewlist> subItem = [];

  String selectedrupees = '₹200';
  String selectedCatDate = '12-3-2023';
  String selectedCatTitle = 'Today';
  int selectedIndex = 0;
  List<CollectionTabViewlist> getSelectedSubItems() {
    return subItem.where((listview) => listview.code == selectedCatTitle).toList();
  }


  @override
  Widget build(BuildContext context) {
    final heights = MediaQuery.of(context).size.height;
    final widths = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: blueecolor,
      //   elevation: 0,
      //   title: Text("My Earnings",style: robotoRegular.copyWith(fontSize: widths*0.045,color: whitecolor,fontWeight: FontWeight.w500),),
      //   leading: CustomBackButton(onTap: () {
      //     Navigator.pop(context);
      //   },
      //     btnColor: whitecolor,),
      // ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heights,
            width: widths*0.30,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemCategories.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCatTitle = itemCategories[index].title;
                            selectedCatDate= itemCategories[index].date;
                            selectedrupees = itemCategories[index].Rupees;
                            selectedIndex = index;
                          });
                        },
                        child: Card(
                            elevation: selectedIndex == index ? 8.0 : 2.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: heights*0.13,
                            width: widths*0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                color: selectedIndex==index?blueecolor.withOpacity(0.4):whitecolor,
                                border: Border.all(color:textblack.withOpacity(0.1))),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(itemCategories[index].title,
                                    style: robotoRegular.copyWith(fontSize: widths*0.035,
                                        color:selectedIndex==index?bluecolor:textblack,fontWeight: FontWeight.bold),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(itemCategories[index].Rupees,
                                        style: robotoRegular.copyWith(fontSize: widths*0.035,
                                            color:selectedIndex==index?bluecolor:textblack,fontWeight: FontWeight.w500
                                      ),),
                                      SizedBox(height: heights*0.01,),
                                      Text(itemCategories[index].date,
                                        style: robotoRegular.copyWith(fontSize: widths*0.03,
                                            color:selectedIndex==index?bluecolor:textblack),),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  );
                }),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: listview.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext, int index){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: const BorderSide(color: Colors.lightBlueAccent)),
                      child: Container(
                        height: heights*0.12,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            gradient:
                            const LinearGradient(
                                colors: [Color(0xfffdfbfb),Color(0xffebedee)],
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listview[index].code,style: robotoRegular.copyWith(fontSize: widths*0.04,color:textblack),),
                                  SizedBox(height: heights*0.01,),
                                  Text(listview[index].date,style: robotoRegular.copyWith(fontSize: widths*0.04,color:textblack)),
                                ],
                              ),
                              Text(listview[index].rupees,style: robotoRegular.copyWith(fontSize: widths*0.04,color: blueecolor,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } ),
          ),
        ],
      ),
    );
  }

}



