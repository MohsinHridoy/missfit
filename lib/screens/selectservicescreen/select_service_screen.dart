import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/servicedetails/service_details.dart';

import '../../widgets/custom_app_bar.dart';
class ServiceSelectionScreen extends StatefulWidget {
  const ServiceSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ServiceSelectionScreen> createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends State<ServiceSelectionScreen> {
  List<String> items = [
    'Bilan',
    'Coaching',
    'Programme d\'entraînement avec suivi',
    'Programme d\'entraînement sans suivi',
    'Pack 1 mois',
    'Pack 2 mois',
    'Pack 3 mois',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (_currentIndex < items.length - 1) {
          _currentIndex++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),

        child: Column(
          children: [
            CustomAppBar(
              title: 'Sélectionnez une prestation',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 8.3,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _currentIndex + 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
                    child: GestureDetector(
                      onTap: (){

                        navigateToNextPage(context,ServiceDetails());

                      },
                      child: Container(
                        width: 320.h,
                        height: 116,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 230,

                                child: Text(
                                  items[index],
                                  style: TextStyle(
                                    color: Color(0xFF1E293B),
                                    fontSize: 18,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,

                                  ),
                                ),
                              ),
                            ],
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
    );
  }
}