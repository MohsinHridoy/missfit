// import 'package:flutter/material.dart';
// import 'package:miss_fit/common_utils.dart';
// import 'package:miss_fit/screens/cartscreen/cart001.dart';
// import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
//
// import '../../widgets/common_buttons.dart';
// import '../../widgets/custom_app_bar.dart';
//
// class WishList extends StatefulWidget {
//   const WishList({super.key});
//
//   @override
//   State<WishList> createState() => _WishListState();
// }
//
// class _WishListState extends State<WishList> {
//   List<CustomItem> items = [
//     CustomItem(
//         title: 'Dumbbells',
//         image: 'assets/product_details/img_dumble.png',
//         price: 25.00,
//         originalPrice: 30.00,
//         category: 'Gym Equpment',
//         isChecked: true),
//     CustomItem(
//         title: 'Big Power Nutrition',
//         image: 'assets/product_details/img_power_bottle.png',
//         price: 25.00,
//         originalPrice: 30.00,
//         category: 'Gym Equpment',
//         isChecked: false),
//     CustomItem(
//         title: 'Protien Shake',
//         image: 'assets/product_details/img_protienshake.png',
//         price: 25.00,
//         originalPrice: 30.00,
//         category: 'Nutrition',
//         isChecked: false),
//     CustomItem(
//         title: 'Kettlebells',
//         image: 'assets/product_details/img_kettle_bells.png',
//         price: 25.00,
//         originalPrice: 30.00,
//         category: 'Gym Equpment',
//         isChecked: false),
//
//     // Add more items here as needed
//   ];
//
//   List<String> categoryItems = ['All', 'Gym Equpment', 'Nutrition', 'Body'];
//   List<CustomItem> filteredItems = [];
//   int selectedIndex = 0;
//   List<bool> itemAdded = []; // Initialize empty initially
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems = items;
//     itemAdded =
//         List.filled(filteredItems.length, false); // Initialize itemAdded here
//   }
//
//   void deleteItem(int index) {
//     setState(() {
//       CustomItem itemToRemove = filteredItems[index];
//       items.remove(itemToRemove);
//       filteredItems.removeAt(index);
//       itemAdded.removeAt(index); // Remove corresponding itemAdded state
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         color: Color(0xFFF6F6F6),
//         child: Column(
//           children: [
//             CustomAppBar(
//               title: 'WishList',
//               onBackTap: () {
//                 Navigator.pop(context);
//               },
//               iconSpacing: 3.2,
//             ),
//             SizedBox(height: 15),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
//               child: SizedBox(
//                 height: 50.0,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: categoryItems.length,
//                   itemBuilder: (context, index) {
//                     final labelText = categoryItems[index];
//                     final textWidth = labelText.length * 12.0; //
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           selectedIndex = index;
//                           // Filter items based on the selected category
//                           if (selectedIndex == 0) {
//                             // All category selected, show all items
//                             filteredItems = items;
//                           } else {
//                             // Filter items based on the selected category
//                             filteredItems = items
//                                 .where((item) =>
//                                     item.category == categoryItems[index])
//                                 .toList();
//                           }
//                         });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           // width: labelText == 'All' ? 48 : textWidth + 30,
//                           height: 36,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: index == selectedIndex
//                                 ? Colors.white
//                                 : Colors.transparent,
//                             borderRadius: BorderRadius.circular(4),
//                             border: Border.all(
//                               width: 1,
//                               color: index == selectedIndex
//                                   ? Color(0xFFFFA142)
//                                   : Color(0xFFD1D5DB),
//                             ),
//                           ),
//                           child: Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 15.0, right: 15),
//                             child: Text(
//                               labelText,
//                               style: TextStyle(
//                                 color: index == selectedIndex
//                                     ? Color(0xFFE88E32)
//                                     : Color(0xFF334155),
//                                 fontSize: 14,
//                                 fontFamily: 'Archivo-Regular',
//                                 fontWeight: FontWeight.w400,
//                                 height:
//                                     1.0, // Adjusted height to 1.0 for normal line height
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 22.0, right: 22),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(filteredItems.length, (index) {
//                       final item = filteredItems[index];
//
//                       return Padding(
//                         padding: const EdgeInsets.only(top: 12.0),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 110,
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Container(
//                                         width: 80,
//                                         height: 91,
//                                         padding: const EdgeInsets.only(
//                                             top: 7, right: 1, bottom: 5),
//                                         clipBehavior: Clip.antiAlias,
//                                         decoration: ShapeDecoration(
//                                           color: Color(0xFFE5E7EB),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8),
//                                           ),
//                                         ),
//                                         child: Center(
//                                           child: Image.asset(
//                                             item.image,
//                                           ),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10.0, top: 5, right: 3),
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             SizedBox(
//                                               width: 200,
//                                               child: Text(
//                                                 item.title,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: TextStyle(
//                                                   color: Color(0xFF334155),
//                                                   fontSize: 14,
//                                                   fontFamily:
//                                                       'Archivo-SemiBold',
//                                                   fontWeight: FontWeight.w600,
//                                                   height: 0.09,
//                                                 ),
//                                               ),
//                                             ),
//                                             SizedBox(height: 18),
//                                             Container(
//                                               child: Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     'CHF ${item.price.toStringAsFixed(2)}',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF334155),
//                                                       fontSize: 12,
//                                                       fontFamily:
//                                                           'Archivo-Medium',
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       height: 0.12,
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                     width: 3,
//                                                   ),
//                                                   Text(
//                                                     'CHF ${item.originalPrice.toStringAsFixed(2)}',
//                                                     style: TextStyle(
//                                                       color: Color(0xFF66758C),
//                                                       fontSize: 10,
//                                                       fontFamily:
//                                                           'Archivo-Regular',
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       decoration: TextDecoration
//                                                           .lineThrough,
//                                                       height: 0.14,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                             SizedBox(height: 25),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(SnackBar(
//                                                   content: Text(
//                                                       'Item added to cart: ${item.title}'),
//                                                   duration:
//                                                       Duration(seconds: 2),
//                                                 ));
//
//                                                 // Make the add to cart button invisible
//                                                 setState(() {
//                                                   itemAdded[index] = true;
//                                                 });
//                                               },
//                                               child: Visibility(
//                                                 visible: !itemAdded[index],
//                                                 child: Container(
//                                                   width: 98,
//                                                   height: 32,
//                                                   decoration: BoxDecoration(
//                                                     color: Color(0xFFFF4343),
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                   ),
//                                                   child: Center(
//                                                     child: Text(
//                                                       'Add to cart',
//                                                       style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 10,
//                                                         fontFamily:
//                                                             'Archivo-SemiBold',
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         height: 1.4,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Align(
//                                     alignment: Alignment.bottomLeft,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           top: 50.0, right: 10),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           showModalBottomSheet(
//                                             barrierColor: Color(0xFF111827)
//                                                 .withOpacity(0.7),
//                                             context: context,
//                                             builder: (BuildContext context) {
//                                               return Container(
//                                                 height: 215,
//                                                 // Adjust the height as necessary
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.only(
//                                                     topLeft:
//                                                         Radius.circular(20.0),
//                                                     topRight:
//                                                         Radius.circular(20.0),
//                                                   ),
//                                                 ),
//                                                 width: MediaQuery.of(context)
//                                                     .size
//                                                     .width,
//                                                 child: Column(
//                                                   children: <Widget>[
//                                                     SizedBox(height: 50),
//                                                     Text(
//                                                       'Delete Existing Wishlist!',
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       style: TextStyle(
//                                                         color:
//                                                             Color(0xFF334155),
//                                                         fontSize: 18,
//                                                         fontFamily:
//                                                             'Archivo-SemiBold',
//                                                         fontWeight:
//                                                             FontWeight.w600,
//                                                         height: 0.08,
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 30),
//                                                     Text(
//                                                       'Do you want to delete this item?',
//                                                       textAlign:
//                                                           TextAlign.center,
//                                                       style: TextStyle(
//                                                         color:
//                                                             Color(0xFF334155),
//                                                         fontSize: 16,
//                                                         fontFamily:
//                                                             'Archivo-Medium',
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         height: 0.09,
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 40),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               left: 30.0,
//                                                               right: 30,
//                                                               bottom: 1),
//                                                       child: Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .spaceBetween,
//                                                         children: [
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               Navigator.pop(
//                                                                   context); // Close the modal when tapped
//                                                             },
//                                                             child: Container(
//                                                               width: 150,
//                                                               height: 52,
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                       .symmetric(
//                                                                       horizontal:
//                                                                           32,
//                                                                       vertical:
//                                                                           17),
//                                                               decoration:
//                                                                   ShapeDecoration(
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   side: BorderSide(
//                                                                       width: 1,
//                                                                       color: Color(
//                                                                           0xFFFF4343)),
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               8),
//                                                                 ),
//                                                               ),
//                                                               child: Center(
//                                                                 child: Text(
//                                                                   'No',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     color: Color(
//                                                                         0xFFFF4343),
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontFamily:
//                                                                         'Archivo-SemiBold',
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     height:
//                                                                         0.09,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           GestureDetector(
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 if (index >= 0 && index < filteredItems.length) {
//                                                                   CustomItem itemToRemove = filteredItems[index];
//                                                                   items.remove(itemToRemove);
//                                                                   filteredItems.removeAt(index);
//                                                                   // if (index < itemAdded.length) {
//                                                                   //   itemAdded
//                                                                   //       .removeAt(
//                                                                   //           index); // Remove from itemAdded if it exists
//                                                                   // }
//                                                                 }
//
//
//                                                               });
//                                                               Navigator.pop(
//                                                                   context);
//                                                               // filteredItems
//                                                               //     .removeAt(
//                                                               //     index);
//                                                             },
//                                                             child: Container(
//                                                               width: 150,
//                                                               height: 52,
//                                                               decoration:
//                                                                   ShapeDecoration(
//                                                                 color: Color(
//                                                                     0xFFFF4343),
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               8),
//                                                                 ),
//                                                               ),
//                                                               child: Center(
//                                                                 child: Text(
//                                                                   'Yes',
//                                                                   style:
//                                                                       TextStyle(
//                                                                     color: Colors
//                                                                         .white,
//                                                                     fontSize:
//                                                                         16,
//                                                                     fontFamily:
//                                                                         'Archivo-SemiBold',
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w600,
//                                                                     height:
//                                                                         0.09,
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 20),
//                                                   ],
//                                                 ),
//                                               );
//                                             },
//                                           );
//                                         },
//                                         child: Container(
//                                           width: 32,
//                                           height: 32,
//                                           padding: const EdgeInsets.all(6),
//                                           clipBehavior: Clip.antiAlias,
//                                           decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(4),
//                                           ),
//                                           child: Image.asset(
//                                               "assets/product_details/icon_delete.png"),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: ShapeDecoration(
//                                   shape: RoundedRectangleBorder(
//                                     side: BorderSide(
//                                       width: 1,
//                                       strokeAlign: BorderSide.strokeAlignCenter,
//                                       color: Color(0xFFE5E7EB),
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: customButtonRed(context, 'Add to Cart', onPressed: () {}),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
