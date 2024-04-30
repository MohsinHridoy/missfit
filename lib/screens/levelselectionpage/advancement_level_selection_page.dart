import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';

// class AdvanceLevelSelectionPage extends StatefulWidget {
//   const AdvanceLevelSelectionPage({Key? key}) : super(key: key);
//
//   @override
//   _AdvanceLevelSelectionPageState createState() => _AdvanceLevelSelectionPageState();
// }
//
// class _AdvanceLevelSelectionPageState extends State<AdvanceLevelSelectionPage> {
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Color(0xFF18181B),
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 50),
//             txt_headline('What is your advancement level?'),
//             SizedBox(height: 50),
//             buildLevelContainer(0, 'Beginner', 'I am new to the gym'),
//             buildLevelContainer(1, 'Intermediate', 'I know my way around a gym'),
//             buildLevelContainer(2, 'Advanced', 'I am an expert in the gym'),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0,right: 20),
//               child: buildNextButton(context),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildLevelContainer(int index, String title, String subtitle) {
//     Color titleColor = index == selectedIndex ? Colors.red : Color(0xFFFFA142);
//     Color borderColor = index == selectedIndex ? Colors.red : Color(0xFF252323);
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
//         child: Container(
//           width: 320,
//           height: 84,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             color: Color(0xFF252323),
//             border: Border.all(
//               width: 1,
//               color: borderColor,
//             ),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: titleColor,
//                   fontSize: 18,
//                   fontFamily: 'Archivo',
//                   fontWeight: FontWeight.w500,
//                   height: 1.08,
//                 ),
//               ),
//               SizedBox(height: 4),
//               Text(
//                 subtitle,
//                 style: TextStyle(
//                   color: Color(0xFFCBD5E1),
//                   fontSize: 14,
//                   fontFamily: 'Archivo',
//                   fontWeight: FontWeight.w400,
//                   height: 1.11,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
// }


class AdvanceLevelSelectionPage extends StatefulWidget {
  const AdvanceLevelSelectionPage({Key? key}) : super(key: key);

  @override
  _AdvanceLevelSelectionPageState createState() => _AdvanceLevelSelectionPageState();
}

class _AdvanceLevelSelectionPageState extends State<AdvanceLevelSelectionPage> {
  int selectedIndex = 1;
  bool isVisible=false;

  @override
  void initState() {
    super.initState();
    loadSelectedIndex();
  }


  Future<void> loadSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    int? savedIndex = prefs.getInt('selectedIndexAdvanceLevel');
    if (savedIndex != null) {
      setState(() {
        selectedIndex = savedIndex;
      });
    }
  }

  Future<void> saveSelectedIndex() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selectedIndexAdvanceLevel');  // Remove the old selectedIndex
    await prefs.setInt('selectedIndexAdvanceLevel', selectedIndex);  // Save the new selectedIndex
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color:  Color(0xFFF6F6F6),
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                SizedBox(width:50,child: txt_headline('What is your advacement \nlevel?')),
                SizedBox(height: 50),
                            buildLevelContainer(0, 'Beginner', 'I am new to the gym'),
            buildLevelContainer(1, 'Intermediate', 'I know my way around a gym'),
            buildLevelContainer(2, 'Advanced', 'I am an expert in the gym'),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: GestureDetector(
                      onTap: () async{
                        setState(() {
                          isVisible=true;
                        });
                      },
                      child: buildNextButton(context)

                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }

  Widget buildLevelContainer(int index, String title, String subtitle) {
    Color titleColor = index == selectedIndex ? Color(0xFFE88E32) : Color(0xFF334155);
    Color borderColor = index == selectedIndex ? Color(0xFFFFA142): Color(0xFFE5E7EB);

    return GestureDetector(
      onTap: () async{
        setState(() {
          selectedIndex = index;
        });
        await saveSelectedIndex();  // Save the index as soon as it's selected

      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
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
                  fontFamily: 'Archivo',
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
