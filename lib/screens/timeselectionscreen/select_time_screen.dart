import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';

import '../reviewsummery/review_summery_screen.dart';



class TImeSelectionScreen extends StatefulWidget {
  @override
  _TImeSelectionScreenState createState() => _TImeSelectionScreenState();
}

class _TImeSelectionScreenState extends State<TImeSelectionScreen> {
  int _selectedIndex = -1; // To keep track of the selected index
  final List<String> _timeSlots = [
    "10:00 AM",
    "10:30 AM",
    "11:00 AM",
    "11:30 AM",
    "12:00 PM",
    "12:30 PM",
    "1:00 PM",
    "1:30 PM",
    "2:00 PM",
    "2:30 PM",
    "3:00 PM",
    "3:30 PM"
  ];

  final List<String> _daysOfWeek = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];

  int _selectedDayIndex = 0; // To keep track of the selected day index

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: Color(0xFFF6F6F6),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 97,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                border: Border.all(color: Colors.white.withOpacity(0.11)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 4.1),
                    Text(
                      'Select Your Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Kanit-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),

            SizedBox(height: 35,),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Day',
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 18,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 70, // Fixed height for the day selection row
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _daysOfWeek.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDayIndex = index; // Update selected day index
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 70,
                          height: 65,
                          decoration: BoxDecoration(
                            color: _selectedDayIndex == index
                                ? Color(0xFFFFA142)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _selectedDayIndex == index
                                  ? Color(0xFFFFA142)
                                  : Color(0xFFE5E7EB),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              _daysOfWeek[index],

                              style: TextStyle(
                                color: _selectedDayIndex == index
                                    ? Colors.white:Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 35,),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Time',
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 18,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 96 / 52, // Aspect ratio of the items
                  ),
                  itemCount: _timeSlots.length, // Number of items in the grid
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index; // Update selected index
                        });
                      },
                      child: Container(
                        width: 96,
                        height: 52,
                        padding: const EdgeInsets.all(16),
                        decoration: _selectedIndex == index
                            ? ShapeDecoration(
                          color: Color(0xFFFFA142),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                            : ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _timeSlots[index],
                            style: TextStyle(
                              color:  _selectedIndex == index
                                  ? Colors.white
                                  : Color(0xFF334155),
                              fontSize: 14,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 25,bottom: 20,right: 20),
              child: GestureDetector(
                onTap: (){


                  navigateToNextPage(context,ReviewSummary());

                },
                child: Container(
                  width: 370,
                  height: 52,

                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
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