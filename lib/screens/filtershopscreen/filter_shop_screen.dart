import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/filterbrandsselectionpage/brandsselectionpage.dart';
import 'package:miss_fit/screens/filterdiscountselectionpage/filter_discount_selection_page.dart';
import 'package:miss_fit/screens/filterflavourselectionpage/filter_flavour_selection_page.dart';
import 'package:miss_fit/screens/filterreviewselectionpage/review_selection_page.dart';
import 'package:miss_fit/screens/filtersizeselectionpage/size_selection_page.dart';
import 'package:miss_fit/screens/filtersortscreenpage/filter_sort_screen_page.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';
import '../../widgets/custom_app_bar.dart';
import '../colourselectionpage/colour_selection_page.dart';
import '../filtercategoryselectionpage/categoryselectionpage.dart';
import '../filtermeasurementselectionpage/filter_measurements_selection_page.dart';
import '../shoppage/shop_page.dart';

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
      backgroundColor:Color(0xFFF6F6F6) ,
      body: Column(
        children: [

          CustomAppBar(
            title: 'Filtre',
            onBackTap: () {
              navigateToNextPage(context,AllItemsShopPage(status: 'filter',));
            },
            iconSpacing: 2.9,
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
                        'Trier par',
                        _fetchSort.isNotEmpty ? '${_fetchSort[0]}' : '',
                        SortByPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Catégorie',
                        _fetchCategories.isNotEmpty
                            ? '${_fetchCategories[0]}, ${_fetchCategories.length > 1 ? _fetchCategories[1] : ''}...+${_fetchCategories.length}'
                            : 'No categories selected',
                        CategorySelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Marques',
                        _fetchBrands.isNotEmpty
                            ? '${_fetchBrands[0]}, ${_fetchBrands.length > 1 ? _fetchBrands[1] : ''}...+${_fetchBrands.length > 2 ? _fetchBrands.length - 2 : ''}'
                            : 'No Brands selected',
                        BrandsSelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Couleur',
                        _fetchColours.isNotEmpty
                            ? '${_fetchColours[0]}, ${_fetchColours.length > 1 ? _fetchColours[1] : ''}...+${_fetchColours.length > 2 ? _fetchColours.length - 2 : ''}'
                            : '',
                        ColourSelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Taille',
                        _fetchSize.isNotEmpty
                            ? '${_fetchSize[0]}, ${_fetchSize.length > 1 ? _fetchSize[1] : ''}...+${_fetchSize.length > 2 ? _fetchSize.length - 2 : ''}'
                            : '',
                        SizeSelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Notation',
                        _fetchReviews.isNotEmpty
                            ? '${_fetchReviews[0]}, ${_fetchReviews.length > 1 ? _fetchReviews[1] : ''}...+${_fetchReviews.length > 2 ? _fetchReviews.length - 2 : ''}'
                            : '',
                        ReviewSelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'La mesure',
                        _fetchMeasurements.isNotEmpty
                            ? '${_fetchMeasurements[0]}, ${_fetchMeasurements.length > 1 ? _fetchMeasurements[1] : ''}...+${_fetchMeasurements.length > 2 ? _fetchMeasurements.length - 2 : ''}'
                            : '',
                        MeasurementsSelectionPage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: _buildCategorySection(
                        context,
                        'Les saveurs',
                        _fetchFlavour.isNotEmpty
                            ? '${_fetchFlavour[0]}, ${_fetchFlavour.length > 1 ? _fetchFlavour[1] : ''}...+${_fetchFlavour.length > 2 ? _fetchFlavour.length - 2 : ''}'
                            : '',
                        FlavourSelectionPage()
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
                        DiscountSelectionPage()
                    ),
                  ),
                  SizedBox(height: 20),


                  Container(
                    margin: EdgeInsets.only(top: 10, left: 20, right: 20),
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

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildRangeTextItem('${_lowerValue.round()} '),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0,right: 12),
                        child: _buildRangeText('to'),
                      ),
                      _buildRangeTextItem('${_upperValue.round()} ')
                    ],
                  ),
                  SizedBox(height: 45),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:(){
                      setState(() {
                        _fetchSort.clear();
                        _fetchCategories.clear();
                        _fetchBrands.clear();
                      });
                    },
                    child: Container(
                      height: 44,

                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Tout effacer',
                          style: TextStyle(
                            color: Color(0xFFFF4343),
                            fontSize: 14,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: GestureDetector(
                    onTap: () {


                      navigateToNextPage(context,AllItemsShopPage(status: 'filter',));

                    },
                    child: Container(
                      height: 44,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          'Appliquer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.10,
                          ),
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
    );
  }

  Widget _buildCategorySection(
      BuildContext context, String title, String subtitle, Widget page) {
    return GestureDetector(
      onTap: (){
        navigateToNextPage(context,page);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 1.09,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 16,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0.5,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              ),
            ),

            buildDivider(context)

          ],
        ),
      ),
    );
  }

  Widget _buildRangeTextItem(String text) {
    return Container(
      width: 130,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
              height: 1.09,
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
        fontFamily: 'Archivo-Regular',
        fontWeight: FontWeight.w400,
        height: 1.09,
      ),
    );
  }
}
