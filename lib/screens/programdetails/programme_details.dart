import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass/glass.dart';
import 'package:glossy/glossy.dart';
import 'package:video_player/video_player.dart';

import '../shophomepage/shop_home_page.dart';





class ProgrammeDetails extends StatefulWidget {
  const ProgrammeDetails({super.key});

  @override
  State<ProgrammeDetails> createState() => _ProgrammeDetailsState();
}

class _ProgrammeDetailsState extends State<ProgrammeDetails> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  int _selectedIndex = 0; // Track the selected item
  bool _seeMore = false;

  final List<String> _items = [
    'Semaine 1',
    'Semaine 2',
    'Semaine 3',
    'Semaine 4',
    'Semaine 5',
  ];
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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/workout/www.mp4', // Replace with your video path
    )..initialize().then((_) {
      setState(
              () {}); // Ensure the first frame is shown after the video is initialized
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Color(0xFFF6F6F6),

      body:             Stack(
        children: [

          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child:Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 218,
                      child: Stack(
                        children: [
                          if (_controller.value.isInitialized)
                            Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 218.h,
                                child: VideoPlayer(_controller),
                              ),
                            )
                          else
                            Center(
                              child: CircularProgressIndicator(),
                            ),
                          if (!_isPlaying)
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPlaying = true;
                                    _controller.play();
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),

                                  child: Container(
                                    width: 165,
                                    height: 52,

                                    color:  Colors.white.withOpacity(0.015000000596046448),



                                    child: Center(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 6.0,right: 5),
                                            child: Image.asset("assets/bookmark/icon_play.png",scale: 2.3,),
                                          ),
                                          Text(
                                            'Start Workout',
                                            style: TextStyle(
                                              color: Color(0xFFE88E32),
                                              fontSize: 16,
                                              fontFamily: 'Archivo-Medium',
                                              fontWeight: FontWeight.w500,
                                              height: 1.09,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).asGlass()
    ,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                              padding:  EdgeInsets.only( left: index == 0 ? 18.0 : 2.0, right: 8.0),
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

                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 20),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'Entraînement musculaire du corps',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          _buildContainerBox(
                              'assets/takechallenge/icon_time.png', '30 min'),
                          SizedBox(width: 10), // Add spacing between containers
                          _buildContainerBox(
                              'assets/takechallenge/icon_level.png', 'Intermediate'),

                          SizedBox(width: 10), // Add spacing between containers
                          _buildContainerBox(
                              'assets/takechallenge/icon_flame.png', '247 cal'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 20),
                      child: Text(
                        'Warming Up',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4, // Number of items in the list
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 12),
                              width: MediaQuery.of(context).size.width,
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
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFCACDD2),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(4)),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                          strokeAlign: BorderSide.strokeAlignCenter,
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
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 20),
                      child: Text(
                        'Training',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _seeMore ? _items.length : 3,
                          // Show all items or only the first three
                          itemBuilder: (BuildContext context, int index) {
                            double? opacity = 1;
                            BoxDecoration? decoration;
                            if (!_seeMore && index == 2) {
                              opacity != 0.1;
                              decoration = BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.00, -1.00),
                                  end: Alignment(0, 1),
                                  colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white.withOpacity(0.87),
                                    Colors.white,
                                  ],
                                ),
                              );
                            }
                            return Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: decoration,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFCACDD2),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
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
                                                    _items[index],
                                                    style: TextStyle(
                                                      color: Color(0xFF334155),
                                                      fontSize: 16,
                                                      fontFamily: 'Archivo-Medium',
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    '00:20',
                                                    style: TextStyle(
                                                      color: Color(0xFF66758C),
                                                      fontSize: 16,
                                                      fontFamily: 'Archivo-Medium',
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.5,
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
                                        width: MediaQuery.of(context).size.width,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              width: 1,
                                              color: Color(0xFFE5E7EB),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (!_seeMore && index == 2)
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment(0.00, -1.00),
                                        end: Alignment(0, 1),
                                        colors: [
                                          Colors.white.withOpacity(0),
                                          Colors.white.withOpacity(0.87),
                                          Colors.white,
                                        ],
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _seeMore = true;
                                        });
                                      },
                                      child: Text(
                                        'Voir tout',
                                        style: TextStyle(
                                          color: Color(0xFFFF4343),
                                          fontSize: 14,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.11,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0,top: 40),
                      child: Text(
                        'Up Next',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),

                    Container(
                      child: ListView.builder(
                        itemCount: 2, // Replace with your item count
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,

                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
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
                                    padding: const EdgeInsets.only(left: 22.0,right: 75,bottom: 22),
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
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 35),


                    Padding(
                      padding: const EdgeInsets.only(left: 22.0,right: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Equipment Needed',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 16,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                          Text(
                            '5 Items',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 12,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ],
                      ),
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
                            padding: const EdgeInsets.only(right: 2.0,left: 20),
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

                    const SizedBox(height: 150),

                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 97,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
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
                    SizedBox(width: MediaQuery.of(context).size.width /3.5),
                    Text(
                      'Ventre plat',
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
          ),

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

  Widget _buildContainerBox(String imgPath, String title) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: Color(0xFFE5E7EB), // Add the desired color here
        borderRadius: BorderRadius.circular(5), // Add border radius if needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
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


