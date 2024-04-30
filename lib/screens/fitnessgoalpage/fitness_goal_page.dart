

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';

class FitnessGoal extends StatefulWidget {
  @override
  _FitnessGoalState createState() => _FitnessGoalState();
}

class _FitnessGoalState extends State<FitnessGoal> {
  List<String> selectedTitles = [];

  @override
  void initState() {
    super.initState();
    loadSelectedItems();
  }

  Future<void> loadSelectedItems() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedTitles = prefs.getStringList('selectedTitles');
    if (savedTitles != null) {
      setState(() {
        selectedTitles = savedTitles;
      });
    }
  }

  Future<void> saveSelectedItems() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selectedTitles', selectedTitles);
  }

  void _handleSelectChanged(String title, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedTitles.add(title);
      } else {
        selectedTitles.remove(title);
      }
    });
    saveSelectedItems(); // Save the selected items whenever selection changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 320,
                child: txt_headline("What is your current gym goal?"),
              ),
            ),
            SizedBox(height: 20),
            _buildSelectableTextContainer('Gain muscle'),
            _buildSelectableTextContainer('Building strength'),
            _buildSelectableTextContainer('Body shape improvement'),
            _buildSelectableTextContainer('Improving records'),
            _buildSelectableTextContainer('Boosting libido'),
            _buildSelectableTextContainer('Improve physical fitness'),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20,bottom: 30),
              child: buildNextButton(context),
            ),
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
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isSelected ? Color(0xFFFFA142) :  Color(0xFFE5E7EB),
              width: 1,
            ),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              isSelected
                  ? Image.asset(
                "assets/registration/icon_selected_box.png",
                scale: 1.9,
              )
                  : Image.asset(
                "assets/registration/icon_unselected_box.png",
                scale: 1.9,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  text,
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
        ),
      ),
    );
  }
}