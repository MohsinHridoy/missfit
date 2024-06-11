import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HeightMeasurementsScreen extends StatefulWidget {
  final VoidCallback onNextPressed;
  String? status;

   HeightMeasurementsScreen({Key? key,required this.onNextPressed,this.status}) : super(key: key);

  @override
  State<HeightMeasurementsScreen> createState() => _HeightMeasurementsScreenState();
}

class _HeightMeasurementsScreenState extends State<HeightMeasurementsScreen> {
  final List<int> meterValues = List.generate(155, (index) => index + 1);
  late PageController _pageController;
  int currentPageIndex = 24; // Set initialPageIndex to 24
  int selectedValue = 0;
  String selectedUnit = 'kgs';
  bool selectedUnitForMesurements=false;
  int? feet;
  int? inch;
  late SharedPreferences _prefs;
  late int _savedIndex;

  @override
  void initState() {
    super.initState();
    _initPrefs();
    _pageController = PageController(
      viewportFraction: 0.027,
      initialPage: currentPageIndex,
      keepPage: true,
    );
    _pageController.addListener(_pageListener);
    selectedValue = meterValues[currentPageIndex];
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve the saved current index, default to 0 if not found
    _savedIndex = _prefs.getInt('currentIndexHeight') ?? 0;
    currentPageIndex = _savedIndex;
    selectedValue = meterValues[currentPageIndex];
  }

  // Save current index to SharedPreferences
  _saveIndex(int index) async {
    await _prefs.setInt('currentIndexHeight', index);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      currentPageIndex = _pageController.page!.round();
      selectedValue = meterValues[currentPageIndex];
      _saveIndex(currentPageIndex);
    });
  }
  String formatFeetAndInches(int totalInches) {
     feet = totalInches ~/ 12;
     inch = totalInches % 12;
    return "$feet $inch\"";
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
                'What is your height?',
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
              padding: const EdgeInsets.only(left: 8.0, top: 50),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:"${selectedValue! ~/ 100}",
                            // text:selectedUnitForMesurements? "${selectedValue! ~/ 100}": "${ selectedValue! ~/ 12}",
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 48,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 1.03,
                            ),
                          ),
                          TextSpan(
                            text: selectedUnitForMesurements?"mt": "ft",
                            style: TextStyle(
                              color: Color(0xFF334155).withOpacity(0.8),
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 1.08,
                            ),
                          ),
                          TextSpan(
                            text: selectedUnitForMesurements?"${selectedValue! % 100}":"${ selectedValue! % 12}",
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 48,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 1.03,
                            ),
                          ),
                          TextSpan(
                            text: selectedUnitForMesurements?"cm": "in",
                            style: TextStyle(
                              color: Color(0xFF334155).withOpacity(0.8),
                              fontSize: 16,
                              fontFamily: 'Archivo',
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
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       selectedUnit = 'FT';
                //       selectedUnitForMesurements=false;
                //     });
                //   },
                //   child: Text(
                //     'FT',
                //     style: TextStyle(
                //       color: selectedUnit == 'FT'
                //           ? Color(0xFFE88E32)
                //           : Color(0xFF9CA3AF),
                //       fontSize: 20,
                //       fontFamily: 'Archivo-Medium',
                //       fontWeight: FontWeight.w500,
                //       height: 1.07,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: Container(width: 1, color: Color(0xFF334155)),
                // ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedUnit = 'CM';
                      selectedUnitForMesurements=true;
                    });
                  },
                  child: Text(
                    'CM',
                    style: TextStyle(
                      color: selectedUnit == 'CM'
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
              child:  GestureDetector(
                onTap: () async{
                  if(widget.status == 'profile')
                    navigateToNextPage(context,DashBoard(number: 3,));
                  await _saveIndex(currentPageIndex!);
                  print(currentPageIndex);

                  widget.onNextPressed();
                },
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
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
                          widget.status == 'profile'?'Save':'Next',
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
              )
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

    if (value % 6 == 0 && value <= 155) {
      itemHeight += 20.0;
      itemWidth = 3.5;
    }

    if (value % 6 != 0 && value <= 155) {
      itemPadding = 10;
      itemWidth = 2;
      viewportFraction =
      0.0120; // Default fraction value for non-divisible by 5 items
    }

    String? underText;
    if (value % 6 == 0 && value <= 155) {
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

            // SizedBox(
            //   width: 30, // Fixed width for underText
            //   child: Center(
            //     child: Visibility(
            //       visible: isSelected ? false : true,
            //       child: Text(
            //         underText ?? '', // Ensure underText is not null
            //         style: TextStyle(
            //           color: Color(0xFF94A3B8),
            //           fontSize: 9,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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