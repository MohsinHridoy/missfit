import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/subscriptionprice/subscription_price.dart';
import 'package:miss_fit/screens/subscriptionprice/subscription_price1.dart';

import '../../widgets/custom_app_bar.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool isSelectedYearly = true;
  bool isSelectedMonthly = false;
   String chf_yearly_value_prime='CHF 990 ou CHF 89/mois';
   String chf_yearly_value_basic='CHF 890 ou CHF 79/mois';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [

            CustomAppBar(
              title:  'Abonnement',
              onBackTap: () {
                Navigator.pop(context);
                // navigateToNextPage(context, DashBoard(number: 3,));

              },
              iconSpacing:3.6,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: Text(
                        'Sélectionnez votre forfait',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Center(
                      child: _buildSubscriptionPlanSelectionContainer(),
                    ),

                    SizedBox(height: 25),

                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                      child: GestureDetector(
                        onTap: (){
                          if(isSelectedYearly==true)
                          {
                            navigateToNextPage(context,SubscriptionPriceSelectionPage());
                          }
                          else
                          {
                            navigateToNextPage(context,VerticalProgressBar());

                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.40, color: Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Image.asset(
                                            "assets/subscription/icon_premium.png",
                                            scale: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 218,
                                          child: Text(
                                            'Prime',
                                            style: TextStyle(
                                              color: Color(0xFF334155),
                                              fontSize: 24,
                                              fontFamily: 'Archivo-SemiBold',
                                              fontWeight: FontWeight.w600,
                                              height: 1.06,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    SizedBox(
                                      width: 280,
                                      child: Text(
                                        chf_yearly_value_prime,
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 18,
                                          fontFamily: 'Archivo-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          height: 0.07,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 0.5,
                                            color: Colors.grey.withOpacity(0.0),
                                          ),
                                        ),
                                      ),
                                      child: CustomPaint(
                                        painter: DashedLinePainter(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    _buildSubscriptionDetailsText(
                                        'Accès aux Cours Collectifs & Circuits Trainings'),
                                    _buildSubscriptionDetailsText(
                                        'Accès Preminum sur notre app (vidéo d’entrainement, conseils, etc)'),
                                    _buildSubscriptionDetailsText(
                                        'Accès gratuit à nos Events “Girls Only”'),
                                    _buildSubscriptionDetailsText('Shaker & sac offerts '),
                                    SizedBox(height: 40),

                                    _buildButton('Acheter un abonnement')
                                  ],
                                ),
                              ),

                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/subscription/icon_premium_offer_icon.png",
                                    scale: 2,
                                  )),
                              Align(
                                alignment: Alignment.topRight,

                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 5),
                                  child: Text(
                                    'Réduction de 20',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFF9FAFB),
                                      fontSize: 16,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                      child: GestureDetector(
                        onTap: (){
                          if(isSelectedYearly==true)
                          {
                            navigateToNextPage(context,SubscriptionPriceSelectionPage());
                          }
                          else
                          {
                            navigateToNextPage(context,VerticalProgressBar());

                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 481,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.40, color: Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: Image.asset(
                                            "assets/subscription/icon_basic.png",
                                            scale: 2,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 218,
                                          child:  Text(
                                            'Basic',
                                            style: TextStyle(
                                              color: Color(0xFF334155),
                                              fontSize: 24,
                                              fontFamily: 'Archivo-SemiBold',
                                              fontWeight: FontWeight.w600,
                                              height: 1.06,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    SizedBox(
                                      width: 280,
                                      child: Text(
                                        chf_yearly_value_basic,
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 18,
                                          fontFamily: 'Archivo-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          height: 0.07,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 1,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            width: 0.5,
                                            color: Colors.grey.withOpacity(0.0),
                                          ),
                                        ),
                                      ),
                                      child: CustomPaint(
                                        painter: DashedLinePainter(),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    _buildSubscriptionDetailsText(
                                        'Fitness réservé aux femmes'),
                                    _buildSubscriptionDetailsText(
                                        'Espaces cardio, renforcement musculaire et poids libres'),
                                    _buildSubscriptionDetailsText(
                                        'Accès 24/7'),
                                    _buildSubscriptionDetailsText('Introduction gratuite avec une coach'),
                                    SizedBox(height: 40),

                                    _buildButton('Acheter un abonnement')
                                  ],
                                ),
                              ),

                              Align(
                                  alignment: Alignment.topRight,
                                  child: Image.asset(
                                    "assets/subscription/icon_basic_offer_icon.png",
                                    scale: 2,
                                  )),
                              Align(
                                alignment: Alignment.topRight,

                                child: Padding(
                                  padding: const EdgeInsets.only(top: 25.0,right: 5),
                                  child: Text(
                                    '10% de réduction',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFF9FAFB),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:25.0,top: 10),
                        child: SizedBox(
                          width: 320,
                          child: Text(
                            "*Frais d'inscription : CHF 59",
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 16,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 0.09,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 150,),



                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFFF4343)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFFFF4242),
              fontSize: 16,
              fontFamily: 'Archivo-SemiBold',
              fontWeight: FontWeight.w600,
              height: 1.00,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubscriptionDetailsText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top:8.0,bottom: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              "assets/subscription/icon_checkmark.png",
              scale: 2.1,
            ),
          ),
          SizedBox(
            width: 240,
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xFF475569),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionPlanSelectionContainer() {
    return Container(
      width: 240.h,
      height: 70,
      padding: const EdgeInsets.all(8),
      decoration: ShapeDecoration(
        color: Color(0xFFF9FAFB),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E7EB)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectedYearly = true;
                isSelectedMonthly = false;

                 chf_yearly_value_prime='CHF 990 ou CHF 89/mois';
                 chf_yearly_value_basic='CHF 890 ou CHF 79/mois';
              });
            },
            child: Container(
              width: 110.h,
              height: 54,
              decoration: BoxDecoration(
                color:
                isSelectedYearly ? Color(0xFFFFA142) : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  'Annuelle',
                  style: TextStyle(
                    color: isSelectedYearly ? Colors.white : Color(0xFF475569),
                    fontSize: 20,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.00,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelectedYearly = false;
                isSelectedMonthly = true;
                chf_yearly_value_prime='CHF 99/mois';
                chf_yearly_value_basic='CHF 89/mois';
              });
            },
            child: Container(
              width: 110.h,
              height: 54,
              decoration: BoxDecoration(
                color:
                isSelectedMonthly ? Color(0xFFFFA142) : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child:Text(
                  'Mensuelle',
                  style: TextStyle(
                    color: isSelectedMonthly ? Colors.white : Color(0xFF475569),
                    fontSize: 20,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.00,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.6)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square; // Setting strokeCap to square

    final double dashWidth = 5;
    final double dashSpace = 10;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}