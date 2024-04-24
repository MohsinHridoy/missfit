import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/home/home.dart';
import 'package:miss_fit/screens/levelselectionpage/advancement_level_selection_page.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/measurementscreen/measurement_screen.dart';
import 'package:miss_fit/screens/measurementscreen/test2.dart';
import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:miss_fit/screens/onboarding_screen/rough2.dart';
import 'package:miss_fit/screens/otp/otp.dart';
import 'package:miss_fit/screens/registration/registration.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';
import 'package:miss_fit/screens/workout_viewer_screen/workout_viewer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(

        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:  SplashScreen(),
      home:  TestScroll(),
      // home:  TestScroll(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller1 = ScrollController();
  final ScrollController _controller2 = ScrollController();

  double itemWidth1 = 100; // Width of items in the first list
  double itemWidth2 = 60;  // Width of items in the second list

  @override
  void initState() {
    super.initState();

    _controller1.addListener(() {
      if (_controller2.hasClients && (_controller1.positions.isNotEmpty)) {
        double scale = itemWidth2 / itemWidth1;
        double offset = _controller1.offset * scale;
        _controller2.jumpTo(offset);
      }
    });

    _controller2.addListener(() {
      if (_controller1.hasClients && (_controller2.positions.isNotEmpty)) {
        double scale = itemWidth1 / itemWidth2;
        double offset = _controller2.offset * scale;
        _controller1.jumpTo(offset);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linked Horizontal Scroll'),
      ),
      body: Column(
        children: [
          Expanded(
            child: buildHorizontalList(_controller1),
          ),
          Expanded(
            child: buildMeterList(_controller2),
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalList(ScrollController controller) {
    final sidePadding = MediaQuery.of(context).size.width / 2 - itemWidth1 / 2;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      controller: controller,
      child: Row(
        children: [
          SizedBox(width: sidePadding),
          ...List.generate(
            100,
                (index) => Container(
              width: itemWidth1,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: sidePadding),
        ],
      ),
    );
  }

  Widget buildMeterList(ScrollController controller) {
    final double sidePadding = MediaQuery.of(context).size.width / 2 - itemWidth2 / 2;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: controller,
      child: Row(
        children: [
          SizedBox(width: sidePadding),
          ...List.generate(
            100,
                (index) => Container(
              width: itemWidth2,
              height: 100,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: index == 49 ? Colors.red : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: sidePadding),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }
}
class MeterItem extends StatelessWidget {
  final int value;
  final bool isSelected;

  const MeterItem({
    Key? key,
    required this.value,
    this.isSelected = false, // Default to false if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = isSelected ? 20.0 : 10.0;  // Increased width for better visibility
    double itemHeight = isSelected ? 100.0 : 80.0; // Adjusted height
    double itemPadding = isSelected ? 20.0 : 10.0; // More distinct padding

    return GestureDetector(
      onTap: () {
        // Implementation to handle tap event
      },
      child: Padding(
        padding: EdgeInsets.only(top: itemPadding, left: 5, right: 5),
        child: Container(
          width: itemWidth,
          height: itemHeight,
          decoration: BoxDecoration(
            color: isSelected ? Colors.red : Colors.grey, // More visible colors
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$value',
              style: TextStyle(fontSize: 18, color: Colors.white), // Larger font for better readability
            ),
          ),
        ),
      ),
    );
  }
}



class MeterScrollView extends StatefulWidget {
  @override
  _MeterScrollViewState createState() => _MeterScrollViewState();
}

class _MeterScrollViewState extends State<MeterScrollView> {
  final List<int> meterValues = List.generate(100, (index) => index + 1);
  late PageController _pageController;
  late ScrollController _horizontalListController;
  int currentPageIndex = 49; // Adjusted to make the middle item selected

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPageIndex,
      viewportFraction: 0.020,
    ); // Adjusted viewportFraction
    _pageController.addListener(_scrollListener);
    _horizontalListController = ScrollController();
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();
    _horizontalListController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      currentPageIndex = _pageController.page!.round();
      _horizontalListController.jumpTo(_pageController.position.pixels);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meter Scroll View'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              height: 200,
              color: Colors.grey,
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                itemCount: meterValues.length,
                itemBuilder: (context, index) {
                  return MeterItem(
                    value: meterValues[index],
                    isSelected: index == currentPageIndex,
                  );
                },
              ),
            ),
            SizedBox(width: 10), // Added space between meter and horizontal list
            SizedBox(
              height: 30, // Height of the horizontal list
              child: ListView.builder(
                controller: _horizontalListController,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  int horizontalValue = (index + 1) * 5; // Increment by 5
                  return Container(
                    width: 50, // Fixed width for each item
                    height: 30,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text(
                      '$horizontalValue',
                      style: TextStyle(fontSize: 14, color: Colors.red),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class MeterItem extends StatelessWidget {
//   final int value;
//   final bool isSelected;
//
//   const MeterItem({
//     Key? key,
//     required this.value,
//     required this.isSelected,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double itemWidth = isSelected ? 6.0 : 5.0; // Set a minimum width
//     double itemHeight = isSelected ? 80.0 : 50.0;
//     double itemPadding = isSelected ? 10.0 : 0.0;
//
//     return GestureDetector(
//       onTap: () {
//         // Handle tap event to update selected item
//         // You may want to implement this part
//       },
//       child: Padding(
//         padding: EdgeInsets.only(top: itemPadding),
//         child: Column(
//           children: [
//             Container(
//               width: itemWidth,
//               height: itemHeight,
//               decoration: BoxDecoration(
//                 color: isSelected ? Colors.red.withOpacity(0.7) : Colors.white.withOpacity(0.7),
//                 borderRadius: BorderRadius.circular(5), // Rounded corners
//               ),
//               child: Center(
//                 child: isSelected ? Text(
//                   '$value',
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ) : null,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }