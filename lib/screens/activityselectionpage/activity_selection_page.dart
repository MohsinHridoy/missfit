import 'package:flutter/material.dart';

import '../../common_widgets.dart';



class ActivitySelectionPage extends StatefulWidget {
  const ActivitySelectionPage({Key? key}) : super(key: key);

  @override
  _ActivitySelectionPageState createState() => _ActivitySelectionPageState();
}

class _ActivitySelectionPageState extends State<ActivitySelectionPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF18181B),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            txt_headline('How long do you like to workout for?'),
            SizedBox(height: 50),
            buildLevelContainer(0, 'Light Activity', 'About 10-20 minutes'),
            buildLevelContainer(1, 'Moderate Activity', 'About 30-40 minutes'),
            buildLevelContainer(2, 'Pro Activity', 'About 40-60 minutes'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: buildNextButton(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLevelContainer(int index, String title, String subtitle) {
    Color titleColor = index == selectedIndex ? Colors.red : Color(0xFFFFA142);
    Color borderColor = index == selectedIndex ? Colors.red : Color(0xFF252323);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
        child: Container(
          width: 320,
          height: 84,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Color(0xFF252323),
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
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w500,
                  height: 1.08,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 14,
                  fontFamily: 'Archivo',
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