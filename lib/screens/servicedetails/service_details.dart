import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glossy/glossy.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/timeselectionscreen/select_time_screen.dart';

import '../../widgets/common_buttons.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/servicedetails/img_service_details.png',
                        width: 515,
                        height: 348,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 325),
                      // Adjust top margin to fit the image height
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(
                              40), // Adjust the radius as needed
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: Text(
                              'Bilan',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 24,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 0.06,
                              ),
                            ),
                          ),
                          SizedBox(height: 25.h),
                          // Add some spacing between text and containers
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                _buildIndicatorContainer(
                                    'assets/servicedetails/icon_clock.png',
                                    '30 min'),
                                SizedBox(width: 10),
                                // Add spacing between containers
                                _buildIndicatorContainer(
                                    'assets/servicedetails/icon_level.png',
                                    'Intermediate'),
                                SizedBox(width: 10),
                                // Add spacing between containers
                                _buildIndicatorContainer(
                                    'assets/servicedetails/icon_burning_calories.png',
                                    '247 cal'),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.h),
                          // Add some spacing between text and containers
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Aperçu',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                           SizedBox(height: 20.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              width: 320,
                              child: Text(
                                'The assessment with our coach represents a crucial step in your fitness journey. During this in-depth session, we perform a detailed fitness assessment, including taking anthropometric measurements, an assessment of your current fitness level, and an in-depth discussion of your medical history and personal goals. Then, in collaboration with you, we establish a tailor-made action plan, identifying areas for improvement, defining realistic objectives and choosing the types of training best suited to your profile. By investing in this assessment, you benefit from a personalized program that maximizes your chances of success and lasting progress.',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35.h),
                          // Add some spacing between text and containers
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Nous ferons',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                           SizedBox(height: 25.h),

                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildTaskListText(
                                    'Évaluation détaillée de la condition physique'),
                                const SizedBox(height: 12),
                                _buildTaskListText(
                                    'Mesures anthropométriques'),
                                const SizedBox(height: 12),
                                _buildTaskListText(
                                    'Évaluation du niveau de forme physique actuel'),
                              ],
                            ),
                          ),
                          SizedBox(height: 35.h),
                          // Add some spacing between text and containers
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Résultat attendu',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _buildTaskListText("Plan d'action"),
                                const SizedBox(height: 12),
                                _buildTaskListText('Programme personnalisé'),
                              ],
                            ),
                          ),
                          SizedBox(height: 130),
                          // Add some spacing between text and containers
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            // child: Padding(
            //   padding: const EdgeInsets.only(left: 0.0, top: 25, bottom: 20),
            //   child:
            //
            //     customButtonRed(context, 'Continue', onPressed: () {
            //       navigateToNextPage(context, TImeSelectionScreen());
            //
            //     })
            // ),
            child: GlossyContainer(
              width: MediaQuery.of(context).size.width,
              blendMode: BlendMode.srcATop,
              // opacity:0.1,
              color: Colors.white.withOpacity(0.04),
              height: 76,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 76,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.10999999940395355),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [


                          Text(
                            'Frais de réservation',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 10,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.14,
                            ),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          SizedBox(
                            width: 161,
                            child: Text(
                              'CHF 210',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w500,
                                height: 1.09,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                                navigateToNextPage(context, TImeSelectionScreen());
                        },
                        child: Container(
                          width: 150,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4343),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Continuer',
                              textAlign: TextAlign.center,
                              // Ensure text alignment is centered

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 1.10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context); // This will pop the current route off the stack

              },
              child: Container(
                width: 32,
                height: 32,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05000000074505806),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(child: Image.asset("assets/servicedetails/icon_back_arrow.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskListText(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/servicedetails/icon_rounded_tik_mark.png',
          scale: 1.8,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF475569),
                fontSize: 14,
                fontFamily: 'Archivo-Medium',
                fontWeight: FontWeight.w500,
                height: 1.10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicatorContainer(String imgUrl, String text) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: Color(0xFFE5E7EB), // Add the desired color here
        borderRadius: BorderRadius.circular(5), // Add border radius if needed
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imgUrl,
              scale: 1.8,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 12,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 1.12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
