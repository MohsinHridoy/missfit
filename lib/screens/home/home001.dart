import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miss_fit/widgets/circular_progress_bar.dart';

class WorkoutItem {
  final String imagePath;
  final String title;
  final String duration;
  final String category;

  WorkoutItem({
    required this.imagePath,
    required this.title,
    required this.duration,
    required this.category,
  });
}

class BlogItem {
  final String imagePath;
  final String title;
  final String dateAndTime;
  final String category;

  BlogItem({
    required this.imagePath,
    required this.title,
    required this.dateAndTime,
    required this.category,
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double progressPercentage = 0.7;
  List<WorkoutItem> workoutItems = [
    WorkoutItem(
      imagePath: 'assets/home/img_workout_item_1.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_workout_item_2.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_workout_item_1.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_workout_item_2.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_workout_item_2.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    // Add more WorkoutItem objects as needed
  ];

  List<BlogItem> blogItems = [
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Calorie torcher',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Calorie torcher',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Calorie torcher',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Calorie torcher',
      dateAndTime: '02 Fév',
      category: 'Full body',
    )

    // Add more WorkoutItem objects as needed
  ];

  int _currentPage = 0; // Track the current page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color:  Color(0xFFF6F6F6),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  _build_Plan_Status(),
                  Container(
                    width: 373,
                    height: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/home/img_take_challenge.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Text(
                          'Take a Challenge',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Kanit',
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                        Text(
                          '12 Challenges',
                          style: TextStyle(
                            color: Color(0xFFF3F4F6),
                            fontSize: 12,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        )
                      ],
                    ),
                  ),
                  _buildActivityItem(),
                  _textTitle('New Workout'),
                  _buildListWorkOutItem(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textTitle('Latest Blog'),
                      Text(
                        'View all',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFFF4343),
                          fontSize: 14,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w500,
                          height: 1.11,
                        ),
                      )
                    ],
                  ),
                  _buildBlogItem(),
                  _buildBlogIndicatorItem(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _textTitle('Latest Blog'),
                      Text(
                        'View all',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFFFF4343),
                          fontSize: 14,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w500,
                          height: 1.11,
                        ),
                      )
                    ],
                  ),
                  _buildListSubcribeItem(),

                  SizedBox(height: 150,)
                ],
              ),
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.15,
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.05),
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(15),
          //       bottomRight: Radius.circular(15),
          //     ),
          //     border: Border(
          //       left: BorderSide(
          //         color: Colors.white.withOpacity(0.11),
          //       ),
          //       top: BorderSide(
          //         color: Colors.white.withOpacity(0.11),
          //       ),
          //       right: BorderSide(
          //         color: Colors.white.withOpacity(0.11),
          //       ),
          //       bottom: BorderSide(
          //         width: 1,
          //         color: Colors.white.withOpacity(0.11),
          //       ),
          //     ),
          //   ),
          //
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.15,
          //     color: Colors.white,
          //
          //
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(
          //           sigmaX: 5, sigmaY: 5),
          //       child: Container(),
          //     ),
          //   ),
          // ),


          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height * 0.15,
          //   padding:
          //       const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 12),
          //   clipBehavior: Clip.antiAlias,
          //   decoration: ShapeDecoration(
          //     color: Colors.white.withAlpha(25),
          //     // Set color to transparent
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20),
          //       ),
          //     ),
          //   ),
          //   child: Stack(
          //     children: [
          //       BackdropFilter(
          //         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          //         child: Container(),
          //       ),
          //       Row(
          //         // mainAxisAlignment: MainAxisAlignment.,
          //         children: [
          //           Container(
          //             width: 44,
          //             height: 44,
          //             clipBehavior: Clip.antiAlias,
          //             decoration: ShapeDecoration(
          //               image: DecorationImage(
          //                 image: AssetImage("assets/home/img_profile.png"),
          //                 fit: BoxFit.fill,
          //               ),
          //               shape: RoundedRectangleBorder(
          //                 side: BorderSide(
          //                   width: 1,
          //                   strokeAlign: BorderSide.strokeAlignOutside,
          //                   color: Color(0x7FFF4343),
          //                 ),
          //                 borderRadius: BorderRadius.circular(4),
          //               ),
          //             ),
          //           ),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               SizedBox(
          //                 height: 40,
          //               ),
          //               Text(
          //                 'Hi 💪🏻',
          //                 style: TextStyle(
          //                   color: Color(0xFF334155),
          //                   fontSize: 12,
          //                   fontFamily: 'Archivo',
          //                   fontWeight: FontWeight.w400,
          //                   height: 1.12,
          //                 ),
          //               ),
          //               Text(
          //                 'Helen Hanf',
          //                 style: TextStyle(
          //                   color: Color(0xFF334155),
          //                   fontSize: 18,
          //                   fontFamily: 'Archivo',
          //                   fontWeight: FontWeight.w500,
          //                   height: 1.08,
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Image.asset(
          //             "assets/home/icon_notifications.png",
          //             width: 24,
          //             height: 24,
          //             color:Color(0xFF334155) ,
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            padding:
            const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.10999999940395355),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x21171717),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: -6,
                )
              ],
            ),
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  // child: Container(),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/home/img_profile.png"),
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0x7FFF4343),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Hi 💪🏻',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 12,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            height: 1.12,
                          ),
                        ),
                        Text(
                          'Helen Hanf',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.08,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/home/icon_notifications.png",
                      width: 24,
                      height: 24,
                      color:Color(0xFF334155) ,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListSubcribeItem() {
    return Container(
      height: 235,
      child: ListView.builder(
        itemCount: workoutItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          WorkoutItem item = workoutItems[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 194,
              decoration: ShapeDecoration(
                color: Color(0xFFFF7D45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 155,
                        child: Text(
                          'Paiement annuel en espèces',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            height: 1.06,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Image.asset("assets/home/img_subcribe_girl.png", width: 100, height: 200,),
                ],
              ),
            ),


          );
        },
      ),
    );
  }

  Widget _buildBlogIndicatorItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4, // Assuming there are 4 items in the slider
            (index) => Container(
          width: 14,
          height: 4,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: ShapeDecoration(
            color: index == _currentPage ? Color(0xFFFF4343) : Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlogItem() {
    return Container(
      height: 250,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: blogItems.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page; // Update the current page index
          });
        },
        itemBuilder: (BuildContext context, int index) {
          BlogItem item = blogItems[index];
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              width: 248,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 55,
                        height: 18,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: ShapeDecoration(
                          color: Color(0x21FFF4E4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Beginner',
                            style: TextStyle(
                              color: Color(0xFFFFA142),
                              fontSize: 10,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 248,
                    height: 60,
                    padding: const EdgeInsets.only(
                        top: 10, left: 16, right: 16, bottom: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      // Set color to transparent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(),
                        ),
                        SizedBox(
                          width: 268,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 1.09,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _textTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Kanit',
        fontWeight: FontWeight.w600,
        height: 0.08,
      ),
    );
  }

  Widget _buildListWorkOutItem() {
    return Container(
      height: 235,
      child: ListView.builder(
        itemCount: workoutItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          WorkoutItem item = workoutItems[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 248,
              height: 220,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(item.imagePath),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 55,
                        height: 18,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        decoration: ShapeDecoration(
                          color: Color(0x21FFF4E4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Beginner',
                            style: TextStyle(
                              color: Color(0xFFFFA142),
                              fontSize: 10,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 248,
                    height: 60,
                    padding: const EdgeInsets.only(
                        top: 10, left: 16, right: 16, bottom: 12),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.transparent,
                      // Set color to transparent
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 203,
                              child: Text(
                                item.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
                                  fontWeight: FontWeight.w500,
                                  height: 1.08,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 2,
                                  height: 12,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF4343),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                                Text(
                                  item.duration,
                                  style: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 10,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w400,
                                    height: 0.13,
                                  ),
                                ),
                                Container(
                                  width: 4,
                                  height: 4,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF9CA3AF),
                                    shape: OvalBorder(),
                                  ),
                                ),
                                Text(
                                  item.category,
                                  style: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 10,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w400,
                                    height: 0.13,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActivityItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: activityCard(
              'assets/home/img_workout.png', 'Start a workout', '200 Workouts'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 20),
          child: activityCard('assets/home/img_follow_programme.png',
              'Follow a program', '11 Active programs'),
        )
      ],
    );
  }

  Widget activityCard(String img, String title, String subtitle) {
    return Container(
      width: 180,
      height: 169,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Kanit',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Color(0xFFF3F4F6),
              fontSize: 12,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w400,
              height: 0.11,
            ),
          )
        ],
      ),
    );
  }

  Widget _build_Plan_Status() {
    return Container(
      width: 320,
      height: 85,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.02, 1.00),
          end: Alignment(-0.02, -1),
          colors: [Color(0xFFFF4343), Color(0xFFFF4545)],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'My plan for today!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.w500,
                    height: 1.07,
                  ),
                ),
                Text(
                  '2/5 Completed',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    height: 1.11,
                  ),
                )
              ],
            ),
            Container(
              height: 85,
              width: 100,
              child: Stack(
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size(60, 60),
                      painter: MyCircularProgressPainter(
                        backgroundColor: Color(0xFFDD2E3A),
                        progress: progressPercentage,
                        gradient: LinearGradient(
                          begin: Alignment(0.06, -1.00),
                          end: Alignment(-0.06, 1),
                          colors: [Color(0xFFE9F308), Color(0xFFECE804)],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      '40%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Kanit',
                        fontWeight: FontWeight.w500,
                        height: 0.08,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
