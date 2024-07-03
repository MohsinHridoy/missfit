import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:miss_fit/screens/productdetails/product_details.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';

import '../../widgets/custom_app_bar.dart';

class AllItemsShopPage extends StatefulWidget {
  String? status;
   AllItemsShopPage({super.key,this.status});

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
  TextEditingController _controller = TextEditingController(); // Declare the controller
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
        padding: const EdgeInsets.only(left:12.0,right: 13.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
                onTap: (){
                  setState(() {
                    chipitems.removeAt(index);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.asset("assets/shophome/icon_delete.png",scale: 1.7,),
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left:5,right: 12.0,top: 8),
              child: Text(
                item,
                style: TextStyle(
                  color: Color(0xFFE88E32),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
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
              title: widget.status!='newarrival' ?'All Products':'New Arrival',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.6, // Custom iconSpacing value
            ),
            SizedBox(height: 20,),


            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    _buildSearchBar(),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Wrap(
                          spacing: 12.0, // Spacing between items
                          runSpacing: 12.0, // Spacing between lines
                          children: chipitems.map((chipitems) => _buildItem(chipitems,chipitems.indexOf(chipitems))).toList(),
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0,right: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            GridView.builder(
                              shrinkWrap: true,

                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // Number of items per row
                                crossAxisSpacing: 20,
                                // Adjust the spacing between items horizontally
                                mainAxisSpacing: 20,
                                // Adjust the spacing between items vertically
                                childAspectRatio:
                                0.78, // Adjust the aspect ratio of items
                              ),
                              itemCount: filteredItems.length,
                              // Replace 6 with your actual item count
                              itemBuilder: (context, index) {
                                final item = filteredItems[index];

                                return GestureDetector(
                                  onTap: (){
                                    navigateToNextPage(context,ProductDetails());

                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 2,
                                    // Set width to half of screen width
                                    height: 250,
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              // Full width of container
                                              height: 152,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.only(
                                                    topLeft:
                                                    Radius.circular(4),
                                                    topRight:
                                                    Radius.circular(4),
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
                                                // Full width of container
                                                decoration: ShapeDecoration(
                                                  color: Color(0xFFF3F4F6),
                                                  shape:
                                                  RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 1,
                                                        color:
                                                        Color(0xFFE5E7EB)
                                                            .withOpacity(
                                                            0.5)),
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
                                                  padding: EdgeInsets.only(
                                                      top: 5.0),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.all(
                                                        8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        SizedBox(
                                                          width: 128,
                                                          child: Text(
                                                            item.title,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF334155),
                                                              fontSize: 14,
                                                              fontFamily:
                                                              'Archivo-SemiBold',
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 18),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'CHF ${item.price.toStringAsFixed(2)}',
                                                              style:
                                                              TextStyle(
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
                                                              style:
                                                              TextStyle(
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
                                                      ],
                                                    ),
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
                                );
                              },
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

  // Widget _buildSearchBar() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 22.0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           child: Container(
  //             height: 40,
  //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
  //             decoration: BoxDecoration(
  //               color: Colors.white.withOpacity(0.05),
  //               borderRadius: BorderRadius.circular(4),
  //               border: Border.all(width: 1, color: Color(0xFFD1D5DB)),
  //             ),
  //             child: Row(
  //               children: [
  //                 Padding(
  //                   padding: const EdgeInsets.only(right: 8.0),
  //                   child: Image.asset(
  //                     "assets/shophome/icon_search.png",
  //                     width: 20,
  //                     height: 20,
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: TextFormField(
  //                     controller: _controller,
  //                     focusNode: _focusNode,
  //                     onChanged: (value) {
  //                       setState(() {
  //                         filteredItems = items
  //                             .where((item) =>
  //                             item.title.toLowerCase().contains(value.toLowerCase()))
  //                             .toList();
  //                       });
  //                     },
  //                     onEditingComplete: () {
  //                       _focusNode.unfocus();
  //                       final value = _controller.text;
  //                       if (value.isNotEmpty && !searchHistory.contains(value)) {
  //                         searchHistory.insert(0, value);
  //                         if (searchHistory.length > 3) {
  //                           searchHistory.removeLast();
  //                         }
  //                       }
  //                     },
  //                     style: TextStyle(
  //                       color: Color(0xFF9CA3AF),
  //                       fontSize: 14,
  //                       fontFamily: 'Archivo-Regular',
  //                       fontWeight: FontWeight.w400,
  //                       height: 0.15,
  //                     ),
  //                     decoration: InputDecoration(
  //                       hintText: _focusNode.hasFocus ? '' : 'Search',
  //                       hintStyle: TextStyle(
  //                         color: Color(0xFF9CA3AF),
  //                         fontSize: 14,
  //                         fontFamily: 'Archivo-Regular',
  //                         fontWeight: FontWeight.w400,
  //                         height: 0.15
  //                       ),
  //                       border: InputBorder.none,
  //                       contentPadding: EdgeInsets.zero,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(width: 10),
  //         GestureDetector(
  //           onTap: () {
  //             Navigator.of(context).push(
  //               MaterialPageRoute(
  //                 builder: (context) => FilterShopScreen(),
  //               ),
  //             );
  //           },
  //           child: Container(
  //             width: 40,
  //             height: 40,
  //             padding: const EdgeInsets.all(8),
  //             decoration: BoxDecoration(
  //               color: Colors.white.withOpacity(0.05),
  //               borderRadius: BorderRadius.circular(4),
  //               border: Border.all(width: 1, color: Color(0xFFD1D5DB)),
  //             ),
  //             child: Center(
  //               child: Image.asset(
  //                 'assets/shophome/icon_filter.png',
  //                 width: 24,
  //                 height: 24,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: Color(0xFFD1D5DB)),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8.0),
              child: Image.asset(
                "assets/shophome/icon_search.png",
                width: 20,
                height: 20,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    filteredItems = items
                        .where((item) =>
                        item.title.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                onEditingComplete: () {
                  _focusNode.unfocus();
                  final value = _controller.text;
                  if (value.isNotEmpty && !searchHistory.contains(value)) {
                    searchHistory.insert(0, value);
                    if (searchHistory.length > 3) {
                      searchHistory.removeLast();
                    }
                  }
                },
                cursorColor: Colors.red, // Set your desired cursor color
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.5, // Adjusted height for better spacing
                ),
                decoration: InputDecoration(
                  hintText: _focusNode.hasFocus ? '' : 'Search',
                  hintStyle: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 1.5, // Adjusted height for better spacing
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  // Customize cursor and selection color
                 // Set your desired selection color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
