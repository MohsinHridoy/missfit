import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';

class WorkOutLevelSelectionPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  String? status;

  WorkOutLevelSelectionPage(
      {Key? key, required this.onNextPressed, this.status})
      : super(key: key);

  @override
  _WorkOutLevelSelectionPageState createState() =>
      _WorkOutLevelSelectionPageState();
}

class _WorkOutLevelSelectionPageState extends State<WorkOutLevelSelectionPage> {
  int selectedIndex = 1;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    loadSelectedIndex();
  }

  Future<void> loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    int? savedIndex = prefs.getInt('selectedIndex');
    if (savedIndex != null) {
      setState(() {
        selectedIndex = savedIndex;
      });
    }
  }

  Future<void> saveSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedIndex'); // Remove the old selectedIndex
    await prefs.setInt(
        'selectedIndex', selectedIndex); // Save the new selectedIndex
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 5),
                txt_headline('What is your advacement \nlevel?'),
                SizedBox(height: 20),
                // buildLevelContainer(0, 'Light Activity', 'About 10-20 minutes'),
                // buildLevelContainer(1, 'Moderate Activity', 'About 30-40 minutes'),
                // buildLevelContainer(2, 'Pro Activity', 'About 40-60 minutes'),
                buildLevelContainer(0, 'Beginner', 'I am new to the gym'),
                buildLevelContainer(
                    1, 'Intermediate', 'I know my way around a gym'),
                buildLevelContainer(2, 'Advanced', 'I am an expert in the gym'),
                Spacer(),
                Visibility(
                  visible: widget.status != 'profile',

                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15),
                    child: GestureDetector(
                        onTap: () async{
                          setState(() {
                            isVisible=true;
                            widget.onNextPressed();

                          });
                        },
                        child: buildNextButton(context)

                    ),
                  ),
                ),
                Visibility(
                  visible: widget.status == 'profile',

                  child: GestureDetector(
                    onTap: (){
                      widget.onNextPressed();

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 52,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 112, vertical: 17),
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Text(
                          'Save Change',
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLevelContainer(int index, String title, String subtitle) {
    Color titleColor =
        index == selectedIndex ? Color(0xFFE88E32) : Color(0xFF334155);
    Color borderColor =
        index == selectedIndex ? Color(0xFFFFA142) : Color(0xFFE5E7EB);

    return GestureDetector(
      onTap: () async {
        setState(() {
          selectedIndex = index;
        });
        await saveSelectedIndex(); // Save the index as soon as it's selected
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          width: 320,
          height: 84,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 18,
                  fontFamily: 'Archivo-Medium',
                  fontWeight: FontWeight.w500,
                  height: 1.08,
                ),
              ),
              SizedBox(height: 10),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
