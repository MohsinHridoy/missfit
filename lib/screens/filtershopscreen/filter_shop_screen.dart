import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:miss_fit/screens/filterbrandsselectionpage/brandsselectionpage.dart';
import 'package:miss_fit/screens/filterdiscountselectionpage/filter_discount_selection_page.dart';
import 'package:miss_fit/screens/filterflavourselectionpage/filter_flavour_selection_page.dart';
import 'package:miss_fit/screens/filterreviewselectionpage/review_selection_page.dart';
import 'package:miss_fit/screens/filtersizeselectionpage/size_selection_page.dart';
import 'package:miss_fit/screens/filtersortscreenpage/filter_sort_screen_page.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colourselectionpage/colour_selection_page.dart';
import '../filtercategoryselectionpage/categoryselectionpage.dart';
import '../filtermeasurementselectionpage/filter_measurements_selection_page.dart';

class FilterShopScreen extends StatefulWidget {
  const FilterShopScreen({Key? key}) : super(key: key);

  @override
  State<FilterShopScreen> createState() => _FilterShopScreenState();
}

class _FilterShopScreenState extends State<FilterShopScreen> {
  double minValue = 0; // Initial minimum value
  double maxValue = 3000; // Initial maximum value
  double knobSize = 22; // Width and height of draggable knob

  double _lowerValue = 0;
  double _upperValue = 3000;
  late SharedPreferences _prefs;
  List<String> _fetchCategories = [];
  List<String> _fetchSort = [];
  List<String> _fetchBrands = [];
  List<String> _fetchReviews = [];
  List<String> _fetchSize = [];
  List<String> _fetchMeasurements = [];
  List<String> _fetchFlavour = [];
  List<String> _fetchDiscounts = [];
  List<String> _fetchColours = [];

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

    _fetchBrands = _prefs.getStringList('selectedBrands')!;
    if (_fetchBrands != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchBrands');
      setState(() {});
    }

    _fetchReviews = _prefs.getStringList('selectedReview')!;
    if (_fetchReviews != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchBrands');
      setState(() {});
    }

    _fetchSize = _prefs.getStringList('selectedSize')!;
    if (_fetchSize != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchSize');
      setState(() {});
    }

    _fetchMeasurements = _prefs.getStringList('selectedMeasurements')!;
    if (_fetchMeasurements != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchMeasurements');
      setState(() {});
    }

