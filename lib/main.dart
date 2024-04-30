import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miss_fit/screens/basicinformation/basic_info.dart';
import 'package:miss_fit/screens/heightmeasurementscreen/height_selection_page.dart';
import 'package:miss_fit/screens/home/home.dart';
import 'package:miss_fit/screens/levelselectionpage/advancement_level_selection_page.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/measurementscreen/measurement_screen.dart';
import 'package:miss_fit/screens/measurementscreen/test3.dart';
import 'package:miss_fit/screens/onboarding_screen/onboardingScreen.dart';
import 'package:miss_fit/screens/onboarding_screen/rough.dart';
import 'package:miss_fit/screens/onboarding_screen/rough2.dart';
import 'package:miss_fit/screens/otp/otp.dart';
import 'package:miss_fit/screens/registration/registration.dart';
import 'package:miss_fit/screens/registration/registration001.dart';
import 'package:miss_fit/screens/registrationstatuspage/registration_status_page.dart';
import 'package:miss_fit/screens/splash_screen/splashScreen.dart';
import 'package:miss_fit/screens/workout_viewer_screen/workout_viewer_screen.dart';
import 'package:provider/provider.dart';

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
      home:  Registration(),
      // home:  TestScroll(),
    );
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


class MeterScrollView extends StatefulWidget {
  @override
  _MeterScrollViewState createState() => _MeterScrollViewState();
}





class _MeterScrollViewState extends State<MeterScrollView> {
  final List<int> meterValues = List.generate(100, (index) => index + 1);
  late PageController _pageController;
  int currentPageIndex = 50; // Set initial page index to 50

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: currentPageIndex,
      viewportFraction: 0.030,
    );
    _pageController.addListener(_scrollListener);

    // Jump to the middle item when the page starts
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollToSelectedPage();
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_scrollListener);
    _pageController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      currentPageIndex = _pageController.page!.round();
    });
  }

  void _scrollToSelectedPage() {
    _pageController.animateToPage(
      currentPageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meter Scroll View'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var index = 0; index < meterValues.length; index++)
                MeterItem(
                  value: meterValues[index],
                  isSelected: index == currentPageIndex,
                  isFractional: meterValues[index] % 5 == 0,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      currentPageIndex = pageIndex;
                      _scrollToSelectedPage();
                    });
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MeterItem extends StatelessWidget {
  final int value;
  final bool isSelected;
  final bool isFractional;
  final void Function(int) onPageChanged;

  const MeterItem({
    Key? key,
    required this.value,
    required this.isSelected,
    required this.isFractional,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double itemWidth = isFractional ? 8.0 : 10.0; // Adjusted width for items divisible by 5
    double itemHeight = isSelected ? 100.0 : 80.0;
    double itemPadding = isSelected ? 20.0 : 0.0;

    Color itemColor = isSelected ? Colors.red.withOpacity(0.7) : Colors.white.withOpacity(0.7);
    Color textColor = isSelected ? Colors.white : Colors.black;

    if (isFractional) {
      itemPadding += 5.0;
    }

    String? underText;
    if (value % 5 == 0 && value <= 100) {
      underText = "$value";
    }

    return GestureDetector(
      onTap: () {
        onPageChanged(value - 1); // Adjust the page index to match the item's index
      },
      child: Column(
        children: [
          Container(
            width: itemWidth,
            height: itemHeight,
            padding: EdgeInsets.symmetric(vertical: itemPadding),
            margin: EdgeInsets.only(left: isFractional ? 5.0 : 0.0, right: isFractional ? 5.0 : 0.0),
            decoration: BoxDecoration(
              color: itemColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '$value',
                style: TextStyle(fontSize: 14, color: textColor),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            underText ?? '',
            style: TextStyle(fontSize: 14, color: Colors.black),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
