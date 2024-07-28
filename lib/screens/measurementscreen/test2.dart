
import 'package:flutter/material.dart';


class TestScroll extends StatefulWidget {
  const TestScroll({Key? key}) : super(key: key);

  @override
  State<TestScroll> createState() => _TestScrollState();
}

class _TestScrollState extends State<TestScroll> {
  final List<int> meterValues = List.generate(100, (index) => index + 1);
  PageController? _pageController;
  int currentPageIndex = 50;
  int selectedValue = 51;
  ScrollController _textListController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      int initialPageIndex = meterValues.length ~/ 2.5;
      print(initialPageIndex);

      // Calculate the width of each page
      double pageWidth = MediaQuery.of(context).size.width * 0.030;
      // Calculate the initial scroll position to center the middle item
      double initialScrollPosition = initialPageIndex * pageWidth - (MediaQuery.of(context).size.width / 2);

      _pageController = PageController(viewportFraction: 0.040, initialPage: initialPageIndex);
      _pageController!.addListener(_pageListener);
      // _pageController!.jumpTo(initialScrollPosition);

      selectedValue = meterValues[initialPageIndex];
      currentPageIndex = initialPageIndex;
      setState(() {});
    });
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
      selectedValue = meterValues[currentPageIndex];
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
              padding: const EdgeInsets.only(left: 20.0, top: 30),
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
              padding: const EdgeInsets.only(left: 20.0, top: 50),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$selectedValue',
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
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Opacity(
                      opacity: 0.20,
                      child: Container(
                        width: 227,
                        height: 1,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
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
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                    _textListController.jumpTo(_pageController!.position.pixels);
                  }
                  return false;
                },
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemCount: meterValues.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            MeterItem(
                              value: meterValues[index],
                              isSelected: index == currentPageIndex,
                            ),

                          ],
                        );
                      },
                    ),
                  ],
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
    double itemWidth = 0; // Adjusted item width
    double itemHeight = isSelected ? 60.0 : 40.0;
    double itemPadding = 0;
    double viewportFraction = 0.120; // Initial fraction value

    if (value % 5 == 0 && value <= 100) {
      itemHeight += 20.0;
      itemWidth = 4.0;
      viewportFraction = 0.020; // Adjusted fraction value for divisible by 5 items
    }

    if (value % 5 != 0 && value <= 100) {
      itemPadding = 10;
      itemWidth = 1.5;
      viewportFraction = 0.0120; // Default fraction value for non-divisible by 5 items
    }

    String? underText;
    if (value % 5 == 0 && value <= 100) {
      underText = "$value";
    }

    // Calculate adjusted width for the green indicator
    double adjustedWidth = MediaQuery.of(context).size.width * viewportFraction * itemWidth;

    return GestureDetector(
      onTap: () {
        // Handle tap event to update selected item
        // You may want to implement this part
      },
      child: Padding(
        padding: isSelected ? EdgeInsets.only(top: 0) : EdgeInsets.only(top: itemPadding),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Column(
                children: [
                  Visibility(
                    visible: !isSelected,
                    child: Container(
                      width: itemWidth,
                      height: itemHeight,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  Container(
                    width: itemWidth,
                    height: 90,
                    color: isSelected ? Colors.red.withOpacity(0.7) : Colors.transparent,
                  ),
                  if (isSelected)
                    Container(
                      width: adjustedWidth, // Adjusted width based on viewport fraction and item width
                      height: 10, // Adjusted height
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                  if (underText != null) // Display under text if it's not null
                    Text(
                      underText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                ],
              ),
            ],
          ),
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
      ..style = PaintingStyle.stroke;

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
          Offset(0, startY), Offset(0, startY + dashWidth > size.height ? size.height : startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}