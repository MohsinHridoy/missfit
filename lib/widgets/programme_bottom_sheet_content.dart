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
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
        child: Container(
          height: 265.h,
          color: Colors.white,
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizedBox(
                height: 100.w,
                width: 100.w,
                child: Lottie.asset(
                  'assets/lottie_anim/tik_anim.json',
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: Text(
                  'Votre planning est terminé',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 24.sp,
                    fontFamily: 'Archivo-SemiBold',
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
              ),
              Spacer(),
              customButtonRed(context, 'Continuer', onPressed: () {
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
    // Adjust height dynamically based on the visibility of the error message
    double bottomSheetHeight = showErrorMessage ? 450.h : 380.h;

    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),

      ),
      padding: EdgeInsets.all(16.w),
      height: bottomSheetHeight, // Dynamically adjust height
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, left: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Date',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16.sp,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: TextField(
                    controller: _textController,
                    readOnly: true,
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16.sp,
                      fontFamily: 'Archivo-Medium',
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Starting Date',
                      labelStyle: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 12.sp,
                        fontFamily: 'Archivo-Regular',
                        fontWeight: FontWeight.w400,
                        height: 1.2,
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

                      suffixIcon: GestureDetector(
                          onTap: () async{
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
                          child: Image.asset('assets/takechallenge/icon_calendar.png',scale: 2,)),
                    ),
                  ),
                ),
                Text(
                  'Jour',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16.sp,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  height: 100.h,
                  width: 230.w,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 14.h,
                      crossAxisSpacing: 14.w,
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
                          height: 48.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.w,
                                  color: selectedDays[index]
                                      ? Color(0xFFFFA142)
                                      : Color(0xFFD1D5DB)),
                              borderRadius: BorderRadius.circular(8.r),
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
                                fontSize: 14.sp,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.1,
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
              padding: EdgeInsets.only(top: 5.h),
              child: SizedBox(
                height: 25,
                child: Text(
                  'You can select only 3 days',
                  style: TextStyle(
                    color: Color(0xFFEF4444),
                    fontSize: 14.sp, // Reduce font size for small screens
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
            ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: showErrorMessage?8.h:20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 52.h,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.w, color: Color(0xFFFF4343)),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Annuler',
                          style: TextStyle(
                            color: Color(0xFFFF4343),
                            fontSize: 16.sp,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _showCongratulationsBottomSheet();
                    },
                    child: Container(
                      width: 150.w,
                      height: 52.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r)),
                      ),
                      child: Center(
                        child: Text(
                          'Calendrier',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.2,
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
    );
  }
}
