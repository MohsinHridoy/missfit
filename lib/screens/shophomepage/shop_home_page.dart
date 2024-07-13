import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/cartscreen/cart001.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:miss_fit/screens/productdetails/product_details.dart';
import 'package:miss_fit/screens/shoppage/searchpage.dart';
import 'package:miss_fit/screens/shoppage/shop_page.dart';
import 'package:miss_fit/screens/subscription/subscription.dart';
import 'package:miss_fit/screens/wishlist/wish_list_screen.dart';

import '../../common_widgets.dart';
import '../../widgets/product_item.dart';
import '../wishlist/wishlist_screen.dart';

class CustomItem {
  final String title;
  final String image;
  final double price;
  final double originalPrice;
  final String category;

  bool isChecked;

  CustomItem({
    required this.title,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.category,
    this.isChecked = false,
  });
}

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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

  List<String> categoryItems = ['All', 'Gym Equpment', 'Nutrition', 'Body'];
  List<CustomItem> filteredItems =
      []; // Items to be displayed based on the selected category
  int selectedIndex = 0; // Add this line
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF6F6F6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    GestureDetector(
                        onTap: () {
                          navigateToNextPage(context, AllItemsSearchPage());
                        },
                        child: _buildSearchBar()),
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(left: 22.0, right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          title_textView_Kt_SBld('Nouvelle arrivee'),
                          InkWell(
                            onTap: () {
                              print("see all");
                              navigateToNextPage(context,AllItemsShopPage(status: 'newarrival',));
                            },
                            child:textVwSeeAll('Voir tout'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Take full width of the screen
                        height: 221,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 22.0 : 0, right: 15),
                              // Apply left padding only to the first item
                              child: GestureDetector(
                                onTap: () {

                                  navigateToNextPage(context,ProductDetails());
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.32,
                                  // Set width to half of screen width
                                  height: 170,
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            height: 153,
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
                                                item.image,
                                                width: 100,
                                                height: 100,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4),
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 200,
                                                      child: Text(
                                                        item.title,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF334155),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Archivo-SemiBold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 18),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'CHF ${item.price.toStringAsFixed(2)}',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF334155),
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'Archivo-Medium',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 0.12,
                                                            ),
                                                          ),
                                                          Text(
                                                            'CHF ${item.originalPrice.toStringAsFixed(2)}',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF66758C),
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  'Archivo-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              height: 0.14,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 4),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Visibility(
                                        visible: items[index].isChecked,
                                        child: Container(
                                          height: 40,
                                          width: 50,
                                          child: Image.asset(
                                              "assets/product_details/icon_sale.png"),
                                        ),
                                      ),
                                      Positioned(
                                        top: 19,
                                        left: 10,
                                        child: Visibility(
                                          visible: items[index].isChecked,
                                          child: Text(
                                            'Sale',
                                            style: TextStyle(
                                              color: Color(0xFF0F172A),
                                              fontSize: 10,
                                              fontFamily: 'Archivo-Medium',
                                              fontWeight: FontWeight.w500,
                                              height: 0.15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 22),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          title_textView_Kt_SBld('Tous les produits'),
                          InkWell(
                            onTap: () {
                              print("see all");
                              navigateToNextPage(context,AllItemsShopPage(status: 'allproducts',));
                            },
                            child:textVwSeeAll('Voir tout'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),

                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 18),
                      child: Container(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryItems.length,
                          itemBuilder: (context, index) {
                            final labelText = categoryItems[index];
                            final textWidth = labelText.length * 12.0; //
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  // Filter items based on the selected category
                                  if (selectedIndex == 0) {
                                    // All category selected, show all items
                                    filteredItems = items;
                                  } else {
                                    // Filter items based on the selected category
                                    filteredItems = items
                                        .where((item) =>
                                            item.category ==
                                            categoryItems[index])
                                        .toList();
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  // width: labelText == 'All' ? 48 :  textWidth + 30,
                                  height: 36,
                                  alignment: Alignment.center,
                                  decoration: ShapeDecoration(
                                    color: index == selectedIndex
                                        ? Colors.white: Colors.transparent,
                                    shape: RoundedRectangleBorder(

                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: index == selectedIndex
                                            ? Color(0xFFFFA142)
                                            : Color(0xFFD1D5DB),
                                      ),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 15.0,top: 8),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          // if (labelText != 'All')
                                          //   Image.asset(
                                          //     "assets/review/icon_star.png",
                                          //     scale: 2,
                                          //   ),
                                          Text(
                                            labelText,
                                            style: TextStyle(
                                              color: index == selectedIndex
                                                  ? Color(0xFFE88E32)
                                                  : Color(0xFF334155),
                                              fontSize: 14,
                                              fontFamily: 'Archivo-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 0.10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              // Number of items per row
                              mainAxisSpacing: 20,
                              // Adjust the spacing between items vertically
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.73,
                              // Adjust the aspect ratio of items
                              children: List.generate(
                                filteredItems.length,
                                    (index) {
                                  final item = filteredItems[index];
                                  return ProductItem(
                                    item: item,
                                    onTap: () {
                                      navigateToNextPage(
                                          context, ProductDetails());
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 200),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Color(0xFFF6F6F6),
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 12,
                  right: 8,
                  bottom: 8,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/shophome/icon_search.png"),
                    SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: TextFormField(
                          readOnly: true,
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.10,
                          ),
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 14,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/shophome/icon_filter.png',
                  // Replace 'your_image.png' with the actual path to your image asset
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        border: Border(
          left: BorderSide(
            color: Colors.white.withOpacity(0.10999999940395355),
          ),
          top: BorderSide(
            color: Colors.white.withOpacity(0.10999999940395355),
          ),
          right: BorderSide(
            color: Colors.white.withOpacity(0.10999999940395355),
          ),
          bottom: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.10999999940395355),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 22.0, top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Text(
                'Prenons votre \nproduits préférés',
                textAlign: TextAlign.start, // Align text to the left
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w600,

                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      navigateToNextPage(context, WishList());

                    },
                    child: buildIconContainer(
                        "assets/shophome/icon_wishlist.png")),
                SizedBox(width: 16),
                GestureDetector(
                    onTap: (){
                      navigateToNextPage(context, Cart001());
                    },
                    child: buildIconContainer("assets/shophome/icon_shopping_cart.png")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIconContainer(String iconData) {
    return Container(
      width: 36,
      height: 36,
      padding: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0x0C18181B),
        borderRadius: BorderRadius.circular(4),
      ),
      // child: Icon(
      //   iconData,
      //   color: Colors.black,
      //   size: 24,
      // ),
      child: Image.asset(iconData),
    );
  }
}
