import 'package:flutter/material.dart';
import 'package:miss_fit/screens/filtersortscreenpage/filter_sort_screen_page.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../filtercategoryselectionpage/categoryselectionpage.dart';

class FilterShopScreen extends StatefulWidget {
  const FilterShopScreen({Key? key}) : super(key: key);

  @override
  State<FilterShopScreen> createState() => _FilterShopScreenState();
}

class _FilterShopScreenState extends State<FilterShopScreen> {
  double minValue = 0; // Initial minimum value
  double maxValue = 3000; // Initial maximum value
  double knobSize = 22; // Width and height of draggable knob
  late SharedPreferences _prefs;
  List<String> _fetchCategories = [];
  List<String> _fetchSort = [];

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  @override
  void dispose() {
    super.dispose();
    print(_fetchCategories.length);
    print('All categories: $_fetchCategories');
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Load category names from shared preferences
    _fetchCategories = _prefs.getStringList('selectedCategories')!;
    if (_fetchCategories != null) {
      // Print all the saved items
      print('Saved categories: $_fetchCategories');
      setState(() {});
    }

    _fetchSort = _prefs.getStringList('selectedSort')!;
    if (_fetchSort != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchSort');
      setState(() {});
    }
  }

  void _updatePosition(DragUpdateDetails details, bool isMin) {
    double screenWidth = MediaQuery.of(context).size.width;
    double posValue =
        ((details.globalPosition.dx - knobSize / 2) / screenWidth * 3000)
            .clamp(0, 3000);
    setState(() {
      if (isMin) {
        minValue = posValue.clamp(0, maxValue - 1);
      } else {
        maxValue = posValue.clamp(minValue + 1, 3000);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minLeft =
        (screenWidth * (minValue / 3000)).clamp(0, screenWidth - knobSize);
    double maxLeft =
        (screenWidth * (maxValue / 3000)).clamp(knobSize, screenWidth);

    return Scaffold(
      body: Center(
        child: Container(
          color: Color(0xFFF6F6F6),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                        'Filter',
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
             SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Sort By',
                  _fetchSort.isNotEmpty ? '${_fetchSort[0]}' : '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Category',
                  _fetchCategories.isNotEmpty
                      ? '${_fetchCategories[0]}, ${_fetchCategories.length > 1 ? _fetchCategories[1] : ''}...+${_fetchCategories.length}'
                      : 'No categories selected',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategorySelectionPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Brands',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Color',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Size',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Rating',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Mesurements',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Flavours',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: _buildCategorySection(
                  context,
                  'Discounts',
                  '',
                  () {
                    // Navigate to the category selection page
                    // _navigateToPage(context, CategorySelectionPage());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SortByPage()),
                    );
                  },
                ),
              ),
              SizedBox(height: 100),
              SizedBox(
                width: screenWidth,
                height: 50,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: minLeft + 50,
                      right: screenWidth - maxLeft + 70,
                      child: Container(
                        height: 5,
                        color: Color(0xFF22C55E),
                      ),
                    ),
                    Positioned(
                      left: minLeft + 30,
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          _updatePosition(details, true);
                        },
                        child: Container(
                          width: knobSize,
                          height: knobSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(knobSize / 2),
                          ),
                          child:
                              Image.asset("assets/order/icon_range_slider.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      left: maxLeft - knobSize - 50, // Adjust for container width
                      child: GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          _updatePosition(details, false);
                        },
                        child: Container(
                          width: knobSize,
                          height: knobSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(knobSize / 2),
                          ),
                          child:
                              Image.asset("assets/order/icon_range_slider.png"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRangeTextItem('${minValue.round()} '),
                  _buildRangeText('to'),
                  _buildRangeTextItem('${maxValue.round()} ')
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150,
                      height: 44,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Clear All',
                          style: TextStyle(
                            color: Color(0xFFFF4343),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            height: 0.10,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                          // Navigator.push(                        //   context,
                        //   MaterialPageRoute(builder: (context) => SortByPage()),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShopPage()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 44,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Apply',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ),
                    )
                      ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  VoidCallback _navigateToPage(BuildContext context, Widget page) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    };
  }

  Widget _buildCategorySection(
      BuildContext context, String title, String subtitle, VoidCallback onTap) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 5),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 16,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFE5E7EB),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRangeTextItem(String text) {
    return Container(
      width: 117,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50, color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            '\$',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              height: 0.09,
            ),
          ),
          Expanded(child: _buildRangeText(text)),
        ],
      ),
    );
  }

  Widget _buildRangeText(String text) {
    return Text(
      text,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Color(0xFF334155),
        fontSize: 16,
        fontFamily: 'Archivo',
        fontWeight: FontWeight.w400,
        height: 0.09,
      ),
    );
  }
}
