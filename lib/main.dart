import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:miss_fit/screens/activityselectiondashboard/activityselectiondashboard.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/allblogitem/all_blog_item.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/blogdetails/blog_details.dart';
import 'package:miss_fit/screens/bookmark/bookmark.dart';
import 'package:miss_fit/screens/cartscreen/cart.dart';
import 'package:miss_fit/screens/cartscreen/cart001.dart';
import 'package:miss_fit/screens/challenge_details/challenge_details.dart';
import 'package:miss_fit/screens/checkout/checkout.dart';
import 'package:miss_fit/screens/checkout/checkout_with_address.dart';
import 'package:miss_fit/screens/coachbookingscreen/coach_booking_screen.dart';
import 'package:miss_fit/screens/colourselectionpage/colour_selection_page.dart';
import 'package:miss_fit/screens/completeorderpage/complete_order_page.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/eventdetails/event_details_screen.dart';
import 'package:miss_fit/screens/filterbrandsselectionpage/brandsselectionpage.dart';
import 'package:miss_fit/screens/filtercategoryselectionpage/categoryselectionpage.dart';
import 'package:miss_fit/screens/filterreviewselectionpage/review_selection_page.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:miss_fit/screens/filtersizeselectionpage/size_selection_page.dart';
import 'package:miss_fit/screens/heightmeasurementscreen/height_selection_page.dart';
import 'package:miss_fit/screens/heightselectiondashboard/height_selection_dashboard.dart';
import 'package:miss_fit/screens/home/home.dart';
import 'package:miss_fit/screens/home/home001.dart';
import 'package:miss_fit/screens/levelselectionpage/advancement_level_selection_page.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/measurementscreen/measurement_screen.dart';
import 'package:miss_fit/screens/measurementscreen/test3.dart';
import 'package:miss_fit/screens/myaddress/my_address.dart';
import 'package:miss_fit/screens/mysubscription/my_subscription.dart';
import 'package:miss_fit/screens/notifications/notifications.dart';
import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:miss_fit/screens/orderhistory/order_history.dart';
import 'package:miss_fit/screens/orderstatus/cancel_order_status_screen.dart';
import 'package:miss_fit/screens/orderstatus/order_status_screen.dart';
import 'package:miss_fit/screens/otp/otp.dart';
import 'package:miss_fit/screens/otp/otp001.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:miss_fit/screens/personalinfo/personal_info.dart';
import 'package:miss_fit/screens/productdetails/product_details.dart';
import 'package:miss_fit/screens/profile/profile.dart';
import 'package:miss_fit/screens/programdetails/programme_details.dart';
import 'package:miss_fit/screens/registration/registration.dart';
import 'package:miss_fit/screens/registration/registration001.dart';
import 'package:miss_fit/screens/registrationstatuspage/registration_status_page.dart';
import 'package:miss_fit/screens/returnproduct/return_product.dart';
import 'package:miss_fit/screens/review/write_review.dart';
import 'package:miss_fit/screens/review_list_profile/review_list_profile.dart';
import 'package:miss_fit/screens/reviewlistscreen/review_list_screen.dart';
import 'package:miss_fit/screens/reviewsummery/review_summery_screen.dart';
import 'package:miss_fit/screens/selectservicescreen/select_service_screen.dart';
import 'package:miss_fit/screens/servicedetails/service_details.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:miss_fit/screens/shoppage/shop_page.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';
import 'package:miss_fit/screens/subscription/subscription.dart';
import 'package:miss_fit/screens/subscription_history/subscription_history.dart';
import 'package:miss_fit/screens/subscriptionprice/subscription_price.dart';
import 'package:miss_fit/screens/subscriptionprice/subscription_price1.dart';
import 'package:miss_fit/screens/takechallenge/take_challenge.dart';
import 'package:miss_fit/screens/timeselectionscreen/select_time_screen.dart';
import 'package:miss_fit/screens/wishlist/wish_list_screen.dart';
import 'package:miss_fit/screens/workout_viewer_screen/workout_viewer_screen-test_002.dart';
import 'package:miss_fit/screens/workout_viewer_screen/workout_viewer_screen.dart';
import 'package:miss_fit/screens/workout_viewer_screen/workout_viewer_screen_test_001.dart';
import 'package:miss_fit/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import 'common_utils.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//         SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//     ScreenUtil.init(context, designSize: Size(375, 812), allowFontScaling: true);
//
//     return MaterialApp(
//       title: 'MissFit',
//       debugShowCheckedModeBanner: false,
//
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // home:  SplashScreen(),
//       // home:  DeliavryAddress(),
//       // home:  CancelOrderStatus( status: CancelOrderStatusEnum.Processing,),
//       // home: BasicInfo(onNextPressed: () {  },),
//       home: DashBoard(),
//       // home: ActivitySelectionDashBoard(),
//       // home:  FilterShopScreen(),
//       // home:  TestScroll(),
//     );
//   }
// }
//
//
//
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: TakeChallenge(),
    );
  }
}












class VerticalProgressBar1 extends StatefulWidget {
  @override
  _VerticalProgressBar1State createState() => _VerticalProgressBar1State();
}