    _fetchFlavour = _prefs.getStringList('selectedFlavours')!;
    if (_fetchFlavour != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchFlavour');
      setState(() {});
    }
    _fetchDiscounts = _prefs.getStringList('selectedDiscount')!;
    if (_fetchDiscounts != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchDiscounts');
      setState(() {});
    }
    _fetchColours = _prefs.getStringList('selectedColours')!;
    if (_fetchColours != null) {
      // Print all the saved items
      print('Saved selectedSort: $_fetchColours');
      setState(() {});
    }
  }

  // void _updatePosition(DragUpdateDetails details, bool isMin) {
  //   double screenWidth = MediaQuery.of(context).size.width;
  //   double posValue =
  //       ((details.globalPosition.dx - knobSize / 2) / screenWidth * 3000)
  //           .clamp(0, 3000);
  //   setState(() {
  //     if (isMin) {
  //       minValue = posValue.clamp(0, maxValue - 1);
  //     } else {
  //       maxValue = posValue.clamp(minValue + 1, 3000);
  //     }
  //   });
  // }
  void _updatePosition(DragUpdateDetails details, bool isMin) {
    double screenWidth = MediaQuery.of(context).size.width;
    double posValue =
    ((details.globalPosition.dx - knobSize / 2) / screenWidth * 3000)
        .clamp(0, 3000);

    double minValueClamp = 0;
    double maxValueClamp = 3000;

    if (!isMin) {
      // For the max knob
      if (minValue < 2990 && posValue > minValue && posValue < minValue + 10) {
        // If min is at 2990 and posValue goes past it
        posValue = 2990;
      }
      if (minValue > 2990 && posValue > minValue && posValue < minValue + 10) {
        // If min is past 2990 and posValue goes past it
        posValue = 10;
      }
      if (minValue < 10 && posValue < minValue && posValue > minValue - 10) {
        // If min is at 0 and posValue goes past it
        posValue = 2990;
      }
      if (minValue > 10 && posValue < minValue && posValue > minValue - 10) {
        // If min is past 0 and posValue goes past it
        posValue = 0;
      }

      minValueClamp = 0;
      maxValueClamp = 2990;
    } else {
      // For the min knob
      if (maxValue < 2990 && posValue > maxValue - 10 && posValue < maxValue) {
        // If max is at 2990 and posValue goes past it
        posValue = 2990;
      }
      if (maxValue > 2990 && posValue > maxValue - 10 && posValue < maxValue) {
        // If max is past 2990 and posValue goes past it
        posValue = 0;
      }
      if (maxValue < 10 && posValue < maxValue && posValue > maxValue - 10) {
        // If max is at 0 and posValue goes past it
        posValue = 2990;
      }
      if (maxValue > 10 && posValue < maxValue && posValue > maxValue - 10) {
        // If max is past 0 and posValue goes past it
        posValue = 0;
      }

      minValueClamp = 0;
      maxValueClamp = 3000;
    }

    setState(() {
      if (isMin) {
        minValue = posValue.clamp(minValueClamp, maxValue - 10);
      } else {
        maxValue = posValue.clamp(minValue + 10, maxValueClamp);
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
                      SizedBox(width: MediaQuery.of(context).size.width / 2.9),
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

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
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
                          _fetchBrands.isNotEmpty
                              ? '${_fetchBrands[0]}, ${_fetchBrands.length > 1 ? _fetchBrands[1] : ''}...+${_fetchBrands.length > 2 ? _fetchBrands.length - 2 : ''}'
                              : 'No Brands selected',
                          () {
                            // Navigate to the brands selection page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BrandsSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Color',
                          _fetchColours.isNotEmpty
                              ? '${_fetchColours[0]}, ${_fetchColours.length > 1 ? _fetchColours[1] : ''}...+${_fetchColours.length > 2 ? _fetchColours.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the category selection page
                            // _navigateToPage(context, CategorySelectionPage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ColourSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Size',
                          _fetchSize.isNotEmpty
                              ? '${_fetchSize[0]}, ${_fetchSize.length > 1 ? _fetchSize[1] : ''}...+${_fetchSize.length > 2 ? _fetchSize.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the category selection page
                            // _navigateToPage(context, CategorySelectionPage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SizeSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Rating',
                          _fetchReviews.isNotEmpty
                              ? '${_fetchReviews[0]}, ${_fetchReviews.length > 1 ? _fetchReviews[1] : ''}...+${_fetchReviews.length > 2 ? _fetchReviews.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the sort by page or any other appropriate page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReviewSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Mesurements',
                          _fetchMeasurements.isNotEmpty
                              ? '${_fetchMeasurements[0]}, ${_fetchMeasurements.length > 1 ? _fetchMeasurements[1] : ''}...+${_fetchMeasurements.length > 2 ? _fetchMeasurements.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the category selection page
                            // _navigateToPage(context, CategorySelectionPage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MeasurementsSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Flavours',
                          _fetchFlavour.isNotEmpty
                              ? '${_fetchFlavour[0]}, ${_fetchFlavour.length > 1 ? _fetchFlavour[1] : ''}...+${_fetchFlavour.length > 2 ? _fetchFlavour.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the category selection page
                            // _navigateToPage(context, CategorySelectionPage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FlavourSelectionPage()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildCategorySection(
                          context,
                          'Discounts',
                          _fetchDiscounts.isNotEmpty
                              ? '${_fetchDiscounts[0]}, ${_fetchDiscounts.length > 1 ? _fetchDiscounts[1] : ''}...+${_fetchDiscounts.length > 2 ? _fetchDiscounts.length - 2 : ''}'
                              : '',
                          () {
                            // Navigate to the category selection page
                            // _navigateToPage(context, CategorySelectionPage());
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DiscountSelectionPage()),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),


                      Container(
                        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                        alignment: Alignment.centerLeft,
                        child: FlutterSlider(
                          values: [_lowerValue, _upperValue],
                          rangeSlider: true,
                          max: 3000,
                          min: 0,
                          jump: true,
                          trackBar: FlutterSliderTrackBar(
                            activeTrackBarHeight: 3,
                            activeTrackBar: BoxDecoration(color: Color(0xFF22C55E)),
                          ),
                          tooltip: FlutterSliderTooltip(
                              textStyle: TextStyle(fontSize: 17, color: Colors.transparent),
                              boxStyle: FlutterSliderTooltipBox(
                                  decoration: BoxDecoration(
                                      color: Colors.transparent
                                  )
                              )
                          ),
                          handler: FlutterSliderHandler(
                            decoration: BoxDecoration(),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Color(0xFF22C55E), width: 2),


                              ),
                              padding: EdgeInsets.all(3),
                              child: Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: Color(0xFF22C55E),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          ),
                          rightHandler: FlutterSliderHandler(

                            decoration: BoxDecoration(),
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Color(0xFF22C55E), width: 2),


                              ),
                              padding: EdgeInsets.all(3),
                              child: Container(
                                height: 18,
                                width: 18,
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Color(0xFF22C55E),
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                          ),
                          disabled: false,
                          onDragging: (handlerIndex, lowerValue, upperValue) {
                            setState(() {
                              _lowerValue = lowerValue;
                              _upperValue = upperValue;

                              print(_lowerValue);
                            });
                          },
                        ),
                      ),


                      // SizedBox(
                      //   width: screenWidth,
                      //   height: 50,
                      //   child: Stack(
                      //     children: [
                      //       Positioned(
                      //         top: 8,
                      //         left: minLeft + 50,
                      //         right: screenWidth - maxLeft + 70,
                      //         child: Container(
                      //           height: 5,
                      //           color: Color(0xFF22C55E),
                      //         ),
                      //       ),
                      //       Positioned(
                      //         left: minLeft + 30,
                      //         child: GestureDetector(
                      //           onHorizontalDragUpdate: (details) {
                      //             _updatePosition(details, true);
                      //           },
                      //           child: Container(
                      //             width: knobSize,
                      //             height: knobSize,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(knobSize / 2),
                      //             ),
                      //             child:
                      //                 Image.asset("assets/order/icon_range_slider.png"),
                      //           ),
                      //         ),
                      //       ),
                      //       Positioned(
                      //         left: maxLeft - knobSize - 50,
                      //         // Adjust for container width
                      //         child: GestureDetector(
                      //           onHorizontalDragUpdate: (details) {
                      //             _updatePosition(details, false);
                      //           },
                      //           child: Container(
                      //             width: knobSize,
                      //             height: knobSize,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(knobSize / 2),
                      //             ),
                      //             child:
                      //                 Image.asset("assets/order/icon_range_slider.png"),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    // SizedBox(
                    //   width: screenWidth,
                    //   height: 50,
                    //   child: Stack(
                    //     children: [
                    //       Positioned(
                    //         top: 8,
                    //         left: min(max(0, minLeft + 50), screenWidth - 140), // Adjusted to prevent going out of screen
                    //         right: max(0, screenWidth - maxLeft + 70),
                    //         child: Container(
                    //           height: 5,
                    //           color: Color(0xFF22C55E),
                    //         ),
                    //       ),
                    //       Positioned(
                    //         left: min(max(0, minLeft + 30), screenWidth - 80), // Adjusted to prevent going out of screen
                    //         child: GestureDetector(
                    //           onHorizontalDragUpdate: (details) {
                    //             _updatePosition(details, true);
                    //           },
                    //           child: Container(
                    //             width: knobSize,
                    //             height: knobSize,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(knobSize / 2),
                    //             ),
                    //             child: Image.asset("assets/order/icon_range_slider.png"),
                    //           ),
                    //         ),
                    //       ),
                    //       Positioned(
                    //         left: min(max(0, maxLeft - knobSize - 50), screenWidth - 80), // Adjusted to prevent going out of screen
                    //         // Adjust for container width
                    //         child: GestureDetector(
                    //           onHorizontalDragUpdate: (details) {
                    //             _updatePosition(details, false);
                    //           },
                    //           child: Container(
                    //             width: knobSize,
                    //             height: knobSize,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(knobSize / 2),
                    //             ),
                    //             child: Image.asset("assets/order/icon_range_slider.png"),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    //   Container(
                    //     margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                    //     alignment: Alignment.centerLeft,
                    //     child: FlutterSlider(
                    //       values: [_lowerValue, _upperValue],
                    //       rangeSlider: true,
                    //       max: 3000,
                    //       min: 0,
                    //       jump: true,
                    //       trackBar: FlutterSliderTrackBar(
                    //         activeTrackBarHeight: 3,
                    //         activeTrackBar: BoxDecoration(color: Color(0xFF22C55E)),
                    //       ),
                    //       tooltip: FlutterSliderTooltip(
                    //           textStyle: TextStyle(fontSize: 17, color: Colors.transparent),
                    //           boxStyle: FlutterSliderTooltipBox(
                    //               decoration: BoxDecoration(
                    //                   color: Colors.transparent
                    //               )
                    //           )
                    //       ),
                    //       handler: FlutterSliderHandler(
                    //         decoration: BoxDecoration(),
                    //         child: Container(
                    //           height: 25,
                    //           width: 25,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(25),
                    //             border: Border.all(color: Color(0xFF22C55E), width: 2),
                    //
                    //
                    //           ),
                    //           padding: EdgeInsets.all(3),
                    //           child: Container(
                    //             height: 18,
                    //             width: 18,
                    //             decoration: BoxDecoration(
                    //                 color: Color(0xFF22C55E),
                    //                 borderRadius: BorderRadius.circular(25)),
                    //           ),
                    //         ),
                    //       ),
                    //       rightHandler: FlutterSliderHandler(
                    //
                    //         decoration: BoxDecoration(),
                    //         child: Container(
                    //           height: 25,
                    //           width: 25,
                    //           decoration: BoxDecoration(
                    //             color: Colors.white,
                    //             borderRadius: BorderRadius.circular(25),
                    //             border: Border.all(color: Color(0xFF22C55E), width: 2),
                    //
                    //
                    //           ),
                    //           padding: EdgeInsets.all(3),
                    //           child: Container(
                    //             height: 18,
                    //             width: 18,
                    //             padding: EdgeInsets.all(3),
                    //             decoration: BoxDecoration(
                    //                 color: Color(0xFF22C55E),
                    //                 borderRadius: BorderRadius.circular(25)),
                    //           ),
                    //         ),
                    //       ),
                    //       disabled: false,
                    //       onDragging: (handlerIndex, lowerValue, upperValue) {
                    //         setState(() {
                    //           _lowerValue = lowerValue;
                    //           _upperValue = upperValue;
                    //
                    //           print(_lowerValue);
                    //         });
                    //       },
                    //     ),
                    //   ),


                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildRangeTextItem('${_lowerValue.round()} '),
                          _buildRangeText('to'),
                          _buildRangeTextItem('${_upperValue.round()} ')
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              height: 44,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 17),
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
                              onTap: () {
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
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
            padding: const EdgeInsets.only(top: 15.0, bottom: 15),
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
