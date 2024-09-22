import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';

class SliderPainter extends CustomPainter {
  final double progress;
  final double circleSize;
  final bool isDragging;

  SliderPainter({
    required this.progress,
    required this.circleSize,
    required this.isDragging,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint inactivePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    Paint activePaint = Paint()
      ..color = Color(0xFF9CA3AF)
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.square;

    Paint circleFillPaint = Paint()
      ..color = Color(0xFF9CA3AF)
      ..style = PaintingStyle.fill;

    Paint circleOutlinePaint = Paint()
      ..color = Colors.white // Outline color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0; // Outline width

    double activeHeight = (progress / 12.0) * size.height;
    double circleCenterY = size.height - activeHeight;

    // Draw inactive track
    canvas.drawLine(
        Offset(size.width / 2, 0), Offset(size.width / 2, size.height), inactivePaint);

    // Draw active track
    canvas.drawLine(
        Offset(size.width / 2, size.height), Offset(size.width / 2, circleCenterY), activePaint);

    // Draw draggable circle
    canvas.drawCircle(Offset(size.width / 2, circleCenterY), circleSize-7, circleFillPaint); // Circle fill
    canvas.drawCircle(Offset(size.width / 2, circleCenterY), circleSize-12, circleOutlinePaint); // Circle outline
  }

  @override
  bool shouldRepaint(SliderPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.circleSize != circleSize || oldDelegate.isDragging != isDragging;
  }
}
class VerticalProgressBar extends StatefulWidget {
  @override
  _VerticalProgressBarState createState() => _VerticalProgressBarState();
}

class _VerticalProgressBarState extends State<VerticalProgressBar>
    with SingleTickerProviderStateMixin {
  double progress = 0; // Initial progress value
  late AnimationController _controller;
  bool isEditable=true;

  bool isVisible = false;
  bool isVisible1 = false;
  TextEditingController controller = TextEditingController();
  bool isButtonRed = false; // Variable to hold button color state
  bool isButtonRedInVisible = false; // Variable to hold button color state

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Longer duration for smoother animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  bool isDragging = false; // Track whether dragging is occurring

  double circleSize = 20.0; // Default circle size
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: 'Abonnement',
            onBackTap: () {
              Navigator.pop(context);
              // navigateToNextPage(context, DashBoard(number: 3,));
            },
            iconSpacing: 3.8,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 20.0, top: 50.h),
            child: SizedBox(
              width: 320,
              child: Text(
                'Sélectionnez les mois',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 18,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.07,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: progress.toInt()>11?'12':'${progress.toInt()+1}',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 48,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.03,
                        ),
                      ),
                      TextSpan(
                        text: 'mois',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.08,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
                  child: Container(
                    width: 170,
                    height: 35,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          progress.toInt()>11?'Total: CHF ${12 * 970}':  'Total: CHF ${(progress.toInt()+1) * 970}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF22C55E),
                            fontSize: 18,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 17,
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: 325.h,


            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(12, (index) {
                        int number =
                            12 - index; // Adjusted to reverse the numbering
                        return Container(
                          width: 30,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            '$number',
                            style: TextStyle(
                              color: number <= progress+1
                                  ? Color(0xFFFFA142)
                                  : Color(0xFF94A3B8),
                              // Adjusted condition
                              fontSize: 20,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 01.1,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(width: 10),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0,bottom: 4),
                  child: Container(
                    height: 320.h, // Height of the slider
                    width: 40.0, // Width of the slider
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        setState(() {
                          progress = (12 - ((details.localPosition.dy / 310) * 12).clamp(0, 12)).toDouble();

                          print(progress.toInt());
                        });
                      },
                      onPanDown: (details) {
                        setState(() {
                          isDragging = true;
                          circleSize = 20.0; // Increase circle size when touch starts
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          isDragging = false;
                          circleSize = 20.0; // Reset circle size when touch ends
                        });
                      },
                      child: CustomPaint(
                        painter: SliderPainter(progress: progress, circleSize: circleSize, isDragging: isDragging),
                      ),
                    ),
                  ),
                ),
                  // Container(
                  //   height: 300.h, // Make sure this height matches the number column
                  //
                  //   child: RotatedBox(
                  //     quarterTurns: 3,
                  //     child: Slider(
                  //       secondaryActiveColor: Colors.red,
                  //       inactiveColor: Colors.white,
                  //       activeColor: Color(0xFF9CA3AF),
                  //       value: progress.toDouble(),
                  //       min: 0,
                  //       max: 12,
                  //       divisions: 12,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           progress = value;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),
              ],
            ),
          ),

          Spacer(),
          // Adding space between widgets

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () {
                _showBottomSheet();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: ShapeDecoration(
                  color: Color(0xFFFF4343),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'Continuer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Archivo-Semibold',
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
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: isButtonRedInVisible != true ? 340:414,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                  "assets/subscription/img_promo_code.png"),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 320,
                              child: Text(
                                isButtonRedInVisible != true ? 'Avez-vous un code promo ?':"Félicitations, votre code promotionnel a été appliqué avec succès",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 20,
                                  fontFamily: 'Kanit-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 1.06,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 44,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD1D5DB)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 13.0, left: 15),
                                        child: TextFormField(
                                          controller: controller,
                                          enabled: isEditable,
                                          onChanged: (value) {
                                            setState(() {
                                              // Update button color state based on text length
                                              if (value.length > 4) {
                                                isButtonRed = true;
                                              } else {
                                                isButtonRed = false;
                                              }
                                            });
                                          },
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 1.10,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'code',
                                            hintStyle: TextStyle(
                                              color: Color(0xFFD1D5DB),
                                              fontSize: 14,
                                              fontFamily: 'Archivo-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    isButtonRedInVisible != true
                                        ? GestureDetector(
                                            onTap: () {
                                              if (isButtonRed) {
                                                setState(() {
                                                  isButtonRedInVisible =
                                                      true; // Make the button invisible
                                                  isEditable=false;
                                                });
                                              }
                                            },
                                            child: Container(
                                              width: 93.47,
                                              decoration: ShapeDecoration(
                                                color: isButtonRed
                                                    ? Color(0xFFFF4343)
                                                    : Color(0xFFD1D5DB),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4),
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Appliquer',
                                                  style: TextStyle(
                                                    color: isButtonRed
                                                        ? Colors.white
                                                        : Color(0xFF66758C),
                                                    fontSize: 14,
                                                    fontFamily:
                                                        'Archivo-SemiBold',
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.only(
                                                right: 13.0, left: 2),
                                            child: GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  isButtonRed = false;
                                                  isEditable=true;
                                                  isButtonRedInVisible =
                                                  false; // Make the button invisible
                                                  controller.clear();

                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/subscription/icon_cross.png",
                                                    scale: 2,
                                                  ),
                                                  Text(
                                                    'Retirer',
                                                    style: TextStyle(
                                                      color: Color(0xFFEF4444),
                                                      fontSize: 14,
                                                      fontFamily:
                                                          'Archivo-Medium',
                                                      fontWeight: FontWeight.w500,
                                                      height: 1.10,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Visibility(
                                visible: isButtonRedInVisible,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22.0,bottom: 10,top: 5),
                                  child: Text(
                                    "Vous bénéficiez d'une réduction de CHF 60.",
                                    style: TextStyle(
                                      color: Color(0xFF22C55E),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 8),
                              child: isButtonRedInVisible?customButtonRed(context, 'Continue', onPressed: () {
                                navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                              }):GestureDetector(
                                  onTap: (){
                                    navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                                  },
                                  child: outlineButton(context,'Sauter')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final int progress;
  final double waveValue;

  WaveClipper(this.progress, this.waveValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    final heightFactor = progress / 12;
    path.lineTo(0, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
