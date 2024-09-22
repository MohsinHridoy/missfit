import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/level_container_selection.dart';

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
  int selectedIndex = 0;
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
                title_textView("Quel est votre niveau \nd 'avancement ?"),
                SizedBox(height: 20),
                // buildLevelContainer(0, 'Light Activity', 'About 10-20 minutes'),
                // buildLevelContainer(1, 'Moderate Activity', 'About 30-40 minutes'),
                // buildLevelContainer(2, 'Pro Activity', 'About 40-60 minutes'),
                LevelContainer(
                  index: 0,
                  title: 'Débutante',
                  subtitle: 'Je suis nouveau à la salle de sport',
                  selectedIndex: selectedIndex,
                  onTap: handleLevelTap,
                ),
                LevelContainer(
                  index: 1,
                  title: 'Intermédiaire',
                  subtitle: 'Je connais mon chemin dans une salle de sport',
                  selectedIndex: selectedIndex,
                  onTap: handleLevelTap,
                ),
                LevelContainer(
                  index: 2,
                  title: 'Avance',
                  subtitle: 'Je suis un expert en salle de sport',
                  selectedIndex: selectedIndex,
                  onTap: handleLevelTap,
                ),

                Spacer(),
                Visibility(
                  visible: widget.status != 'profile',

                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0,right: 5,bottom: 5),
                    // child: GestureDetector(
                    //     onTap: () async{
                    //       setState(() {
                    //         isVisible=true;
                    //         widget.onNextPressed();
                    //
                    //       });
                    //     },
                    //     child: buildNextButton(context)
                    //
                    // ),

                    child:  customButtonRed(context, 'Suivante', onPressed: () async{
                      widget.onNextPressed();

                    }),

                  ),
                ),

                Visibility(
                  visible: widget.status == "profile",

                  child:  customButtonRed(context, 'Enregistrer et suivant', onPressed: () {
                    widget.onNextPressed();

                  }),



                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void handleLevelTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    saveSelectedIndex();
  }
}
