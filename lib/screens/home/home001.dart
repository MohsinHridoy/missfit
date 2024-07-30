import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/allblogitem/all_blog_item.dart';
import 'package:miss_fit/screens/coachbookingscreen/coach_booking_screen.dart';
import 'package:miss_fit/screens/eventdetails/event_details_screen.dart';
import 'package:miss_fit/screens/notifications/notifications.dart';
import 'package:miss_fit/screens/selectservicescreen/select_service_screen.dart';
import 'package:miss_fit/screens/subscription/subscription.dart';
import 'package:miss_fit/screens/takechallenge/take_challenge.dart';
import 'package:miss_fit/widgets/circular_progress_bar.dart';

import '../blogdetails/blog_details.dart';

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

class GroupClass {
  final String imagePath;
  final String title;
  final String duration;
  final String category;

  GroupClass({
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
      imagePath: 'assets/home/img_new_workout.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_new_workout.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_new_workout.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_new_workout.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    // Add more WorkoutItem objects as needed
  ];
  List<WorkoutItem> upcomingEventsItems = [
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    WorkoutItem(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    // Add more WorkoutItem objects as needed
  ];
  List<GroupClass> groupClassItems = [
    GroupClass(
      imagePath: 'assets/home/img_group_class.png',
      title: 'Groupe Classe 01',
      duration: '2h 30min',
      category: 'Full body',
    ),
    GroupClass(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    GroupClass(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    GroupClass(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    GroupClass(
      imagePath: 'assets/home/img_upcoming_event.png',
      title: 'Calorie torcher',
      duration: '2h 30min',
      category: 'Full body',
    ),
    // Add more WorkoutItem objects as needed
  ];

  List<BlogItem> blogItems = [
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title:
          'Mastering Responsive Web Design: Techniques and Business studyBusiness stud',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Mastering Responsive Web Design: Techniques and B...',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Mastering Responsive Web Design: Techniques and B...',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Mastering Responsive Web Design: Techniques and B...',
      dateAndTime: '02 Fév',
      category: 'Full body',
    )
    // Add more WorkoutItem objects as needed
  ];

  List<BlogItem> headerItems = [
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title:
          'Mastering Responsive Web Design: Techniques and Business studyBusiness stud',
      dateAndTime: '02 Fév',
      category: 'Full body',
    ),
    BlogItem(
      imagePath: 'assets/home/img_blog_item.png',
      title: 'Mastering Responsive Web Design: Techniques and B...',
      dateAndTime: '02 Fév',
      category: 'Full body',
    )

    // Add more WorkoutItem objects as needed
  ];

  int _currentPage = 0; // Track the current page index
  int _currentPage1 = 0; // Track the current page index
  ScrollController _scrollController = ScrollController();
  double lastScrollPosition =
      0; // Variable to keep track of last scroll position
  bool isScrollingUp = false;
  bool hasCrossedAboveWhileUp = false; // Track if crossed 60 while going up
  bool isAboveThreshold = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  // Current state above 60 or not

  void _scrollListener() {
    double currentScroll = _scrollController.offset;
    bool isScrollingUp = currentScroll > lastScrollPosition;

    if (currentScroll >= 60 && isScrollingUp) {
      hasCrossedAboveWhileUp = true; // Set flag when scrolling up above 60
    }

    if (currentScroll < 50) {
      hasCrossedAboveWhileUp = false; // Reset flag when dropping below 60
      setState(() {});
    }

    isAboveThreshold =
        currentScroll >= 60; // Update current state above or below threshold

    // Now handle printing logic based on updated flags
    if (isAboveThreshold) {
      if (isScrollingUp) {
        setState(() {});
        print("Above 60: True"); // Print when scrolling up above 60
      } else if (!isScrollingUp && hasCrossedAboveWhileUp) {
        print("Above 60: False"); // Print when scrolling down below 60
      }
    }

    lastScrollPosition =
        currentScroll; // Update last scroll position for next calculation
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFFF6F6F6),
            child: SingleChildScrollView(
              controller: _scrollController, // Set the controller here

              child: Column(
                children: [
                  SizedBox(
                    height: 130.h,
                  ),

                  // _build_Plan_Status(),

                  _buildEventItem(),
                  SizedBox(
                    height: 15,
                  ),
                  _buildEventndicatorItem(),

                  SizedBox(
                    height: 50,
                  ),

                  _textTitle('Sélectionnez une activité'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        navigateToNextPage(context, TakeChallenge());
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(320),
                        height: ScreenUtil().setHeight(135),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/home/img_take_challenge.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Text(
                                'Relever un défi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Kanit-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.07,
                                ),
                              ),
                              Text(
                                '12 défis',
                                style: TextStyle(
                                  color: Color(0xFFF3F4F6),
                                  fontSize: 12,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  _buildActivityItem(),
                  SizedBox(
                    height: 55,
                  ),

                  // _textTitle('New Workout'),
                  // _buildListWorkOutItem(),

                  _textTitle('Cours de groupe'),
                  SizedBox(
                    height: 5,
                  ),
                  _buildListUpcomingEventListItem(groupClassItems, 'class'),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, top: 45, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        navigateToNextPage(context, CoachListScreen());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image:
                                AssetImage("assets/home/img_book_service.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 196,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Réservez votre prestation\n",
                                        style: TextStyle(
                                          color: Color(0xFFFF4343),
                                          fontSize: 22,
                                          fontFamily: 'Kanit-Medium',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'avec nos coachs',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 16,
                                          fontFamily: 'Kanit-Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 161,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF4343),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Reserve maintenant',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontFamily: 'Archivo-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      height: 1
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  _textTitle('Événement à venir'),

                  _buildListUpcomingEventListItem(upcomingEventsItems, 'event'),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 22.0,top: 20,right: 25,bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // _textTitle('Latest Blog'),
                        Text(
                          'Dernier blog',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Kanit-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.06,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            navigateToNextPage(context, AllBlogItemPage());
                          },
                          child: Text(
                            'View all',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFFFF4343),
                              fontSize: 14,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.11,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  _buildBlogItem(),
                  SizedBox(
                    height: 20,
                  ),

                  // _buildBlogIndicatorItem(),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // _textTitle('Latest Blog'),
                        Text(
                          "S'abonner",
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Kanit-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.06,
                          ),
                        ),
                        // Text(
                        //   'View all',
                        //   textAlign: TextAlign.right,
                        //   style: TextStyle(
                        //     color: Color(0xFFFF4343),
                        //     fontSize: 14,
                        //     fontFamily: 'Archivo-Medium',
                        //     fontWeight: FontWeight.w500,
                        //     height: 1.11,
                        //   ),
                        // )
                      ],
                    ),
                  ),

                  // _buildListSubcribeItem(),

                  Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,bottom: 25),
                    child: GestureDetector(
                      onTap: () {
                        navigateToNextPage(context, Subscription());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 194,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/home/img_subscription.png'),
                            // Your asset image path here
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 12.0, left: 22),
                              child: SizedBox(
                                width: 200,
                                height: 127,
                                child: Text(
                                  'Obtenir votre Abonnement aujourd hui',
                                  textAlign: TextAlign.start,
                                  // Adjust alignment as needed

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Kanit-Medium',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 45.0,top: 4),
                              child: Text(
                                'Commence à partir de',
                                style: TextStyle(
                                  color: Color(0xFFF8FAFC),
                                  fontSize: 12,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: SizedBox(
                                width: 108,
                                child: Text(
                                  'CHF 79/mois',
                                  style: TextStyle(
                                    color: Color(0xFFF8FAFC),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            padding:
                const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 12),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              // color: hasCrossedAboveWhileUp
              //     ? Colors.white.withAlpha(27)
              //     : Colors.white,

              color: Colors.white,
              // Set color to transparent
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            child: Stack(
              children: [
                // Visibility(
                //   visible: hasCrossedAboveWhileUp ? true : false,
                //   child: BackdropFilter(
                //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                //     child: Container(),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Hi 💪🏻',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 12,
                                fontFamily: 'Archivo-Regular',
                                fontWeight: FontWeight.w400,
                                height: 1.12,
                              ),
                            ),
                            Text(
                              'Helen Hanf',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 18,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsPage()));
                        },
                        child: Image.asset(
                          "assets/home/icon_notifications.png",
                          width: 24,
                          height: 24,
                          color: Color(0xFF334155),
                        ),
                      )
                    ],
                  ),
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
      height: 200,
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          WorkoutItem item = workoutItems[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
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
                  Image.asset(
                    "assets/home/img_subcribe_girl.png",
                    width: 100,
                    height: 200,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventndicatorItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        2, // Assuming there are 4 items in the slider
        (index) => Container(
          width: 23.33,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: ShapeDecoration(
            color:
                index == _currentPage1 ? Color(0xFFFFA142) : Color(0xFFE5E7EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlogIndicatorItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4, // Assuming there are 4 items in the slider
        (index) => Container(
          width: 23.33,
          height: 6,
          margin: EdgeInsets.symmetric(horizontal: 2.0),
          decoration: ShapeDecoration(
            color:
                index == _currentPage ? Color(0xFFFFA142) : Color(0xFFE5E7EB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }

  List<String> _splitTitle(String title) {
    if (title.length > 40) {
      // Split the title into two lines if it exceeds a certain length
      int index = title.lastIndexOf(' ',
          40); // Find the index of the last space before or at the 30th character
      if (index != -1) {
        return [title.substring(0, index), title.substring(index + 1)];
      }
    }
    return [title];
  }

  // Widget _buildBlogItem() {
  //   return GestureDetector(
  //     onTap: (){
  //       navigateToNextPage(context,BlogDetails());
  //     },
  //     child: Container(
  //       height: 200,
  //       child: PageView.builder(
  //         controller: PageController(viewportFraction: 0.94),
  //         itemCount: blogItems.length,
  //         onPageChanged: (int page) {
  //           setState(() {
  //             _currentPage = page; // Update the current page index
  //           });
  //         },
  //         itemBuilder: (BuildContext context, int index) {
  //           BlogItem item = blogItems[index];
  //           List<String> lines = _splitTitle(item.title);
  //
  //           print(lines.first);
  //
  //           return Padding(
  //             padding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //             child: Container(
  //               width: 288,
  //               height: 220,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10.0),
  //                 image: DecorationImage(
  //                   image: AssetImage(item.imagePath),
  //                   fit: BoxFit.fill,
  //                 ),
  //               ),
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 15.0,top: 15),
  //                         child: Container(
  //                           width: 54.h,
  //                           height: 25,
  //                           decoration: ShapeDecoration(
  //                             color: Color(0xFF252323),
  //                             shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(5)),
  //                           ),
  //                           child: Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               Image.asset("assets/home/icon_calendar.png",scale: 2,),
  //                               Padding(
  //                                 padding: const EdgeInsets.only(top: 6.0),
  //                                 child: Text(
  //                                   '02 Fév',
  //                                   style: TextStyle(
  //                                     color: Colors.white,
  //                                     fontSize: 10,
  //                                     fontFamily: 'Archivo-Regular',
  //                                     fontWeight: FontWeight.w400,
  //                                     height: 0.14,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(top: 15.0,right: 15),
  //                         child: Align(
  //                           alignment: Alignment.topRight,
  //                           child: Container(
  //                             width: 55.h,
  //                             height: 18.h,
  //                             padding: const EdgeInsets.symmetric(
  //                                 horizontal: 4, vertical: 2),
  //                             decoration: ShapeDecoration(
  //                               color:  Color(0xFF252323),
  //                               shape: RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.circular(5),
  //                               ),
  //                             ),
  //                             child: Center(
  //                               child: Padding(
  //                                 padding: const EdgeInsets.only(top: 5.0),
  //                                 child: Text(
  //                                   'Beginner',
  //                                   style: TextStyle(
  //                                     color: Color(0xFFFFA142),
  //                                     fontSize: 10,
  //                                     fontFamily: 'Archivo-Regular',
  //                                     fontWeight: FontWeight.w400,
  //                                     height: 0.14,
  //                                   ),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   Container(
  //                     height: 70,
  //                     padding: const EdgeInsets.only(top: 5, left: 0),
  //                     clipBehavior: Clip.antiAlias,
  //                     decoration: ShapeDecoration(
  //                       color: Colors.white,
  //                       // Set color to transparent
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.only(
  //                           bottomLeft: Radius.circular(10),
  //                           bottomRight: Radius.circular(10),
  //                         ),
  //                       ),
  //                     ),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(left: 15.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             lines.first, // Displaying the first line
  //                             style: TextStyle(
  //                               color: Color(0xFF334155),
  //                               fontSize: 16,
  //                               fontFamily: 'Archivo-Medium',
  //                               fontWeight: FontWeight.w500,
  //                               height: 1.4,
  //                             ),
  //                             maxLines: 1,
  //                           ),
  //                           SizedBox(height: 2),
  //                           // Add some space between lines
  //                           Row(
  //                             children: [
  //                               Expanded(
  //                                 child: Text(
  //                                   lines.length > 1 ? lines[1] : '',
  //                                   // Displaying the second line, if available
  //                                   style: TextStyle(
  //                                     color: Color(0xFF334155),
  //                                     fontSize: 16,
  //                                     fontFamily: 'Archivo-Medium',
  //                                     fontWeight: FontWeight.w500,
  //                                     height: 1.4,
  //                                   ),
  //                                   maxLines: 1,
  //                                   overflow: TextOverflow.ellipsis,
  //                                 ),
  //                               ),
  //                               SizedBox(width: 150),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBlogItem() {
    return Container(
      height: 180.h,  // Adjust the height to suit your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: blogItems.length,
        itemBuilder: (BuildContext context, int index) {
          BlogItem item = blogItems[index];
          List<String> lines = _splitTitle(item.title);

          return GestureDetector(
            onTap: () {
              navigateToNextPage(context, BlogDetails());
            },
            child: Padding(
              padding: const EdgeInsets.only(left:  20.0),
              child: Container(
                width: 270.h,
                height: 180.h,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 15),
                          child: Container(
                            width: 54,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Color(0xFF252323),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset("assets/home/icon_calendar.png", scale: 2),
                                Text(
                                  '02 Fév',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, right: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 60,
                              height: 23,

                              decoration: ShapeDecoration(
                                color: Color(0xFF252323),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Débutante',
                                  style: TextStyle(
                                    color: Color(0xFFFFA142),
                                    fontSize: 10,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.09,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.only(top: 5, left: 0),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              lines.first, // Displaying the first line
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.4,
                              ),
                              maxLines: 1,
                            ),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    lines.length > 1 ? lines[1] : '',
                                    // Displaying the second line, if available
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.4,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 150),
                              ],
                            ),
                          ],
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
    );
  }

  Widget _buildEventItem() {
    return Container(
      height: 136,
      // width: 380,

      child: PageView.builder(
        // controller: PageController(),
        controller: PageController(viewportFraction: 0.97),
        itemCount: headerItems.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage1 = page; // Update the current page index
          });
        },
        itemBuilder: (BuildContext context, int index) {
          BlogItem item = headerItems[index];
          List<String> lines = _splitTitle(item.title);

          // Check if the index is even or odd to render different types of items
          if (index.isEven) {
            return _buildTitleSubtitleItem(item, lines);
          } else {
            return _buildButtonProgressBarItem(item);
          }
        },
      ),
    );
  }

  Widget _buildTitleSubtitleItem(BlogItem item, List<String> lines) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        width: 200,
        height: 136,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage("assets/home/img_banner.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 25),
              child: Text(
                'Demain, 18h00',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0,top: 30),
              child: Text(
                'Nutrition pour tout le monde',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 30),
              child: Text(
                'Offline Event',
                style: TextStyle(
                  color: Color(0xFF66758C),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonProgressBarItem(BlogItem item) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        width: 200,
        height: 136,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage("assets/home/img_banner1.png"),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            // side: BorderSide(width: 2, color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          ),
          // shadows: [
          //   BoxShadow(
          //     color: Color(0x0C000000),
          //     blurRadius: 0.5,
          //     offset: Offset(0,0.4),
          //     spreadRadius: 0,
          //   )
          // ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 180,
                      child: Text(
                        'Your subscription is will\nbe end! Let’s renew it!',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 1.4,

                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 154,
                      height: 36,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Center(
                        child: Text(
                          'Renew subscription',
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
                  ],
                ),
              ),
            ),
            Container(
              height: 85,
              width: 120,
              child: Stack(
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size(70, 70),
                      painter: MyCircularProgressPainter(
                        backgroundColor: Colors.white,
                        progress: progressPercentage,
                        gradient: LinearGradient(
                          begin: Alignment(0.06, -1.00),
                          end: Alignment(-0.06, 1),
                          colors: [Color(0xFFFF4343), Color(0xFFFF4343)],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 35,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFF4343),
                              fontSize: 24,
                              fontFamily: 'Kanit-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.05,
                            ),
                          ),

                          Text(
                            'Days left',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFF4343),
                              fontSize: 12,
                              fontFamily: 'Kanit-Regular',
                              fontWeight: FontWeight.w400,
                              height: 1.11,
                            ),
                          )
                        ],
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

  Widget _textTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, bottom: 23),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 20,
            fontFamily: 'Kanit-Medium',
            fontWeight: FontWeight.w500,
            height: 0.06,
          ),
        ),
      ),
    );
  }

  Widget _buildListWorkOutItem() {
    return Container(
      height: 215,
      child: ListView.builder(
        itemCount: workoutItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          WorkoutItem item = workoutItems[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              width: 280,
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors
                    .white, // Add this line to set a color for the container

                // image: DecorationImage(
                //   image: AssetImage(item.imagePath),
                //   fit: BoxFit.fill,
                // ),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0)),
                          child: Image.asset(
                            item.imagePath,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: 280,
                        height: 75,
                        padding: const EdgeInsets.only(
                            top: 10, left: 16, right: 16, bottom: 12),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
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
                            // BackdropFilter(
                            //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            //   child: Container(),
                            // ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 203,
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.08,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5.0, left: 2),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Container(
                                          width: 2,
                                          height: 12,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFFF4343),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        item.duration,
                                        style: TextStyle(
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 10,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          height: 0.14,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 4.0, right: 4.0),
                                        child: Container(
                                          width: 4,
                                          height: 4,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF9CA3AF),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        item.category,
                                        style: TextStyle(
                                          color: Color(0xFF9CA3AF),
                                          fontSize: 10,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          height: 0.14,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.14,
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildListUpcomingEventListItem(
      List<dynamic> upcomingEventItsems, String status) {
    return Container(
      height: 190.h,
      child: ListView.builder(
        itemCount: upcomingEventItsems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          dynamic item = upcomingEventItsems[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventDetails(
                      item: upcomingEventItsems[index],
                      status: status,
                    ),
                  ),
                );
              },
              child: Container(
                width: 270.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 120.h,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              child: Image.asset(
                                item.imagePath,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 16,
                            right: 16,
                          ),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            // Set color to transparent
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 203,
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 16,
                                        fontFamily: 'Archivo-Medium',
                                        fontWeight: FontWeight.w500,
                                        height: 1.08,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 2, bottom: 15),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 7.0,
                                              bottom: 4,
                                            ),
                                            child: Container(
                                              width: 2,
                                              height: 5.h,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFFF4343),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 2.0),
                                            child: Text(
                                              '18.00 - 23.00 PM',
                                              style: TextStyle(
                                                color: Color(0xFF475569),
                                                fontSize: 12,
                                                fontFamily: 'Archivo-Regular',
                                                fontWeight: FontWeight.w400,
                                                height: 0.12,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 42,
                        height: 50,
                        decoration: ShapeDecoration(
                          color: Color(0xFF252323),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '24',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFE88E32),
                                  fontSize: 14,
                                  fontFamily: 'Poppins-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 1.07,
                                ),
                              ),
                              Text(
                                'Dec',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFE88E32),
                                  fontSize: 14,
                                  fontFamily: 'Poppins-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.11,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActivityItem() {
    return Row(
      children: [
        Expanded(
          child: Padding( 
            padding: const EdgeInsets.only(left: 22.0, top: 15, right: 5),
            child:  GestureDetector(
              onTap: () {
                navigateToNextPage(
                    context,
                    TakeChallenge(
                      status: 'workout',
                    ));
              },
              child: activityCard('assets/home/img_workout.png',
                  'Start a workout', '200 Workouts'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 22.0, top: 15,left: 5),
            child: GestureDetector(
              onTap: () {
                navigateToNextPage(
                    context,
                    TakeChallenge(
                      status: 'followprogramme',
                    ));
              },
              child: activityCard('assets/home/img_follow_programme.png',
                  'Follow a program', '11 Active programs'),
            ),
          ),
        )
      ],
    );
  }

  Widget activityCard(String img, String title, String subtitle) {
    return Container(
      // width: ScreenUtil().setWidth(154),
      height: ScreenUtil().setHeight(130),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Kanit-Medium',
                fontWeight: FontWeight.w500,
                height: 1.09,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Color(0xFFF3F4F6),
                fontSize: 12,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _build_Plan_Status() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 70),
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                      fontFamily: 'Kanit-Medium',
                      fontWeight: FontWeight.w500,
                      height: 0.06,
                    ),
                  ),
                  Text(
                    '2/5 Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
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
                          fontFamily: 'Kanit-Medium',
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
      ),
    );
  }
}
