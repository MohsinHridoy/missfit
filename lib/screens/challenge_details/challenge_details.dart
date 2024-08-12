import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:glossy/glossy.dart';
import 'package:miss_fit/screens/programdetails/programme_details.dart';
import 'package:miss_fit/screens/wishlist/wish_list_screen.dart';

import '../../common_utils.dart';
import '../../widgets/programme_bottom_sheet_content.dart';
import '../shophomepage/shop_home_page.dart';
import '../wishlist/wishlist_screen.dart';
import '../workout_viewer_screen/workout_viewer_screen-test_002.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/programdetails/programme_details.dart';
import 'package:miss_fit/screens/wishlist/wish_list_screen.dart';

import '../../common_utils.dart';
import '../shophomepage/shop_home_page.dart';
import '../wishlist/wishlist_screen.dart';
import '../workout_viewer_screen/workout_viewer_screen-test_002.dart';

class ChallengesDetails extends StatefulWidget {
  String? status;
  // ChallengesDetails({Key? key}) : super(key: key,this.status);
  ChallengesDetails({super.key,this.status});

  @override
  State<ChallengesDetails> createState() => _ChallengesDetailsState();
}

class _ChallengesDetailsState extends State<ChallengesDetails> {
  bool isFavourite=false;
  bool isButtonVisible=true;
  final List<String> _items = [
    'Semaine 1',
    'Semaine 2',
    'Semaine 3',
    'Semaine 4',
    'Semaine 5',
  ];
  int _selectedIndex = 0; // Track the selected item

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

