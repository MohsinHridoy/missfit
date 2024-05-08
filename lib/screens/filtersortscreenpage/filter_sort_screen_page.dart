import 'package:flutter/material.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Category {
  final String name;
  final int itemCount;
  bool isSelected;
  final Color color;

  Category({
    required this.name,
    required this.itemCount,
    this.isSelected = false,
    required this.color
  });
}

class SortByPage extends StatefulWidget {
  const SortByPage({Key? key}) : super(key: key);

  @override
  State<SortByPage> createState() => _SortByPageStateState();
}

class _SortByPageStateState extends State<SortByPage> {
  late SharedPreferences _prefs;
  List<Category> size = [
    Category(name: 'Newest ', itemCount: 20,color: Color(0xFFFF7427)),
    Category(name: 'Best Seller', itemCount: 32,color:Colors.black),
    Category(name: 'On Sale', itemCount: 12,color:Color(0xFFF61313)),
    Category(name: 'Price low to high', itemCount: 10,color:Color(0xFFA2FA4B)),
    Category(name: 'Price high to low', itemCount: 12,color:Color(0xFF9923F5)),

  ];

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Load previously selected categories from shared preferences
    final List<String>? selectedCategoryNames =
    _prefs.getStringList('selectedSort');
    if (selectedCategoryNames != null) {
      setState(() {
        size.forEach((category) {
          category.isSelected = selectedCategoryNames.contains(category.name);
        });
      });
      // Print all the saved items
      print('Saved categories: $selectedCategoryNames');
    }
  }

  Future<void> _saveSelectedCategories() async {
    // Clear previously saved categories
    await _prefs.remove('selectedSort');

    // Save selected category to shared preferences
    final List<String> selectedCategoryNames = size
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    await _prefs.setStringList('selectedSort', selectedCategoryNames);

    // Ensure only one item is selected
    if (selectedCategoryNames.isNotEmpty) {
      for (final category in size) {
        if (category.name == selectedCategoryNames.first) {
          category.isSelected = true;
        } else {
          category.isSelected = false;
        }
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterShopScreen(),
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
            Container(
              height: 97,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.11)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle back button tap
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.1),

                    Text(
                      'Sort By',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Kanit-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),

                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(size.length, (index) {
                      final category = size[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Unselect all categories
                            for (final item in size) {
                              item.isSelected = false;
                            }
                            // Select the tapped category
                            category.isSelected = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20,
                            bottom: 5,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  child: category.isSelected
                                      ? Image.asset(
                                    "assets/payment/icon_radio_check.png",
                                    scale: 2.0,
                                  )
                                      : Image.asset(
                                    "assets/payment/icon_radio_uncheck.png",
                                    scale: 2.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),


                                Expanded(
                                  child: Text(
                                    '${category.name}',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-Regular',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _saveSelectedCategories();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 104,
                    vertical: 17,
                  ),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}