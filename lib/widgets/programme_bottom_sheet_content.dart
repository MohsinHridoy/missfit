import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../common_utils.dart';
import '../screens/workout_viewer_screen/workout_viewer_screen-test_002.dart';
import 'common_buttons.dart';

class BottomSheetContent extends StatefulWidget {
  VoidCallback? onContinue;
  BottomSheetContent({Key? key, this.onContinue}) : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<bool> selectedDays = List.filled(7, false);
  int selectedCount = 0;
  final TextEditingController _textController = TextEditingController();
  bool showErrorMessage = false;

  @override
  void initState() {
    super.initState();
    // Set the current date as the default value in the text controller
    _textController.text = "${DateTime.now().toLocal()}".split(' ')[0];
  }

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
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                  repeat: false,
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
                // navigateToNextPage(context, ChallengeScreen());
                Navigator.pop(context);
                widget.onContinue!();
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
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        height: showErrorMessage?360.h:340.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select Date',
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16,
                      fontFamily: 'Archivo-Medium',
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 40),
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
                          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE2E8F0)),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today, color: Color(0xFFE2E8F0)),
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
                   SizedBox(height: 25,),
                  Container(
                    height: 100.h,
                    width: 230.h,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: 98 / 82,
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
                            height: 48,


                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1,
                                    color: selectedDays[index]
                                        ? Color(0xFFFFA142)
                                        : Color(0xFFD1D5DB)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                days[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: selectedDays[index]
                                      ? Color(0xFFE88E32)
                                      : Color(0xFF334155),
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

                ],
              ),
            ),



            if(showErrorMessage)
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'You can select only 3 days',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 16,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.09,
                  ),
                ),
              ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, right: 5, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                  SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        _showCongratulationsBottomSheet();
                      },
                      child: Container(
                        width: 150,
                        height: 52,
                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
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