  final List<String> chipitems = [
    'Bodyweight',
    'Lower Body-Focused',
    'Muscle & Strength',
    'Low to High Intensity',
    'Bodyweight',
  ];
  late ScrollController _controller;
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      setState(() {
        isVisible = false;
      });
    } else if (_controller.position.userScrollDirection == ScrollDirection.forward) {
      setState(() {
        isVisible = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _controller,

            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/takechallenge/img_challenge_items2.png',
                    width: 515,
                    height: 444,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 400), // Adjust top margin to fit the image height
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40), // Adjust the radius as needed
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 23.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 45),
                          child: Text(
                            'Torcher de calories',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 24,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                            45), // Add some spacing between text and containers
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Row(
                            children: [
                              _buildContainerBox( 'assets/takechallenge/icon_time.png','30 min'),
                              SizedBox(width: 10), // Add spacing between containers
                              _buildContainerBox( 'assets/takechallenge/icon_level.png','Intermédiaire'),

                              SizedBox(width: 10), // Add spacing between containers
                              _buildContainerBox( 'assets/takechallenge/icon_flame.png','247 cal'),

                            ],
                          ),
                        ),
                        SizedBox(
                            height:
                            35), // Add some spacing between text and containers
                        Text(
                          'Aperçu',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          width: 320,
                          child: Text(
                            'Lorem ipsum dolor sit amet consectetur. Vitae mauris pretium neque volutpat. Gravida in sed nulla lectus. Risus et mauris eget sed cum dui quam mattis porta. In eget molestie eu ut.',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 14,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(
                            height:
                            35.h), // Add some spacing between text and containers

                        if(widget.status!='followprogramme')
                        Text(
                          'Des exercices',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        SizedBox(
                            height:
                            5.h),
                        if(widget.status!='followprogramme')

                          Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4, // Number of items in the list
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 12),
                                width: 320,
                                height: 80,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFF6B7280),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(4)),
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Container(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Jumping Jack',
                                                  style: TextStyle(
                                                    color: Color(0xFF334155),
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.09,
                                                  ),
                                                ),
                                                const SizedBox(height: 33),
                                                Text(
                                                  '00:20',
                                                  style: TextStyle(
                                                    color: Color(0xFF66758C),
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.09,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      width: 365,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                            color: Color(0xFFE5E7EB),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                            height:
                            35), // Add some spacing between text and containers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Équipement nécessaire',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text(
                                '5 Items',
                                style: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 12,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 172,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFE5E7EB),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Center(
                                        child: Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  items[index].image),
                                              // Change this to the appropriate asset image
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        items[index].title,
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 14,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          height: 1.2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                            height:
                            35), // Add some spacing between text and containers
                        Text(
                          "Secteur d'intérêt",
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                        SizedBox(height: 35),

                        Container(
                          width: 320.h,
                          child: Wrap(
                            spacing: 10.0, // space between items horizontally
                            children: chipitems.map((chipitems) {
                              return SizedBox(

                                child: Chip(
                                  backgroundColor: Color(0xFFE5E7EB),
                                  shape:  RoundedRectangleBorder(
                                      side: BorderSide(style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  label: Text(
                                    chipitems,
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 12,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height:
                                      1.12,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),


                        SizedBox(height: 50),

                        Container(
                          width: 320,
                          height: 128,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Résultat attendu',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 320,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Image.asset(
                                                'assets/takechallenge/icon_tikmark.png'),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: SizedBox(
                                                child: Text(
                                                  'Stronger and explosive lower body',
                                                  style: TextStyle(
                                                    color: Color(0xFF475569),
                                                    fontSize: 14,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      width: 320,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Image.asset(
                                                'assets/takechallenge/icon_tikmark.png'),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: SizedBox(
                                                child: Text(
                                                  'Better body Balance',
                                                  style: TextStyle(
                                                    color: Color(0xFF475569),
                                                    fontSize: 14,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      width: 320,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Image.asset(
                                                'assets/takechallenge/icon_tikmark.png'),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: SizedBox(
                                                child: Text(
                                                  'Athlete-like physique',
                                                  style: TextStyle(
                                                    color: Color(0xFF475569),
                                                    fontSize: 14,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        if(widget.status=='followprogramme')
                          Padding(
                            padding: const EdgeInsets.only(top: 25.0),
                            child: Text(
                              'Plan de temps de formation',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                        SizedBox(height: 30,),
                        if(widget.status=='followprogramme')
                          Container(
                            height: 40, // Adjust the height as needed
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _items.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                                    child: Container(
                                      width: 105,
                                      decoration: ShapeDecoration(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            color:  _selectedIndex == index
                                                ?  Color(0xFFFFA142):Color(0xFFE5E7EB),
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _items[index],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color:_selectedIndex == index
                                                ?Color(0xFFE88E32): Color(0xFF334155),
                                            fontSize: 16,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height:
                                            1.09, // Adjusted the height for proper text rendering
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        if(widget.status=='followprogramme')

                          Container(
                            child: ListView.builder(
                              itemCount: 3, // Replace with your item count
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,

                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      navigateToNextPage(context,ProgrammeDetails());

                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20.0,bottom: 20),
                                      child: Container(
                                        color: Colors.white,

                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: 147,

                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),                          child: Image.asset(
                                                'assets/takechallenge/programme_image_items.png',
                                                fit: BoxFit.cover,
                                              ),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 22.0,top: 8),
                                              child: SizedBox(
                                                width: 256,
                                                child: Text(
                                                  'Entraînement musculaire du corps',
                                                  style: TextStyle(
                                                    color: Color(0xFF334155),
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.09,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 22.0,right: 50,bottom: 22),
                                              child: Row(
                                                children: [
                                                  _buildLabelWithIcon(
                                                      'assets/takechallenge/icon_level.png',
                                                      'Intermediate'),
                                                  Expanded(
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 20.0),
                                                      child: _buildLabelWithIcon(
                                                          'assets/takechallenge/icon_time.png', '25 min'),
                                                    ),
                                                  ),
                                                  _buildLabelWithIcon(
                                                      'assets/takechallenge/icon_flame.png', '247 cal'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        SizedBox(height: 8),

                        Container(
                          width: 320,
                          height: 128,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Des lignes directrices',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.09,
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: 365,
                                child: Text(
                                  'Lorem ipsum dolor sit amet consectetur. Vitae mauris pretium neque volutpat. Gravida in sed nulla lectus. Dictumst enim ullorper ida libero maecenas lobortis vitae. Risus et mauris eget sed cum dui quam mattis porta.',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.h),

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 500), // Adjust the duration as needed
                    opacity: isVisible ? 1.0 : 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print("Some things");
                            Navigator.pop(context);

                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05000000074505806),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/cart/icon_left_arrow.png",
                                color: Colors.white,
                                scale: 2,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            // print("Some things");
                            // Navigator.pop(context);

                            setState(() {
                              isFavourite=!isFavourite;

                            });
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05000000074505806),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Image.asset(
                                isFavourite==true ?"assets/shophome/icon_bookmark_fill.png": "assets/shophome/icon_bookmark.png",
                                scale: 2,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            bottom: 0,
            child: Visibility(
              visible: isButtonVisible,
              child: GlossyContainer(
                width: MediaQuery.of(context).size.width,
                  blendMode: BlendMode.srcATop,
                // opacity:0.1,
                color: Colors.white.withOpacity(0.04),
                height: 88,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10,right: 15,left: 15),
                    // Added bottom padding
                    child: GestureDetector(
                      onTap: (){
                        // navigateToNextPage(context,ChallengeScreen());
                        if(widget.status!='followprogramme')
                          navigateToNextPage(context,ChallengeScreen());
                        else
                          showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheetContent(
                            onContinue: () {
                              // Your callback logic here
                              setState(() {
                                isButtonVisible=false;
                              });
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 52,

                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child:  Text(
                            'Commencez maintenant',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.09,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
  Widget _buildLabelWithIcon(String assetPath, String label) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF66758C),
            fontSize: 14,
            fontFamily: 'Archivo-Regular',
            fontWeight: FontWeight.w400,
            height: 1.2,
          ),
        ),
      ],
    );
  }

  Widget _buildContainerBox(String imgPath,String title) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: Color(0xFFE5E7EB), // Add the desired color here
        borderRadius: BorderRadius.circular(5), // Add border radius if needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Image.asset(
                  imgPath), // Replace 'assets/missfit/logo2_img.png' with your image path
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 12,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 1.12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}