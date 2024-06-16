import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:flutter/material.dart';

class SubscriptionPriceSelectionPage extends StatefulWidget {
  const SubscriptionPriceSelectionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPriceSelectionPageState createState() =>
      _SubscriptionPriceSelectionPageState();
}

class _SubscriptionPriceSelectionPageState
    extends State<SubscriptionPriceSelectionPage> {
  int selectedIndex = 0;
  bool isVisible = false;
  bool isVisible1 = false;
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Visibility(
              child: Column(
                children: [
                  Container(
                    height: 97,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
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
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 3.5),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10),
                          buildLevelContainer(0, 'Yearly Payment', 'CHF 990 '),
                          buildLevelContainer(1, 'Per Month', 'CHF 89 '),
                          SizedBox(height: 50),
                          if (selectedIndex == 1)
                            Column(
                              children: [
                                _buildTextWidget(
                                    'Commitment Period: 12 months, with no option for early termination.'),
                                _buildTextWidget(
                                    'Payment Options: Monthly installments, subject to a registration fee of CHF 59. Or payment in full at the beginning of the period.'),
                                _buildTextWidget(
                                    'Late Payment Consequence: Access will be temporarily restricted if payments are not made on time.'),
                              ],
                            ),
                          Spacer(),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                          //   child: GestureDetector(
                          //     onTap: () async {
                          //       setState(() {
                          //         isVisible = true;
                          //       });
                          //     },
                          //     child: buildNextButton(context),
                          //   ),
                          // ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible1 = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 52,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 112, vertical: 17),
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
                                          color: Colors.white.withOpacity(0.05),
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
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: TextFormField(
                                                  controller: controller,
                                                  // Assign the focus node to the text field

                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  onEditingComplete: () {},
                                                  style: TextStyle(
                                                    color: Color(0xFF334155),
                                                    fontSize: 14,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0.10,
                                                  ),
                                                  decoration:
                                                  InputDecoration.collapsed(
                                                    hintText: 'testtest',
                                                    hintStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily:
                                                      'Archivo-Regular',
                                                      fontWeight: FontWeight.w400,
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
                                        color:controller.text.length > 4?Color(0xFFFF4343): Color(0xFFD1D5DB),
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
                                            color: controller.text.length > 4?Colors.white:Color(0xFF66758C),
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 44,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 12),
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