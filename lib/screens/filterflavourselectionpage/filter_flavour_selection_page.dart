import 'package:flutter/material.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    required this.color
  });
}

class FlavourSelectionPage extends StatefulWidget {
  const FlavourSelectionPage({Key? key}) : super(key: key);

  @override
  State<FlavourSelectionPage> createState() => _FlavourSelectionPageState();
}

class _FlavourSelectionPageState extends State<FlavourSelectionPage> {
  late SharedPreferences _prefs;
  List<Category> size = [
    Category(name: 'Berry ', itemCount: 20,color: Color(0xFFFF7427)),
    Category(name: 'Raspberry', itemCount: 32,color:Colors.black),
    Category(name: 'Strawberry', itemCount: 12,color:Color(0xFFF61313)),

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
    _prefs.getStringList('selectedFlavours');
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
    await _prefs.remove('selectedFlavours');

    // Save selected categories to shared preferences
    final List<String> selectedCategoryNames = size
        .where((category) => category.isSelected)
        .map((category) => category.name)
        .toList();
    await _prefs.setStringList('selectedFlavours', selectedCategoryNames);
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
              title: 'Les saveurs',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.5,
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Column(
                children: List.generate(size.length, (index) {
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
                            ),



                          ],
                        ),
                      ),
                    ),
                  );
                }),
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