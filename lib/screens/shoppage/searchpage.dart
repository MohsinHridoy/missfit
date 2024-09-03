import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:miss_fit/screens/productdetails/product_details.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';

import '../../common_widgets.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/product_item.dart';

class AllItemsSearchPage extends StatefulWidget {
  const AllItemsSearchPage({Key? key}) : super(key: key);

  @override
  State<AllItemsSearchPage> createState() => _AllItemsSearchPageState();
}

class _AllItemsSearchPageState extends State<AllItemsSearchPage> {
  List<CustomItem> items = [
    CustomItem(
        title: 'Anti-Burst Balance Ball',
        image: 'assets/product_details/img_autobrust.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equipment',
        isChecked: false),
    CustomItem(
        title: 'Dumbbells',
        image: 'assets/product_details/img_dumble.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equipment',
        isChecked: true),
    CustomItem(
        title: 'Big Power Nutrition',
        image: 'assets/product_details/img_power_bottle.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equipment',
        isChecked: false),
    CustomItem(
        title: 'Protein Shake',
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
        category: 'Gym Equipment',
        isChecked: true),
    CustomItem(
        title: 'Kettlebells',
        image: 'assets/product_details/img_kettle_bells.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equipment',
        isChecked: false),
  ];

  List<String> searchHistory = [];
  List<CustomItem> filteredItems = []; // Items to be displayed based on the selected category

  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) {
      // Keyboard unfocused, perform actions here
      setState(() {
        final value = _controller.text.trim();
        if (value.isNotEmpty && !searchHistory.contains(value)) {
          searchHistory.insert(0, value);
          if (searchHistory.length > 3) {
            searchHistory.removeLast();
          }
        }
      });
    }
  }

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Image.asset("assets/shophome/icon_search.png", scale: 2,),
            ),
            Expanded(
              child: TextFormField(
                controller: _controller,
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    filteredItems = items
                        .where((item) => item.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                        .toList();
                  });
                },
                // onEditingComplete: () {
                //   focusNode!.unfocus();
                //   final value = controller!.text;
                //   if (value.isNotEmpty &&
                //       !searchHistory!.contains(value)) {
                //     searchHistory!.insert(0, value);
                //     if (searchHistory!.length > 3) {
                //       searchHistory!.removeLast();
                //     }
                //   }
                // },
                cursorColor: Color(0xFF9CA3AF).withOpacity(0.3),
                style: TextStyle(
                  color: Color(0xFF9CA3AF),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                decoration: InputDecoration(
                  hintText:  _focusNode.hasFocus ? '' : 'Recherche',
                  hintStyle: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 14,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSearchHistory() {
    return Visibility(
      visible: searchHistory.isNotEmpty,
      child: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: title_textView_Kt_SBld('Recherche récente')
            ),
            SizedBox(height: 10),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: searchHistory.map((historyItem) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/search/icon_history.png",
                          scale: 1.7,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 6),
                            child: Text(
                              historyItem,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Archivo-Regular',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              searchHistory.remove(historyItem);
                            });
                          },
                          child: Image.asset(
                            "assets/search/icon_delete.png",
                            scale: 1.7,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: GestureDetector(
        onTap: () {
          // Handle tapping outside the text field to unfocus the keyboard
          if (_focusNode.hasFocus ) {
            _focusNode.unfocus();
            // setState(() {
            //   filteredItems = items
            //       .where((item) => item.title
            //       .toLowerCase()
            //       .contains(value.toLowerCase()))
            //       .toList();
            // });
          }
        },
        child: Container(
          color: Color(0xFFF6F6F6),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Recherche',
                onBackTap: () {
                  Navigator.pop(context);
                },
                iconSpacing: 3.4,
              ),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSearchBar(),
                      SizedBox(height: 40),
                      _buildSearchHistory(),
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0, right: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            title_textView_Kt_SBld('Recherche populaire')
                          ],
                        ),
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
                      //           physics: NeverScrollableScrollPhysics(),
                      //           gridDelegate:
                      //           SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 2,
                      //             crossAxisSpacing: 12,
                      //             mainAxisSpacing: 20,
                      //             childAspectRatio: 0.73,
                      //           ),
                      //           itemCount: filteredItems.length,
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
      ),
    );
  }
}
