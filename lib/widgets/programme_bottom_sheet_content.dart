


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../common_utils.dart';
import '../screens/workout_viewer_screen/workout_viewer_screen-test_002.dart';
import 'common_buttons.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<bool> selectedDays = List.filled(7, false);
  int selectedCount = 0;
  final TextEditingController _textController = TextEditingController();
  bool showErrorMessage = false;
  void _showCongratulationsBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40), // Adjust the radius as needed
          topRight: Radius.circular(40), // Adjust the radius as needed
        ),

        child: Container(
          height: 265,
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  'assets/lottie_anim/tik_anim.json',
                  // Path to the Lottie JSON file in the assets folder
                  height: 200, // Adjust height as needed
                  width: 200, // Adjust width as needed
                  fit: BoxFit.cover, // Adjust the fit
                  repeat: false, // Play animation only once
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  'Votre planning est terminé',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 24,
                    fontFamily: 'Archivo-SemiBold',
                    fontWeight: FontWeight.bold,
                    height: 0.08,

                  ),
                ),
              ),
             Spacer(),
              customButtonRed(context, 'Continuer', onPressed: () {
                // widget.onNextPressed();
                navigateToNextPage(context,ChallengeScreen());

              })
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40), // Adjust the radius as needed
        topRight: Radius.circular(40), // Adjust the radius as needed
      ),

      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,left: 5),
              child: Text(
                'Select Date',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: TextField(
                controller: _textController,
                readOnly: true,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.09,
                ),
                decoration: InputDecoration(
                  labelText: 'Starting Date',
                  labelStyle: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 12,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE2E8F0)), // Grey border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE2E8F0)), // Grey border color when focused
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE2E8F0)), // Grey border color when enabled
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today,color:Color(0xFFE2E8F0) ,),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _textController.text =
                          "${pickedDate.toLocal()}".split(' ')[0];
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Jour',
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 16,
                fontFamily: 'Archivo-Medium',
                fontWeight: FontWeight.w500,
                height: 0.09,
              ),
            ),
            Container(
              height: 90.h,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 88 / 48,
                ),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!selectedDays[index]) {
                          if (selectedCount < 3) {
                            selectedDays[index] = true;
                            selectedCount++;
                            showErrorMessage = false;
                          } else {
                            showErrorMessage = true;
                          }
                        } else {
                          selectedDays[index] = false;
                          selectedCount--;
                          showErrorMessage = false;
                        }
                      });
                    },
                    child: Container(
                      width: 56,
                      height: 48,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: ShapeDecoration(
                        // color:
                        // selectedDays[index] ? Color(0xFFD1D5DB) : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: selectedDays[index] ?Color(0xFFFFA142):Color(0xFFD1D5DB)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          days[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: selectedDays[index]
                                ? Color(0xFFE88E32)
                                :  Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 1.10,

                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 5),
            Visibility(
              visible: showErrorMessage,
              child: Text(
                'You can select only 3 days',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 16,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.09,
                ),
              ),
            ),
            SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5, bottom: 1, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(
                            context); // Close the modal when tapped
                      },
                      child: Container(
                        height: 52,

                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1, color: Color(0xFFFF4343)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              color: Color(0xFFFF4343),
                              fontSize: 16,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.09,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print("Second button clicked");
                        Navigator.pop(context); // Close the bottom sheet after a delay

                        _showCongratulationsBottomSheet();


                      },
                      child: Container(
                        width: 150,
                        height: 52,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(8)),
                        ),
                        child: Center(
                          child: Text(
                            'Calendrier',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.09,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}