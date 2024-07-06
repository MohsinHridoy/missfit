import 'package:flutter/material.dart';

import '../common_utils.dart';
import 'package:flutter/material.dart';

import '../screens/shophomepage/shop_home_page.dart';

// class CustomItem {
//   final String title;
//   final String image;
//   final double price;
//   final double originalPrice;
//   final String category;
//   final bool isChecked;
//
//   CustomItem({
//     required this.title,
//     required this.image,
//     required this.price,
//     required this.originalPrice,
//     required this.category,
//     required this.isChecked,
//   });
// }

class CustomSearchBar extends StatelessWidget {
  TextEditingController? controller;
  FocusNode? focusNode;
  final List<CustomItem> items; // Replace with your actual item list
  List<String>? searchHistory; // Replace with your actual search history list
  final Function(List<CustomItem>) onItemsFiltered;
  Widget? page;

   CustomSearchBar({
    Key? key,
    this.controller,
    this.focusNode,
    required this.items,
    this.searchHistory,
    required this.onItemsFiltered,
    this.page,
  }) : super(key: key);

  void navigateToNextPage(BuildContext context, Widget page) {
    // Implement your navigation logic here
    // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 42,
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
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: (value) {
                        List<CustomItem> filteredItems = items
                            .where((item) => item.title
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        onItemsFiltered(filteredItems);
                      },
                      onEditingComplete: () {
                        focusNode!.unfocus();
                        final value = controller!.text;
                        if (value.isNotEmpty &&
                            !searchHistory!.contains(value)) {
                          searchHistory!.insert(0, value);
                          if (searchHistory!.length > 3) {
                            searchHistory!.removeLast();
                          }
                        }
                      },
                      cursorColor: Color(0xFF9CA3AF).withOpacity(0.3),
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 14,
                        fontFamily: 'Archivo-Regular',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                      decoration: InputDecoration(
                        hintText: focusNode!.hasFocus ? '' : 'Search',
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
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              navigateToNextPage(context, page!);
            },
            child: Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 1, color: Color(0xFFD1D5DB)),
              ),
              child: Center(
                child: Image.asset(
                  'assets/shophome/icon_filter.png',
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
