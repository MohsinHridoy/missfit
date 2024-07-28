import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';

import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';

class Category {
  final String name;
  final int itemCount;
  bool isSelected;
  final Color color;

  Category({
    required this.name,
    required this.itemCount,
    this.isSelected = false,
    required this.color,
  });
}

class DiscountSelectionPage extends StatefulWidget {
  const DiscountSelectionPage({Key? key}) : super(key: key);

  @override
  State<DiscountSelectionPage> createState() => _DiscountSelectionPageState();
}

class _DiscountSelectionPageState extends State<DiscountSelectionPage> {
  late SharedPreferences _prefs;
  List<Category> size = [
    Category(name: '5 %', itemCount: 20, color: Color(0xFFFF7427)),
    Category(name: '10 %', itemCount: 32, color: Colors.black),
    Category(name: '15 %', itemCount: 12, color: Color(0xFFF61313)),
    Category(name: '20 %', itemCount: 12, color: Color(0xFFF61313)),
  ];

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    final List<String>? selectedCategoryNames = _prefs.getStringList('selectedDiscount');
    if (selectedCategoryNames != null) {
      setState(() {
        for (var category in size) {
          category.isSelected = selectedCategoryNames.contains(category.name);
        }
      });
      // Print all the saved items
      print('Saved categories: $selectedCategoryNames');
    }
  }

  Future<void> _saveSelectedCategories() async {
    final List<String> selectedCategoryNames = size
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    await _prefs.setStringList('selectedDiscount', selectedCategoryNames);
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
            CustomAppBar(
              title: 'Rabais',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.1,
            ),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: size.length,
                padding: EdgeInsets.zero,

                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final category = size[index];
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  _saveSelectedCategories();
                },
                child: customButtonRed(context, 'Appliquer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
