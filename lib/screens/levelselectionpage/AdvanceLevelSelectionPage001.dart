import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdvanceLevelSelectionPage001 extends StatefulWidget {
  final ValueChanged<bool> onVisibilityChange;

  const AdvanceLevelSelectionPage001({Key? key, required this.onVisibilityChange}) : super(key: key);

  @override
  _AdvanceLevelSelectionPageState001 createState() => _AdvanceLevelSelectionPageState001();
}

class _AdvanceLevelSelectionPageState001 extends State<AdvanceLevelSelectionPage001> {
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
    await prefs.remove('selectedIndexAdvanceLevel'); // Remove the old selectedIndex
    await prefs.setInt('selectedIndexAdvanceLevel', selectedIndex); // Save the new selectedIndex
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
                  SizedBox(width: 50, child: txt_headline('How long do you like to \nworkout for?')),
                  SizedBox(height: 30),
                  buildLevelContainer(0, 'Light Activity', 'About 10-20 minutes'),
                  buildLevelContainer(1, 'Moderate Activity', 'About 30-40 minutes'),
                  buildLevelContainer(2, 'Pro Activity', 'About 40-60 minutes'),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 15),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          isVisible = true;
                          widget.onVisibilityChange(isVisible); // Notify parent widget about visibility change
                        });
                      },
                      child: buildNextButton(context),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible,
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
                visible: isVisible,

                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 303,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child:   Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Lottie.asset(
                          'assets/lottie_anim/tik_anim.json', // Path to the Lottie JSON file in the assets folder
                          height: 200, // Adjust height as needed
                          width: 200, // Adjust width as needed
                          fit: BoxFit.cover, // Adjust the fit
                          repeat: false, // Play animation only once

                        ),
                      ),

                      SizedBox(
                        width: 320,
                        child: Text(
                          'Congratulations !',
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
                            'You Have successfullly registerd',
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
                        padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                        child: GestureDetector(
                            onTap: (){
                              setState(() {
                                isVisible=true;
                              });
                            },
                            child:  Container(
                              width: MediaQuery.of(context).size.width,
                              height: 44,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFFFF4343),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w500,
                                    height: 1.11,
                                  ),
                                ),
                              ),
                            )

                        ),
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

  Widget buildLevelContainer(int index, String title, String subtitle) {
    Color titleColor = index == selectedIndex ? Color(0xFFE88E32) : Color(0xFF334155);
    Color borderColor = index == selectedIndex ? Color(0xFFFFA142) : Color(0xFFE5E7EB);

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