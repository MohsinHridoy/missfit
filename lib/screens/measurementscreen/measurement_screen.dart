import 'package:flutter/material.dart';

// class MeasurementScreen extends StatefulWidget {
//   const MeasurementScreen({super.key});
//
//   @override
//   State<MeasurementScreen> createState() => _MeasurementScreenState();
// }
//
// class _MeasurementScreenState extends State<MeasurementScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//

class MeterScroll extends StatefulWidget {
  @override
  _MeterScrollState createState() => _MeterScrollState();
}

class _MeterScrollState extends State<MeterScroll> {
  final List<int> meterValues = List.generate(12, (index) => index + 1);
  PageController? _pageController; // Declare PageController as nullable
  int currentPageIndex = 5; // Initial selected index (item 6)
  int selectedValue = 56; // Initial selected value

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Initialize PageController after the first frame
      _pageController =
          PageController(viewportFraction: 0.15, initialPage: currentPageIndex);
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
      appBar: AppBar(
        title: Text('Meter Scroll'),
      ),
      body: Container(
        color: Color(0xFF18181B),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What is your weight?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
                height: 1.05,
              ),
            ),
            Text.rich(
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
            Container(
              height: 80,
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
            Row(
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
                Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 32,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'LBS',
                  style: TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 20,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                  ),
                )
              ],
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
      color: Colors.purple.withOpacity(0.4),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 100,
                child: Row(
                  children: [
                    meterItem(),
                    meterItem(),
                    meterItem(),
                    meterItem(),
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
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 20,
              child: Text(
                "$value",
                style: TextStyle(
                    color: isSelected ? Colors.transparent : Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget meterItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: Container(
        width: 2,
        height: 35,
        color: Colors.grey.withOpacity(0.4),
      ),
    );
  }
}

// class MeterScroll extends StatefulWidget {
//   @override
//   _MeterScrollState createState() => _MeterScrollState();
// }
//
// class _MeterScrollState extends State<MeterScroll> {
//   final List<int> meterValues = List.generate(12, (index) => index + 1);
//   final PageController _pageController = PageController(viewportFraction: 0.25, initialPage: 6); // Start at index 6
//
//   int currentPageIndex = 6; // Initial selected index (index 6)
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(_pageListener);
//   }
//
//   @override
//   void dispose() {
//     _pageController.removeListener(_pageListener);
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   void _pageListener() {
//     setState(() {
//       currentPageIndex = _pageController.page!.round();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Meter Scroll'),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             child: PageView.builder(
//               controller: _pageController,
//               scrollDirection: Axis.horizontal,
//               itemCount: meterValues.length,
//               itemBuilder: (context, index) {
//                 return MeterItem(
//                   value: meterValues[index],
//                   isSelected: index == currentPageIndex,
//                   onChanged: (selectedValue) {
//                     setState(() {
//                       currentPageIndex = meterValues.indexOf(selectedValue);
//                       _pageController.animateToPage(currentPageIndex, duration: Duration(milliseconds: 500), curve: Curves.ease);
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           SizedBox(height: 20),
//           Text(
//             'Selected Value: ${meterValues[currentPageIndex]}',
//             style: TextStyle(fontSize: 20),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MeterItem extends StatelessWidget {
//   final int value;
//   final bool isSelected;
//   final ValueChanged<int> onChanged;
//
//   const MeterItem({
//     Key? key,
//     required this.value,
//     required this.isSelected,
//     required this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onChanged(value);
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Text("$value Ft", style: TextStyle(color: isSelected ? Colors.red : Colors.black)),
//             Row(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 2),
//                   width: 1,
//                   height: isSelected ? 30 : 20,
//                   color: isSelected ? Colors.red : Colors.blue,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
