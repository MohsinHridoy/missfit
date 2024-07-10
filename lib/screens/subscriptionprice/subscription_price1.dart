import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class SubscriptionPriceSelectionPage1 extends StatefulWidget {
  const SubscriptionPriceSelectionPage1({Key? key}) : super(key: key);

  @override
  _SubscriptionPriceSelectionPage1State createState() =>
      _SubscriptionPriceSelectionPage1State();
}

class _SubscriptionPriceSelectionPage1State
    extends State<SubscriptionPriceSelectionPage1> {
  int selectedIndex = 1;
  bool isVisible = false;
  bool isVisible1 = false;
  final List<String> _timeSlots = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  int _selectedDayIndex = 0; // To keep track of the selected day index

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Visibility(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 97,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            border: Border.all(color: Colors.white.withOpacity(0.11)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 35.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    "assets/cart/icon_left_arrow.png",
                                    scale: 2,
                                  ),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width / 3.5),
                                Text(
                                  'Subscription',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF1E293B),
                                    fontSize: 18,
                                    fontFamily: 'Kanit-Medium',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            'Select Month',
                            style: TextStyle(
                              color: Color(0xFF1E293B),
                              fontSize: 18,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 0.08,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                // Number of columns in the grid
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio:
                                    96 / 52, // Aspect ratio of the items
                              ),
                              itemCount: _timeSlots.length,
                              // Number of items in the grid
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex =
                                          index; // Update selected index
                                    });
                                  },
                                  child: Container(
                                    width: 68,
                                    height: 61,
                                    padding: const EdgeInsets.all(16),
                                    decoration: selectedIndex == index
                                        ? ShapeDecoration(
                                            color: Color(0xFFFFA142),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          )
                                        : ShapeDecoration(
                                            color: Color(0xFFE5E7EB),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1,
                                                  color: Color(0xFFE5E7EB)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                    child: Center(
                                      child: Text(
                                        _timeSlots[index],
                                        style: TextStyle(
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Color(0xFF334155),
                                          fontSize: 14,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isVisible1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          // isVisible1=!isVisible1;
                        });
                      },
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.550000011920929),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              child: Container(
                                height: 340,
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
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                          "assets/subscription/img_promo_code.png"),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 320,
                                      child: Text(
                                        'Do you have any Promo Code?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 20,
                                          fontFamily: 'Kanit-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.06,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 44,
                                              padding: const EdgeInsets.only(
                                                top: 8,
                                                left: 12,
                                                right: 8,
                                                bottom: 8,
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              decoration: ShapeDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.05),
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: Color(0xFFD1D5DB)),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(width: 8),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4.0),
                                                      child: TextFormField(
                                                        controller: controller,
                                                        // Assign the focus node to the text field

                                                        onChanged: (value) {
                                                          setState(() {});
                                                        },
                                                        onEditingComplete: () {},
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF334155),
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Archivo-Medium',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height: 0.10,
                                                        ),
                                                        decoration:
                                                            InputDecoration
                                                                .collapsed(
                                                          hintText: 'code',
                                                          hintStyle: TextStyle(
                                                            color:
                                                                Colors.white,
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Archivo-Regular',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.10,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 93.47,
                                            height: 44,
                                            decoration: ShapeDecoration(
                                              color: controller.text.length > 4
                                                  ? Color(0xFFFF4343)
                                                  : Color(0xFFD1D5DB),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(4),
                                                  bottomRight: Radius.circular(4),
                                                ),
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Apply',
                                                style: TextStyle(
                                                  color:
                                                      controller.text.length > 4
                                                          ? Colors.white
                                                          : Color(0xFF66758C),
                                                  fontSize: 14,
                                                  fontFamily: 'Archivo-SemiBold',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20, top: 8),
                                      child: GestureDetector(
                                        onTap: () {
                                          navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 44,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 32, vertical: 12),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF4343),
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
            Visibility(
              visible: !isVisible1,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 88,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  decoration: BoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Total:',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 18,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                            TextSpan(
                              text: ' CHF 1260',
                              style: TextStyle(
                                color: Color(0xFF00AA35),
                                fontSize: 18,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isVisible1=!isVisible1;
                          });
                        },
                        child: Container(
                          width: 121,
                          height: 52,

                          decoration: ShapeDecoration(
                            color: Color(0xFFFF4343),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
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
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 5,
            height: 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          width: 320,
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 14,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
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
        // await saveSelectedIndex();  // Save the index as soon as it's selected
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Container(
          width: 320,
          height: 91,
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
          child: Row(
            children: [
              Container(
                child: selectedIndex == index
                    ? Image.asset(
                        "assets/payment/icon_radio_check.png",
                        scale: 2.0,
                      )
                    : Image.asset(
                        "assets/payment/icon_radio_uncheck.png",
                        scale: 2.0,
                      ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF66758C),
                      fontSize: 14,
                      fontFamily: 'Archivo-Medium',
                      fontWeight: FontWeight.w500,
                      height: 0.11,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 20,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 0.07,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class VerticalProgressBar extends StatefulWidget {
  @override
  _VerticalProgressBarState createState() => _VerticalProgressBarState();
}

class _VerticalProgressBarState extends State<VerticalProgressBar> with SingleTickerProviderStateMixin {
  int progress = 1; // Initial progress value
  late AnimationController _controller;
  bool isVisible = false;
  bool isVisible1 = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Longer duration for smoother animation
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        color: Color(0xFFF6F6F6), // Set body color
        child: Stack(
          children: [
            Visibility(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    CustomAppBar(
                      title:  'Abonnement',
                      onBackTap: () {
                        Navigator.pop(context);
                        // navigateToNextPage(context, DashBoard(number: 3,));

                      },
                      iconSpacing:3.6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top:50),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'Sélectionnez les mois',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Kanit-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.07,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 60,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '$progress',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 48,
                                    fontFamily: 'Archivo-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.03,
                                  ),
                                ),
                                TextSpan(
                                  text: 'mois',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,right: 8.0,bottom: 16),
                            child: Container(
                              width: 170,
                              height: 31,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    'Total: CHF  ${progress*970}  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF22C55E),
                                      fontSize: 18,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0.08,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(12, (index) {
                              int number = 12 - index; // Adjusted to reverse the numbering
                              return Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(vertical: 2),
                                child: Text(
                                  '$number',
                                  style: TextStyle(
                                    color: number <= progress ? Color(0xFFFFA142): Color(0xFF94A3B8), // Adjusted condition
                                    fontSize: 20,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 450,

                            child: RotatedBox(
                              quarterTurns: 3,
                              child: Slider(
                                secondaryActiveColor: Colors.red,
                                inactiveColor: Colors.white,
                                activeColor: Color(0xFF9CA3AF),
                                value: progress.toDouble(),
                                min: 1,
                                max: 12,
                                divisions: 11,
                                onChanged: (value) {
                                  setState(() {
                                    progress = value.toInt();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Spacer(),
                    // Adding space between widgets

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isVisible1=!isVisible1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF4343),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                'Continuer',
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Visibility(
              visible: isVisible1,
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    isVisible1=!isVisible1;
                  });
                },
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.550000011920929),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        child: Container(
                          height: 340,
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
                                height: 20,
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                    "assets/subscription/img_promo_code.png"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 320,
                                child: Text(
                                  'Do you have any Promo Code?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 20,
                                    fontFamily: 'Kanit-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.06,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 44,
                                        padding: const EdgeInsets.only(
                                          top: 8,
                                          left: 12,
                                          right: 8,
                                          bottom: 8,
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Colors.white
                                              .withOpacity(0.05),
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1,
                                                color: Color(0xFFD1D5DB)),
                                            borderRadius:
                                            BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    top: 4.0),
                                                child: TextFormField(
                                                  controller: controller,
                                                  // Assign the focus node to the text field

                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  onEditingComplete: () {},
                                                  style: TextStyle(
                                                    color:
                                                    Color(0xFF334155),
                                                    fontSize: 14,
                                                    fontFamily:
                                                    'Archivo-Medium',
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    height: 0.10,
                                                  ),
                                                  decoration:
                                                  InputDecoration
                                                      .collapsed(
                                                    hintText: 'code',
                                                    hintStyle: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'Archivo-Regular',
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      height: 0.10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 93.47,
                                      height: 44,
                                      decoration: ShapeDecoration(
                                        color: controller.text.length > 4
                                            ? Color(0xFFFF4343)
                                            : Color(0xFFD1D5DB),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(4),
                                            bottomRight: Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Apply',
                                          style: TextStyle(
                                            color:
                                            controller.text.length > 4
                                                ? Colors.white
                                                : Color(0xFF66758C),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-SemiBold',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                                  },
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width,
                                    height: 44,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFF4343),
                                      borderRadius:
                                      BorderRadius.circular(8),
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
                                  ),
                                ),
                              ),
                            ],
                          ),
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
}

class WaveClipper extends CustomClipper<Path> {
  final int progress;
  final double waveValue;

  WaveClipper(this.progress, this.waveValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    final heightFactor = progress / 12;
    path.lineTo(0, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height * (1 - heightFactor));
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}