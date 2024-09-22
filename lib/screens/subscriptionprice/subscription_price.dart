import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/filtershopscreen/filter_shop_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';

class SubscriptionPriceSelectionPage extends StatefulWidget {
  const SubscriptionPriceSelectionPage({Key? key}) : super(key: key);

  @override
  _SubscriptionPriceSelectionPageState createState() =>
      _SubscriptionPriceSelectionPageState();
}

class _SubscriptionPriceSelectionPageState
    extends State<SubscriptionPriceSelectionPage> {
  int selectedIndex = 0;
  bool isEditable=true;

  bool isVisible = false;
  bool isVisible1 = false;
  bool isButtonRed = false; // Variable to hold button color state
  bool isButtonRedInVisible = false; // Variable to hold button color state
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [

          CustomAppBar(
            title:  'Abonnement',
            onBackTap: () {
              Navigator.pop(context);
              // navigateToNextPage(context, DashBoard(number: 3,));

            },
            iconSpacing:3.8,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0,bottom: 20),
                        child: Image.asset(
                          "assets/subscription/icon_premium.png",
                          scale: 2,
                        ),
                      ),
                      SizedBox(
                        width: 283,
                        child: Text(
                          'Plan premium annuel',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 24,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 320,
                    child: Text(
                      'Sélectionnez le prix',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 20,
                        fontFamily: 'Kanit-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.06,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  buildLevelContainer(0, 'Yearly Payment', 'CHF 990 '),
                  buildLevelContainer(1, 'Per Month', 'CHF 89 '),
                  SizedBox(height: 15),
                  if (selectedIndex == 1)
                    Column(
                      children: [
                        _buildTextWidget(
                            "Période d'engagement : 12 mois, sans possibilité de résiliation anticipée."),
                        _buildTextWidget(
                            "Options de paiement : Versements mensuels, sous réserve de frais d'inscription de CHF 59. Ou paiement intégral en début de période. "),
                        _buildTextWidget(
                            "Conséquence de retard de paiement : l'accès sera temporairement restreint si les paiements ne sont pas effectués à temps."),
                      ],
                    ),
                  Spacer(),

                  customButtonRed(context, 'Continuer',
                      onPressed: () {
                        _showBottomSheet();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );


  }
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: isButtonRedInVisible != true ? 340:414,
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
                            SizedBox(height: 20),
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                  "assets/subscription/img_promo_code.png"),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                              width: 320,
                              child: Text(
                                isButtonRedInVisible != true ? 'Avez-vous un code promo ?':"Félicitations, votre code promotionnel a été appliqué avec succès",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 20,
                                  fontFamily: 'Kanit-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 1.06,
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 44,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white.withOpacity(0.05),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Color(0xFFD1D5DB)),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 8),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 13.0, left: 15),
                                        child: TextFormField(
                                          controller: controller,
                                          enabled: isEditable,
                                          onChanged: (value) {
                                            setState(() {
                                              // Update button color state based on text length
                                              if (value.length > 4) {
                                                isButtonRed = true;
                                              } else {
                                                isButtonRed = false;
                                              }
                                            });
                                          },
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 1.10,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'code',
                                            hintStyle: TextStyle(
                                              color: Color(0xFFD1D5DB),
                                              fontSize: 14,
                                              fontFamily: 'Archivo-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    isButtonRedInVisible != true
                                        ? GestureDetector(
                                      onTap: () {
                                        if (isButtonRed) {
                                          setState(() {
                                            isButtonRedInVisible =
                                            true; // Make the button invisible
                                            isEditable=false;

                                          });
                                        }
                                      },
                                      child: Container(
                                        width: 93.47,
                                        decoration: ShapeDecoration(
                                          color: isButtonRed
                                              ? Color(0xFFFF4343)
                                              : Color(0xFFD1D5DB),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.only(
                                              topRight:
                                              Radius.circular(4),
                                              bottomRight:
                                              Radius.circular(4),
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Appliquer',
                                            style: TextStyle(
                                              color: isButtonRed
                                                  ? Colors.white
                                                  : Color(0xFF66758C),
                                              fontSize: 14,
                                              fontFamily:
                                              'Archivo-SemiBold',
                                              fontWeight: FontWeight.w600,
                                              height: 1.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                        : Padding(
                                      padding: const EdgeInsets.only(
                                          right: 13.0, left: 2),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            isButtonRed = false;
                                            isEditable=true;
                                            isButtonRedInVisible =
                                            false; // Make the button invisible
                                            controller.clear();


                                          });
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/subscription/icon_cross.png",
                                              scale: 2,
                                            ),
                                            Text(
                                              'Retirer',
                                              style: TextStyle(
                                                color: Color(0xFFEF4444),
                                                fontSize: 14,
                                                fontFamily:
                                                'Archivo-Medium',
                                                fontWeight: FontWeight.w500,
                                                height: 1.10,
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Visibility(
                                visible: isButtonRedInVisible,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 22.0,bottom: 10,top: 5),
                                  child: Text(
                                    "Vous bénéficiez d'une réduction de CHF 60.",
                                    style: TextStyle(
                                      color: Color(0xFF22C55E),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 8),
                              child: isButtonRedInVisible?customButtonRed(context, 'Continue', onPressed: () {
                                navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                              }):GestureDetector(
                                onTap: (){
                                  navigateToNextPage(context, DeliavryAddress(status: 'subscription',));

                                },
                                  child: outlineButton(context,'Sauter')
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTextWidget(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
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
                height: 1.11,

              ),
            ),
          ),
        ],
      ),
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