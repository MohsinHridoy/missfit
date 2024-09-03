import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:miss_fit/screens/productdetails/product_details.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/product_item.dart';
import '../../widgets/search_bar.dart';



class AllItemsShopPage extends StatefulWidget {
  String? status;

  AllItemsShopPage({super.key, this.status});

  @override
  State<AllItemsShopPage> createState() => _AllItemsShopPageState();
}

class _AllItemsShopPageState extends State<AllItemsShopPage> {
  List<CustomItem> items = [
    CustomItem(
        title: 'Anti-Burst Balance Ball',
        image: 'assets/product_details/img_autobrust.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: false),
    CustomItem(
        title: 'Dumbbells',
        image: 'assets/product_details/img_dumble.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: true),
    CustomItem(
        title: 'Big Power Nutrition',
        image: 'assets/product_details/img_power_bottle.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: false),
    CustomItem(
        title: 'Protien Shake',
        image: 'assets/product_details/img_protienshake.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Nutrition',
        isChecked: false),
    CustomItem(
        title: 'Dumbbells',
        image: 'assets/product_details/img_dumble.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: true),
    CustomItem(
        title: 'Kettlebells',
        image: 'assets/product_details/img_kettle_bells.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: false),

    // Add more items here as needed
  ];
  List<String> searchHistory = [];

  List<CustomItem> filteredItems =
      []; // Items to be displayed based on the selected category
  int selectedIndex = 0; // Add this line
  TextEditingController _controller =
      TextEditingController(); // Declare the controller
  FocusNode _focusNode = FocusNode(); // Declare the focus node
  final List<String> chipitems = [
    'Nutrition',
    '5 kg',
    'Berry',
    '10 %',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredItems = items;
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller
    _focusNode.dispose(); // Dispose of the focus node

    super.dispose();
  }

  Widget _buildItem(String item, int index) {
    return Container(
      height: 36,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFFFA142),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 13.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    chipitems.removeAt(index);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.asset(
                    "assets/shophome/icon_delete.png",
                    scale: 1.7,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 12.0),
              child: Text(
                item,
                style: TextStyle(
                  color: Color(0xFFE88E32),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [
            CustomAppBar(
              title: widget.status != 'newarrival'
                  ? "Tous les produits"
                  : "Tous les produits",
              onBackTap: () {
                navigateToNextPage(context, DashBoard(number: 1,));
              },
              iconSpacing: 4, // Custom iconSpacing value
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // _buildSearchBar(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomSearchBar(
                      controller: _controller,
                      focusNode: _focusNode,
                      items: items,
                      searchHistory: searchHistory,
                      onItemsFiltered: (filteredItems) {
                        setState(() {
                          this.filteredItems = filteredItems;
                        });
                      },
                      page: FilterShopScreen(),
                      onTapFilter: () {
                        navigateToNextPage(context,FilterShopScreen());
                      },
                    ),
                    SizedBox(
                      height:widget.status == 'filter'? 20.h:0,
                    ),
                    widget.status == 'filter'? Padding(
                      padding: const EdgeInsets.only(left: 23.0, right: 23),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 12.0, // Spacing between items
                          runSpacing: 12.0, // Spacing between lines
                          children: chipitems
                              .map((chipitems) => _buildItem(
                                  chipitems, chipitems.indexOf(chipitems)))
                              .toList(),
                        ),
                      ),
                    ):SizedBox(),
                    SizedBox(
                      height:widget.status == 'filter'? 5:0,
                    ),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.vertical,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 22.0, right: 22),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         GridView.builder(
                    //           shrinkWrap: true,
                    //
                    //           physics: NeverScrollableScrollPhysics(),
                    //           gridDelegate:
                    //               SliverGridDelegateWithFixedCrossAxisCount(
                    //             crossAxisCount: 2,
                    //             // Number of items per row
                    //             crossAxisSpacing: 12,
                    //             // Adjust the spacing between items horizontally
                    //             mainAxisSpacing: 20,
                    //             // Adjust the spacing between items vertically
                    //             childAspectRatio:
                    //                 0.73, // Adjust the aspect ratio of items
                    //           ),
                    //           itemCount: filteredItems.length,
                    //           // Replace 6 with your actual item count
                    //           itemBuilder: (context, index) {
                    //             final item = filteredItems[index];
                    //
                    //             return ProductItem(
                    //               item: item,
                    //               onTap: () {
                    //                 navigateToNextPage(
                    //                     context, ProductDetails());
                    //               },
                    //             );
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Wrap GridView.builder in a SizedBox with a specific height
                            SizedBox(
                              height: MediaQuery.of(context).size.height,  // Adjust the height as needed
                              child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
                                itemCount: filteredItems.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 13,
                                  crossAxisSpacing: 13,
                                  childAspectRatio: 0.752,
                                ),
                                itemBuilder: (context, index) {
                                  final item = filteredItems[index];
                                  return LayoutBuilder(
                                    builder: (context, constraints) {
                                      double itemWidth = constraints.maxWidth;
                                      double aspectRatio = 4 / 3; // Example aspect ratio of 4:3
                                      double itemHeight = itemWidth * (3 / 4); // Calculate height based on the aspect ratio

                                      return GestureDetector(
                                        onTap: () {
                                          navigateToNextPage(context, ProductDetails());
                                        },
                                        child: Container(
                                          width: itemWidth, // Use the width provided by LayoutBuilder
                                          height: itemHeight, // Dynamic height based on aspect ratio
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    height: itemHeight * 1.25, // Adjust this value based on design
                                                    clipBehavior: Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      color: Colors.white,
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(4),
                                                          topRight: Radius.circular(4),
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        item.image!,
                                                        width: itemWidth * 0.75,
                                                        height: itemHeight * 0.75, // Adjust the image size as needed
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: ShapeDecoration(
                                                        color: Color(0xFFF3F4F6),
                                                        shape: RoundedRectangleBorder(
                                                          side: BorderSide(
                                                            width: 1,
                                                            color: Color(0xFFE5E7EB),
                                                          ),
                                                          borderRadius: BorderRadius.only(
                                                            bottomLeft: Radius.circular(4),
                                                            bottomRight: Radius.circular(4),
                                                          ),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              item.title!,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(
                                                                color: Color(0xFF334155),
                                                                fontSize: 14,
                                                                fontFamily: 'Archivo-SemiBold',
                                                                fontWeight: FontWeight.w600,
                                                              ),
                                                            ),
                                                            // Spacer(),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 8.0),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'CHF ${item.price!.toStringAsFixed(2)}',
                                                                    style: TextStyle(
                                                                      color: Color(0xFF334155),
                                                                      fontSize: 12,
                                                                      fontFamily: 'Archivo-Medium',
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'CHF ${item.originalPrice!.toStringAsFixed(2)}',
                                                                    style: TextStyle(
                                                                      color: Color(0xFF66758C),
                                                                      fontSize: 10,
                                                                      fontFamily: 'Archivo-Regular',
                                                                      fontWeight: FontWeight.w400,
                                                                      decoration: TextDecoration.lineThrough,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Visibility(
                                                visible: item.isChecked ?? false,
                                                child: Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  child: Container(
                                                    height: 40,
                                                    width: 50,
                                                    child: Image.asset("assets/product_details/icon_sale.png"),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 13,
                                                left: 10,
                                                child: Visibility(
                                                  visible: item.isChecked ?? false,
                                                  child: Text(
                                                    'Sale',
                                                    style: TextStyle(
                                                      color: Color(0xFF0F172A),
                                                      fontSize: 10,
                                                      fontFamily: 'Archivo-Medium',
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                  ;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