class _VerticalProgressBar1State extends State<VerticalProgressBar1> with SingleTickerProviderStateMixin {
  int progress = 1; // Initial progress value
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1, end: 12).animate(_controller)
      ..addListener(() {
        setState(() {
          progress = _animation.value.toInt();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body:  Container(
        color: Color(0xFFF6F6F6), // Set body color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: 'Abonnement',
              onBackTap: () {
                Navigator.pop(context);
                // navigateToNextPage(context, DashBoard(number: 3,));
              },
              iconSpacing: 3.7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 50),
              child: SizedBox(
                width: 320,
                child: Text(
                  'Sélectionnez les mois',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 18,
                    fontFamily: 'Kanit-Medium',
                    fontWeight: FontWeight.w500,
                    height: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '$progress',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 48,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.03,
                          ),
                        ),
                        TextSpan(
                          text: ' mois',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
                    child: Container(
                      width: 170,
                      height: 35,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'Total: CHF ${progress * 970}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF22C55E),
                              fontSize: 18,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.08,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(12, (index) {
                      int number = 12 - index; // Adjusted to reverse the numbering
                      return Container(
                        height: 30,
                        width: 30,
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          '$number',
                          style: TextStyle(
                            color: number <= progress ? Color(0xFFFFA142) : Color(0xFF94A3B8), // Adjusted condition
                            fontSize: 20,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 25),
                        child: Container(
                          width: 40,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 25,top: 5),
                        child: AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return ClipPath(
                              clipper: WaveClipper(progress, _controller.value),
                              child: Container(
                                width: 40,
                                height: 390,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF4343),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            // Adding space between widgets
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    navigateToNextPage(context, VerticalProgressBar());
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: Colors.grey[300],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Continuer',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Semibold',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
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
  }
}

class WaveClipper extends CustomClipper<Path> {
  final int progress;
  final double waveValue;

  WaveClipper(this.progress, this.waveValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    final heightFactor = progress / 12;

    path.moveTo(0, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}






























// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => RegistrationModel(),
//       child: MaterialApp(
//         title: 'Your App Title',
//         theme: ThemeData(
//           // Define your app's theme here
//         ),
//         home: RegistrationPage(), // Pass the RegistrationPage widget as the home
//       ),
//     );
//   }
// }

class FilterItems extends StatefulWidget {
  const FilterItems({Key? key}) : super(key: key);

  @override
  State<FilterItems> createState() => _FilterItemsState();
}

class _FilterItemsState extends State<FilterItems> {
  double minValue = 0; // Initial minimum value
  double maxValue = 3000; // Initial maximum value
  double knobSize = 22; // Width of the knob

  void _updatePosition(DragUpdateDetails details, bool isMin) {
    double screenWidth = MediaQuery.of(context).size.width;
    double posValue =
    ((details.globalPosition.dx - knobSize / 2) / screenWidth * 100)
        .clamp(0, 100);

    if (isMin) {
      if (posValue <= maxValue - 1) {
        setState(() {
          minValue = posValue.clamp(0, maxValue - 1);
          if (minValue >= maxValue - 1) {
            // If the minimum knob reaches the position of the maximum knob
            // Set the value to 100
            minValue = 100;
          }
        });
      }
    } else {
      if (posValue >= minValue + 1) {
        setState(() {
          maxValue = posValue.clamp(minValue + 1, 100);
          if (maxValue <= minValue + 1) {
            // If the maximum knob reaches the position of the minimum knob
            // Set the value to 0
            maxValue = 0;
          }
          if (maxValue >= 99) {
            // If the maximum knob reaches the edge of the range
            // Set the value to 100
            maxValue = 100;
          }
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minLeft =
    (screenWidth * (minValue / 100)).clamp(0, screenWidth - knobSize);
    double maxLeft =
    (screenWidth * (maxValue / 100)).clamp(knobSize, screenWidth);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          SizedBox(
            width: screenWidth,
            height: 50,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                _updatePosition(details, true);
              },
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
                        child: Image.asset(
                            "assets/order/icon_range_slider.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: maxLeft - knobSize - 50,
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
                        child: Image.asset(
                            "assets/order/icon_range_slider.png"),
                      ),
                    ),
                  ),
                ],
              ),
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




class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _lowerValue = 0;
  double _upperValue = 3000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }
}



class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  double minValue = 0; // Initial minimum value
  double maxValue = 100; // Initial maximum value
  double knobSize = 22; // Width of the knob

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double minLeft = (screenWidth * (minValue / 100)).clamp(0, screenWidth - knobSize);
    double maxLeft = (screenWidth * (maxValue / 100)).clamp(knobSize, screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Widget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Min Value: ${minValue.toStringAsFixed(1)}'),
                Text('Max Value: ${maxValue.toStringAsFixed(1)}'),
              ],
            ),
          ),
          SizedBox(height: 20),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: screenWidth,
                height: 5,
                color: Colors.grey[300],
              ),
              Positioned(
                left: minLeft - knobSize / 2,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      minValue += details.primaryDelta! / screenWidth * 100;
                      if (minValue < 0) minValue = 0;
                      if (minValue > maxValue) minValue = maxValue;
                    });
                  },
                  child: Container(
                    width: knobSize,
                    height: knobSize,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: maxLeft - knobSize / 2,
                child: GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    setState(() {
                      maxValue += details.primaryDelta! / screenWidth * 100;
                      if (maxValue > 100) maxValue = 100;
                      if (maxValue < minValue) maxValue = minValue;
                    });
                  },
                  child: Container(
                    width: knobSize,
                    height: knobSize,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}