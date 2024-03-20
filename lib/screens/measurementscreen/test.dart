import 'package:flutter/material.dart';

class TestScroll extends StatefulWidget {
  @override
  _TestScrollState createState() => _TestScrollState();
}

class _TestScrollState extends State<TestScroll> {
  final List<int> meterValues = List.generate(50, (index) => index + 1);
  PageController? _pageController; // Declare PageController as nullable
  int currentPageIndex = 5; // Initial selected index (item 6)
  int selectedValue = 56; // Initial selected value

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Initialize PageController after the first frame
      _pageController =
          PageController(viewportFraction: 0.10, initialPage: currentPageIndex);
      _pageController!.addListener(_pageListener);
      // Update selected value with the value of initially selected item
      selectedValue = meterValues[currentPageIndex];
      setState(() {}); // Trigger a rebuild to update the text "56 kg"
    });
  }

  @override
  void dispose() {
    _pageController?.removeListener(_pageListener);
    _pageController?.dispose(); // Dispose PageController if not null
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      currentPageIndex = _pageController!.page!.round();
      selectedValue = meterValues[
          currentPageIndex]; // Update selectedValue when the page changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color(0xFF18181B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 30),
              child: Text(
                'What is your weight?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w500,
                  height: 1.05,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$selectedValue', // Display selectedValue
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 48,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 1.03,
                            ),
                          ),
                          TextSpan(
                            text: 'kgs',
                            style: TextStyle(
                              color: Colors.white,
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
                    padding: const EdgeInsets.only(left: 20.0,top: 20),
                    child: Opacity(
                      opacity: 0.20,
                      child: Container(
                        width: 227,
                        height: 1, // Set height for the dashed line
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              // cap: StrokeCap.square, // Corrected parameter name
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: CustomPaint(
                          painter: DashedLinePainter(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                height: 120,
                child: PageView.builder(
                  controller: _pageController,
                  // Use the initialized PageController
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KG',
                  style: TextStyle(
                    color: Color(0xFFFFA142),
                    fontSize: 20,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 1.07,
                  ),
                ),
                SizedBox(width: 10,),
                // Transform(
                //   transform: Matrix4.identity()
                //     ..translate(0.0, 0.0)
                //     ..rotateZ(1.57),
                //   child: Container(
                //     width: 32,
                //     decoration: ShapeDecoration(
                //       shape: RoundedRectangleBorder(
                //         side: BorderSide(
                //           width: 1,
                //           strokeAlign: BorderSide.strokeAlignCenter,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Text("I",style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  height: 1.07,
                )),
                SizedBox(width: 5,),
                Text(
                  'LBS',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 20,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    height: 1.07,
                  ),
                )
              ],
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 320,
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w500,
                          height: 0.11,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
    return Container(
      // color: Colors.purple.withOpacity(0.4),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        meterItem(),
                        meterItem(),
                        meterItem(),
                        meterItem(),
                        meterItem(),
                      ],
                    ),
                    SizedBox(height: 30,)
                  ],
                ),
              ),
              Container(
                height: 100,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 3,
                      height: isSelected ? 60 : 50,
                      color: isSelected
                          ? Colors.red
                          : Colors.white.withOpacity(0.7),
                    ),
                    isSelected
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  isSelected ? Colors.red : Colors.transparent,
                            ),
                          )
                        : Container()
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 62,
            left: 25,
            child: Container(
              width: 50,
              height: 30,
              child: Text(
                "$value",
                style: TextStyle(
                    color: isSelected ? Colors.transparent : Colors.white,fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget meterItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2),
      child: Container(
        width: 2,
        height: 35,
        color: Colors.grey.withOpacity(0.4),
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