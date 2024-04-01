//
// import 'package:flutter/material.dart';
//
//
// class Accessories extends StatefulWidget {
//   const Accessories({super.key});
//
//   @override
//   State<Accessories> createState() => _AccessoriesState();
// }
//
// final List<AllCategories> itemCategories = [
//
//   AllCategories(
//       id: '1', title: 'Pole Light', image: Assets.assetsPoleLight, catId: '1'),
//   AllCategories(
//       id: '2',
//       title: 'Pole Camera ',
//       image: Assets.assetsCameraPole,
//       catId: '2'),
// ];
//
// final List<SubcategoryItem> subItem = [
//   SubcategoryItem(
//       title: 'Mercury Pole',
//       image: Assets.assetsPoleLight,
//       catId: '1',
//       price: '10000.95₹'),
//   SubcategoryItem(
//       title: 'Fancy Garden Pole Light',
//       image: Assets.assetsPole1,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: '6 Feet GardenPole',
//       image: Assets.assetsPole2,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: '8 Feet AluminiumPole',
//       image: Assets.assetsPole3,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Antra 50w Pole',
//       image: Assets.assetsPole4,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Nova Pole',
//       image: Assets.assetsPole5,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'LED Pole Light',
//       image: Assets.assetsPole6,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Street Pole',
//       image: Assets.assetsPole7,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Traffic Light Pole',
//       image: Assets.assetsPole8,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'LED Street Pole Light',
//       image: Assets.assetsPole9,
//       catId: '1',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Security Camera Pole',
//       image: Assets.assetsCameraPole,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'CCTV Camera Pole',
//       image: Assets.assetsPoleCamera1,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Circular CCTV Camera Pole',
//       image: Assets.assetsPleCamera2,
//       catId: '2',
//       price: '0'),
//   SubcategoryItem(
//       title: 'Pole Camera Arms',
//       image: Assets.assetsPoleCamera3,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Round CCTV Camera Pole',
//       image: Assets.assetsPoleCamera4,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Surveillance Cameras',
//       image: Assets.assetsPoleCamera5,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'OverHead Camera Pole',
//       image: Assets.assetsPoleCamera6,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Pole Camera',
//       image: Assets.assetsPoleCamera7,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Telescopic Camera Pole',
//       image: Assets.assetsPoleCamera8,
//       catId: '2',
//       price: '9000.00₹'),
//   SubcategoryItem(
//       title: 'Camera Movement Pole',
//       image: Assets.assetsPoleCamera9,
//       catId: '2',
//       price: '9000.00₹'),
// ];
//
// class _AccessoriesState extends State<Accessories> {
//   String selectedCatId = '1';
//   String selectedCatTitle = 'Street Pole Light';
//   int selectedIndex = 0;
//   List<SubcategoryItem> getSelectedSubItems() {
//     return subItem.where((item) => item.catId == selectedCatId).toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final heights = MediaQuery.of(context).size.height;
//     final widths = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: textWidget(
//             text: AppConstants.allCategoriesApp,
//             fontWeight: FontWeight.w600,
//             fontSize: 16),
//         actions: const [
//           Icon(
//             Icons.search,
//             size: 25,
//           ),
//           SizedBox(
//             height: 10,
//           )
//         ],
//       ),
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: heights,
//             width: widths / 4.5,
//             child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: itemCategories.length,
//                 itemBuilder: (context, index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 15),
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             selectedCatId = itemCategories[index].catId;
//                             selectedCatTitle = itemCategories[index].title;
//                             selectedIndex = index;
//                           });
//                         },
//                         child: Row(
//                           children: [
//                             Container(
//                               height: heights / 8,
//                               width: widths / 50,
//                               decoration: BoxDecoration(
//                                   borderRadius: const BorderRadius.only(
//                                       topRight: Radius.circular(5),
//                                       bottomRight: Radius.circular(5)),
//                                   gradient: selectedIndex == index
//                                       ? const LinearGradient(
//                                       colors: [
//                                         AppColors.primarySecondColor,
//                                         AppColors.gradientColor
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomRight,
//                                       tileMode: TileMode.clamp)
//                                       : null),
//                             ),
//                             Container(
//                               height: heights / 8,
//                               width: widths / 5,
//
//                               // color: selectedIndex==index?Colors.purple.withOpacity(0.1):Colors.white,
//                               decoration: BoxDecoration(
//                                 // color: AppColors.primaryFirstColor,
//                                 // borderRadius: BorderRadius.circular(15),
//                                   border: Border.all(
//                                       color: Colors.black.withOpacity(0.1))),
//                               child: Column(
//                                 mainAxisAlignment:
//                                 MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: Colors.white,
//                                     radius: 30,
//                                     child: Image(
//                                       image: AssetImage(
//                                           itemCategories[index].image),
//                                     ),
//                                   ),
//                                   Center(
//                                     child: textWidget(
//                                       text: itemCategories[index].title,
//                                       maxLines: 1,
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // const Divider(
//                       //   thickness: 0.1,
//                       //   color: AppColors.dividerColor,
//                       // )
//                     ],
//                   );
//                 }),
//           ),
//           SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: SizedBox(
//                 width: widths / 1.3,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     textWidget(
//                         text: selectedCatTitle,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16),
//                     GridView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemCount: getSelectedSubItems().length,
//                       gridDelegate:
//                       const SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           mainAxisSpacing: 1,
//                           crossAxisSpacing: 1),
//                       itemBuilder: (context, index) {
//                         SubcategoryItem selectedItem =
//                         getSelectedSubItems()[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(4.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: AppColors.primaryFirstColor,
//                                 borderRadius: BorderRadius.circular(15),
//                                 border: Border.all(
//                                     color: Colors.black.withOpacity(0.1))),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor: Colors.white,
//                                   radius: 40,
//                                   child: Image(
//                                     image: AssetImage(selectedItem.image),
//                                   ),
//                                 ),
//                                 textWidget(
//                                   textAlign: TextAlign.center,
//                                   text: selectedItem.title,
//                                   fontSize: 12,
//                                   maxLines: 1,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.grey,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     textWidget(
//                                         textAlign: TextAlign.center,
//                                         text: 'Price :',
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.grey),
//                                     textWidget(
//                                       textAlign: TextAlign.center,
//                                       text: ' ${selectedItem.price}',
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   height: heights / 33,
//                                   width: widths / 2,
//                                   decoration: const BoxDecoration(
//                                       borderRadius: BorderRadius.only(
//                                         bottomRight: Radius.circular(12),
//                                         bottomLeft: Radius.circular(12),
//                                       ),
//                                       gradient: LinearGradient(
//                                           colors: [
//                                             AppColors.gradientColor,
//                                             AppColors.primarySecondColor,
//                                           ],
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           tileMode: TileMode.clamp)),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       textWidget(
//                                           text: 'Add to Cart ',
//                                           color: Colors.white),
//                                       const Icon(
//                                         Icons.shopping_cart,
//                                         color: Colors.white,
//                                         size: 15,
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AllCategories {
//   final String id;
//   final String title;
//   final String image;
//   final String catId;
//
//   AllCategories({
//     required this.id,
//     required this.title,
//     required this.image,
//     required this.catId,
//   });
// }
//
// class SubcategoryItem {
//   final String title;
//   final String image;
//   final String price;
//   final String catId;
//
//   SubcategoryItem({
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.catId,
//   });
// }