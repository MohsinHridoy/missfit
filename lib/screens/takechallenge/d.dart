import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> chipItemsChallenges = [
    'Lose Weight',
    'Calorie Burn',
    'Cardio',
    'Strength',
    'Six Pack',
    'Yoga',
    'Yoga',
  ];

  final List<String> chipItemsDifficulty = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];

  final List<String> chipItemsDuration = [
    '10-20 min',
    '20-30 min',
    '30-40 min',
    '40-50+ min',
  ];

  final List<String> selectedChallenges = [];
  String? selectedDifficulty;
  String? selectedDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 200),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildTitle('Challenge Type'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Wrap(
              spacing: 12.0, // Spacing between items
              runSpacing: 12.0, // Spacing between lines
              children: chipItemsChallenges.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedChallenges.contains(item)) {
                        selectedChallenges.remove(item);
                      } else {
                        selectedChallenges.add(item);
                      }
                    });
                  },
                  child: _buildItem(item, selectedChallenges.contains(item)),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 25),
            child: _buildTitle('Difficulty'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Wrap(
              spacing: 12.0, // Spacing between items
              runSpacing: 12.0, // Spacing between lines
              children: chipItemsDifficulty.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedDifficulty == item) {
                        selectedDifficulty = null;
                      } else {
                        selectedDifficulty = item;
                      }
                    });
                  },
                  child: _buildItem(item, selectedDifficulty == item),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 25),
            child: _buildTitle('Duration'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: Wrap(
              spacing: 12.0, // Spacing between items
              runSpacing: 12.0, // Spacing between lines
              children: chipItemsDuration.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (selectedDuration == item) {
                        selectedDuration = null;
                      } else {
                        selectedDuration = item;
                      }
                    });
                  },
                  child: _buildItem(item, selectedDuration == item),
                );
              }).toList(),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: ShapeDecoration(
                color: Color(0xFFFF4343),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Archivo-Semibold',
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle(String title) {
    return SizedBox(
      width: 320,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 20,
          fontFamily: 'Kanit-Medium',
          fontWeight: FontWeight.w500,
          height: 0.06,
        ),
      ),
    );
  }

  Widget _buildItem(String item, bool isSelected) {
    return Container(
      height: 36,
      decoration: ShapeDecoration(
        color: isSelected ? Colors.white:Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color:isSelected ?  Color(0xFFFFA142):Color(0xFFD1D5DB),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 13.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 12.0),
              child: Text(
                item,
                style: TextStyle(
                  color: isSelected ?  Color(0xFFE88E32):Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}