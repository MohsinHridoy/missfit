import 'package:flutter/material.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Category {
  final String name;
  final int itemCount;
  bool isSelected;

  Category({
    required this.name,
    required this.itemCount,
    this.isSelected = false,
  });
}

class BrandsSelectionPage extends StatefulWidget {
  const BrandsSelectionPage({Key? key}) : super(key: key);

  @override
  State<BrandsSelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<BrandsSelectionPage> {
  late SharedPreferences _prefs;
  List<Category> brands = [
    Category(name: 'Polo ', itemCount: 20),
    Category(name: 'Nike', itemCount: 32),
    Category(name: 'USPA', itemCount: 12),
    Category(name: 'Adidas', itemCount: 10),

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
    _prefs.getStringList('selectedBrands');
    if (selectedCategoryNames != null) {
      setState(() {
        brands.forEach((category) {
          category.isSelected = selectedCategoryNames.contains(category.name);
        });
      });
      // Print all the saved items
      print('Saved categories: $selectedCategoryNames');
    }
  }

  Future<void> _saveSelectedCategories() async {
    // Clear previously saved categories
    await _prefs.remove('selectedBrands');

    // Save selected categories to shared preferences
    final List<String> selectedCategoryNames = brands
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    await _prefs.setStringList('selectedBrands', selectedCategoryNames);
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
                    SizedBox(width: MediaQuery.of(context).size.width / 3.4),
                    Text(
                      'Brands',
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
                    children: List.generate(brands.length, (index) {
                      final category = brands[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            category.isSelected = !category.isSelected;
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
                                    "assets/registration/icon_selected_box.png",
                                    scale: 2.0,
                                  )
                                      : Image.asset(
                                    "assets/registration/icon_unselected_checkbox1.png",
                                    scale: 2.0,
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  '${category.name} (${category.itemCount})',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
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