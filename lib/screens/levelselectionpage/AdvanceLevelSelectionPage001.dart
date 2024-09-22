import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/common_buttons.dart';
import '../../widgets/level_container_selection.dart';
import '../dashboard/dashboard.dart';

class AdvanceLevelSelectionPage001 extends StatefulWidget {
  final ValueChanged<bool> onVisibilityChange;
  String? status;

  AdvanceLevelSelectionPage001(
      {Key? key, required this.onVisibilityChange, this.status})
      : super(key: key);

  @override
  _AdvanceLevelSelectionPageState001 createState() =>
      _AdvanceLevelSelectionPageState001();
}

class _AdvanceLevelSelectionPageState001
    extends State<AdvanceLevelSelectionPage001> {
  int selectedIndex = 1;
  bool isVisible = false;

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
    await prefs
        .remove('selectedIndexAdvanceLevel'); // Remove the old selectedIndex
    await prefs.setInt('selectedIndexAdvanceLevel',
        selectedIndex); // Save the new selectedIndex
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 5),
                  SizedBox(
                      child: title_textView(
                          'Pendant combien de temps  aimez-vous vous entraîner ?')),
                  SizedBox(height: 20),
                  LevelContainer(
                    index: 0,
                    title: 'Activité légère',
                    subtitle: 'Environ 10-20 minutes',
                    selectedIndex: selectedIndex,
                    onTap: handleLevelTap,
                  ),
                  LevelContainer(
                    index: 1,
                    title: 'Activité modérée',
                    subtitle: 'Environ 30 - 40 minutes',
                    selectedIndex: selectedIndex,
                    onTap: handleLevelTap,
                  ),
                  LevelContainer(
                    index: 2,
                    title: 'Activité professionnelle',
                    subtitle:  'Environ 40 - 60 minutes',
                    selectedIndex: selectedIndex,
                    onTap: handleLevelTap,
                  ),

                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5, bottom: 5),
                    child: Visibility(
                      visible: widget.status != 'profile',
                      child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            isVisible = true;
                            widget.onVisibilityChange(
                                isVisible); // Notify parent widget about visibility change
                          });
                        },
                        child: buildNextButton(context),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: widget.status == "profile",

                    child:  customButtonRed(context, 'Sauvegarder', onPressed: () {
                      navigateToNextPage(context,DashBoard(number: 3,));

                    }),



                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible && widget.status != 'profile',
              child: Opacity(
                opacity: 0.80,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(color: Color(0xFF111827)),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Visibility(
                visible: isVisible && widget.status != 'profile',
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 303,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
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
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.asset(
                          'assets/lottie_anim/tik_anim.json',
                          // Path to the Lottie JSON file in the assets folder
                          height: 200, // Adjust height as needed
                          width: 200, // Adjust width as needed
                          fit: BoxFit.cover, // Adjust the fit
                          repeat: false, // Play animation only once
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        child: Text(
                          'Toutes nos félicitations !',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.08,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 320,
                          child: Text(
                            'Vous vous êtes inscrit avec succès',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF334155).withOpacity(0.9),
                              fontSize: 16,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 15),
                        child: GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setString('first_launch_status', 'onboarded'); // Set status to 'onboarded'

                              setState(() {

                                isVisible = true;
                                _setLoggedIn(true);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashBoard()),
                                );
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFFFF4343),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Continuer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w500,
                                    height: 1.11,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
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
  Future<void> _setLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', value);
  }
}
