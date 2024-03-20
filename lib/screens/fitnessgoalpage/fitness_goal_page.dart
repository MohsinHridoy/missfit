

import 'package:flutter/material.dart';

import '../../common_widgets.dart';

class FitnessGoal extends StatefulWidget {
  @override
  _FitnessGoalState createState() => _FitnessGoalState();
}

class _FitnessGoalState extends State<FitnessGoal> {
  List<String> selectedTitles = [];

  void _handleSelectChanged(String title, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedTitles.add(title);
      } else {
        selectedTitles.remove(title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Your Page'),
      // ),
      body: Container(
        color: Color(0xFF18181B),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                  width: 320,
                  child: txt_headline("What is your current gym goal?")),
            ),
            SizedBox(
              height: 50,
            ),

            _buildSelectableTextContainer('Gain muscle'),
            _buildSelectableTextContainer('Building strength'),
            _buildSelectableTextContainer('Body shape improvement'),
            _buildSelectableTextContainer('Improving records'),
            _buildSelectableTextContainer('Boosting libido'),
            _buildSelectableTextContainer('Improve physical fitness'),

            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: buildNextButton(context),
            )
            // Add more SelectableTextContainer widgets here...
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableTextContainer(String text) {
    bool isSelected = selectedTitles.contains(text);

    return GestureDetector(
      onTap: () {
        _handleSelectChanged(text, !isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            // color: isSelected ? Colors.blue : Colors.grey,
            color: Color(0xFF252323),

            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isSelected ? Color(0xFFFFA142) : Colors.transparent,
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              isSelected
                  ? Image.asset(
                "assets/registration/icon_selected_box.png",
                scale: 1.5,
              )
                  : Image.asset(
                "assets/registration/icon_unselected_box.png",
                scale: 1.5,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 1.09,
                  ),
                ),
              ),
              // Icon(
              //   isSelected ? Icons.check_circle : Icons.circle,
              //   color: isSelected ? Colors.white : Colors.transparent,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}