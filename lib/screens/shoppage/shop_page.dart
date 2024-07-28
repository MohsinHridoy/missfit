import 'package:flutter/material.dart';
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
              padding: const EdgeInsets.only(left: 5, right: 12.0, top: 8),
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
                      height: 20,
                    ),
                    widget.status == 'filter'? Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
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
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 22.0, right: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GridView.builder(
                              shrinkWrap: true,

                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                // Number of items per row
                                crossAxisSpacing: 12,
                                // Adjust the spacing between items horizontally
                                mainAxisSpacing: 20,
                                // Adjust the spacing between items vertically
                                childAspectRatio:
                                    0.73, // Adjust the aspect ratio of items
                              ),
                              itemCount: filteredItems.length,
                              // Replace 6 with your actual item count
                              itemBuilder: (context, index) {
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
