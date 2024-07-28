import 'package:flutter/material.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/common_buttons.dart';

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

class CategoryItem extends StatelessWidget {
  final Category category;
  final ValueChanged<bool> onTap;

  const CategoryItem({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(!category.isSelected);
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
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${category.name} (${category.itemCount})',
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
  }
}

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({Key? key}) : super(key: key);

  @override
  _CategorySelectionPageState createState() =>
      _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage>
    with AutomaticKeepAliveClientMixin<CategorySelectionPage> {
  late SharedPreferences _prefs;
  List<Category> categories = [
    Category(name: 'Gym Equipment', itemCount: 32),
    Category(name: 'Nutrition', itemCount: 26),
    Category(name: 'Outlet', itemCount: 120),
    Category(name: 'Sports Bras', itemCount: 132),
    Category(name: 'Leggings', itemCount: 162),
    Category(name: 'T-Shirt', itemCount: 300),
    Category(name: 'Shorts', itemCount: 80),
    Category(name: 'Sneakers', itemCount: 64),
  ];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Load previously selected categories from shared preferences
    final List<String>? selectedCategoryNames =
    _prefs.getStringList('selectedCategories');
    if (selectedCategoryNames != null) {
      setState(() {
        categories.forEach((category) {
          category.isSelected =
              selectedCategoryNames.contains(category.name);
        });
      });
      // Print all the saved items
      print('Saved categories: $selectedCategoryNames');
    }
  }

  Future<void> _saveSelectedCategories() async {
    // Clear previously saved categories
    await _prefs.remove('selectedCategories');

    // Save selected categories to shared preferences
    final List<String> selectedCategoryNames = categories
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    await _prefs.setStringList('selectedCategories', selectedCategoryNames);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilterShopScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Necessary for AutomaticKeepAliveClientMixin
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
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.4),
                    Text(
                      'Catégorie',
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
            SizedBox(height: 15),
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(categories.length, (index) {
                      final category = categories[index];
                      return CategoryItem(
                        category: category,
                        onTap: (isSelected) {
                          setState(() {
                            category.isSelected = isSelected;
                          });
                        },
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
                  child: customButtonRed(context, 'Appliquer', onPressed: () {
                    _saveSelectedCategories();

                  })              ),
            )
          ],
        ),
      ),
    );
  }
}