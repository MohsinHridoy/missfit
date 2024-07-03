import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class TestScroll extends StatefulWidget {
//   const TestScroll({Key? key}) : super(key: key);
//
//   @override
//   State<TestScroll> createState() => _TestScrollState();
// }
//
// class _TestScrollState extends State<TestScroll> {
//   final List<int> meterValues = List.generate(155, (index) => index + 1);
//   PageController? _pageController;
//   int? currentPageIndex = 24; // Set initialPageIndex to 9 for the 10th item
//   int? selectedValue = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(viewportFraction: 0.046, initialPage: currentPageIndex!, keepPage: true);
//     _pageController!.addListener(_pageListener);
//     selectedValue = meterValues[currentPageIndex!];
//   }
//
//   @override
//   void dispose() {
//     _pageController?.removeListener(_pageListener);
//     _pageController?.dispose();
//     super.dispose();
//   }
//
//   void _pageListener() {
//     setState(() {
//       currentPageIndex = _pageController!.page!.round();
//       selectedValue = meterValues[currentPageIndex!];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xFF18181B),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Your existing UI code
//             // ...
//
//
//
//             SizedBox(height: 100,),
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: meterValues.length,
//                 itemBuilder: (context, index) {
//                   return MeterItem(
//                     value: meterValues[index],
//                     isSelected: index == currentPageIndex,
//                   );
//                 },
//               ),
//             ),
//
//             // Your existing UI code
//             // ...
//           ],
//         ),
//       ),
//     );
//   }
// }
//
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
//     double viewportFraction = 0.12;
//     double itemWidth = 10;
//     double itemHeight = isSelected ? 60.0 : 35.0;
//     double itemPadding = 0;
//
//     if (value % 5 == 0 && value <= 150) {
//       itemHeight += 20.0;
//       itemWidth = 4.0;
//
//     }
//
//     if (value % 5 != 0 && value <= 150) {
//       itemPadding = 10;
//       itemWidth = 1.5;
//       viewportFraction = 0.0120; // Default fraction value for non-divisible by 5 items
//     }
//
//     String? underText;
//     if (value % 5 == 0 && value <= 150) {
//       underText = "$value";
//     }
//     return Container(
//       width: itemWidth,
//       child: Padding(
//         padding:  isSelected ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: itemPadding),
//         child: Column(
//           children: [
//             Container(
//               width: itemWidth,
//               height: itemHeight,
//               color: Colors.white.withOpacity(0.7),
//             ),
//             if (isSelected)
//               Container(
//                 width: 10,
//                 height: 12,
//                 decoration: BoxDecoration(
//                   color: Colors.red.withOpacity(0.7),
//                   borderRadius: BorderRadius.circular(5), // Rounded corners
//                 ),
//               ),
//
//             if (underText != null) // Display under text if it's not null
//               Text(
//                 underText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 10,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

class TestScroll extends StatefulWidget {
  final VoidCallback onNextPressed;

  String? status;

   TestScroll({Key? key,required this.onNextPressed,this.status}) : super(key: key);

  @override
  State<TestScroll> createState() => _TestScrollState();
}

class _TestScrollState extends State<TestScroll> {
  final List<int> meterValues = List.generate(155, (index) => index + 1);
  PageController? _pageController;
  int? currentPageIndex = 24; // Set initialPageIndex to 9 for the 10th item
  int? selectedValue=25 ;
  String selectedUnit = 'kgs';
  late SharedPreferences _prefs;
  late int _savedIndex;
  @override
  void initState() {
    super.initState();
    _initPrefs();
    _pageController = PageController(
        viewportFraction: 0.042,
        initialPage: currentPageIndex!,
        keepPage: true);
    _pageController!.addListener(_pageListener);

    print(currentPageIndex);
    // selectedValue = meterValues[currentPageIndex!];
  }
// Initialize SharedPreferences
  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve the saved current index, default to 0 if not found
    _savedIndex = _prefs.getInt('currentIndex') ?? 0;

    setState(() {
      // _pageController = PageController(
      //   viewportFraction: 0.042,
      //   initialPage: _savedIndex,
      //   keepPage: true,
      // );
      _pageController!.addListener(_pageListener);
      currentPageIndex = _savedIndex;
      selectedValue = meterValues[currentPageIndex!];
    });
  }
  // Save current index to SharedPreferences
  _saveIndex(int index) async {
    await _prefs.setInt('currentIndex', index);
  }
  @override
  void dispose() {
    _pageController?.removeListener(_pageListener);
    _pageController?.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      currentPageIndex = _pageController!.page!.round();
      selectedValue = meterValues[currentPageIndex!];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Your existing UI code
            // ...

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 30),
              child: Text(
                'What is your weight?',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 24,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.05,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 50),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: currentPageIndex == 0 ? '24' : '$selectedValue',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 48,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.03,
                            ),
                          ),
                          TextSpan(
                            text: selectedUnit,
                            style: TextStyle(
                              color: Color(0xFF334155).withOpacity(0.8),
                              fontSize: 16,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.08,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 30),
                    child:  Container(
                      width: 227,
                      height: 1,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: CustomPaint(
                        painter: DashedLinePainter(),
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
        Container(
          height: 100,

          child: Stack(
            children: [
              Container(
                height: 120,
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

              Center(
                child: Column(
                  children: [
                    Container(
                      width: 4,
                      height:65,
                      color: Color(0xFFFF4343)
                      ,
                    ),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF4343),
                        shape: BoxShape.circle,
                        // Explicitly setting the shape to rectangle
                        // borderRadius: BorderRadius.all(
                        //     Radius.circular(6)), // Apply rounded corners
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

            Center(
              child: Container(
                width: 200,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedUnit = 'kgs';
                        });
                      },
                      child: Text(
                        'KG',
                        style: TextStyle(
                          color: selectedUnit == 'kgs'
                              ? Color(0xFFE88E32)
                              : Color(0xFF9CA3AF),
                          fontSize: 20,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 1.07,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(width: 1, color: Color(0xFF334155)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedUnit = 'lbs';
                        });
                      },
                      child: Text(
                        'LBS',
                        style: TextStyle(
                          color: selectedUnit == 'lbs'
                              ? Color(0xFFE88E32)
                              : Color(0xFF9CA3AF),
                          fontSize: 20,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w400,
                          height: 1.07,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),


            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 30),
                child: GestureDetector(
                  onTap: () async{
                    await _saveIndex(currentPageIndex!);

                    print(currentPageIndex);
                    widget.onNextPressed();

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 44,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF4343),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.status == 'profile'?'Save & Next':'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )

            // Your existing UI code
            // ...
          ],
        ),
      ),
    );
  }
}

class MeterItem extends StatelessWidget {
  final int value;
  final bool isSelected;

  const MeterItem({
    Key? key,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double viewportFraction = 0.12;
    double itemWidth = 10;
    double itemHeight = isSelected ? 60.0 : 35.0;
    double itemPadding = 0;

    if (value % 5 == 0 && value <= 155) {
      itemHeight += 20.0;
      itemWidth = 3.5;
    }

    if (value % 5 != 0 && value <= 155) {
      itemPadding = 10;
      itemWidth = 2;
      viewportFraction =
          0.0120; // Default fraction value for non-divisible by 5 items
    }

    String? underText;
    if (value % 5 == 0 && value <= 155) {
      underText = "$value";
    }

    return Container(
      width: itemWidth,
      child: Padding(
        padding: isSelected
            ? EdgeInsets.only(top: 0)
            : EdgeInsets.only(top: itemPadding),
        child: Column(
          children: [
            Container(
              width: itemWidth,
              height: itemHeight,
              color: isSelected
                  ? Colors.transparent
                  : Color(0xFF9E9E9E).withOpacity(0.8),
            ),
            // if (isSelected)
            //   Container(
            //     width: itemWidth,
            //     height: itemHeight,
            //     color: Colors.red.withOpacity(0.7),
            //   ),
            if (isSelected)
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  // Explicitly setting the shape to rectangle
                  // borderRadius: BorderRadius.all(
                  //     Radius.circular(6)), // Apply rounded corners
                ),
              ),

            SizedBox(
              width: 30, // Fixed width for underText
              child: Center(
                child: Visibility(
                  visible: isSelected ? false : true,
                  child: Text(
                    underText ?? '', // Ensure underText is not null
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 9,
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



class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square; // Setting strokeCap to square

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}