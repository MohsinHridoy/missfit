import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/payment_status/payment_status.dart';

import '../../widgets/custom_app_bar.dart';

class EReceiptScreen extends StatefulWidget {
  const EReceiptScreen({Key? key}) : super(key: key);

  @override
  State<EReceiptScreen> createState() => _EReceiptScreenState();
}

class _EReceiptScreenState extends State<EReceiptScreen> {
  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        
        children: [
          CustomAppBar(
            title: 'Reçu électronique',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 4.4,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
               
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    // Adjust the padding as needed
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // Adjust the padding as needed
                          child: Container(
                            width: 64,
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage("assets/coachbooking/img_caoch2.png"),
                                // Replace "your_image.png" with your actual image asset path
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // Adjust the padding as needed
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sarah Glayre',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Fitness Coach',
                                style: TextStyle(
                                  color: Color(0xFF66758C),
                                  fontSize: 12,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: _buildDivider(context),
                  ),
                  const SizedBox(height: 16),
                  // Add any additional widgets or SizedBoxes here
                  // Add more widgets here if needed
                  _buildSummeryText('Date et heure', 'May 12, 2024 | 9:00 AM'),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Service',
                          style: TextStyle(
                            color: Color(0xFF66758C),
                            fontSize: 16,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.08,
                          ),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 210,
                          child: Text(
                            'Programme d\'entraînement avec suivi',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 16,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSummeryText1('Durée', '1 hour'),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: _buildDivider(context),
                  ),
                  const SizedBox(height: 16),
              
                  _buildSummeryText('Montante', 'CHF 150'),
                  _buildSummeryText1('Totale', 'CHF 150'),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                    child: _buildDivider(context),
                  ),
                  const SizedBox(height: 16),
                  _buildSummeryText('Nom', 'Jhon Lennon'),
                  _buildSummeryText1('Numéro de téléphone', '+243 555-0108'),
                  _buildSummeryText1('Mode de paiement', 'Stripe'),
                  _buildSummeryText1('Numéro de transaction', '#ES0329321'),
                  SizedBox(height: 100.h,),

              
                  // Add any additional widgets or SizedBoxes here
                  // Add more widgets here if needed
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 25,bottom: 20,right: 20),
            child: GestureDetector(
              onTap: (){
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => DashBoard()),
                // );

                // navigateToNextPage(context,DashBoard());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Downloading e-receipt...'),
                    duration: Duration(seconds: 2), // Adjust duration as needed
                  ),
                );
              },
              child: Container(
                width: 370.h,
                height: 52,

                decoration: ShapeDecoration(
                  color: Color(0xFFFF4343),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    'Télécharger le reçu électronique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 1.09,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildSummeryText(String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
              height: 0.08,
            ),
          ),
          Spacer(),
          Text(
            details,
            textAlign: TextAlign.right,
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
    );
  }

  Widget _buildSummeryText1(String title, String details) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w400,
              height: 0.08,
            ),
          ),
          Spacer(),
          Text(
            details,
            textAlign: TextAlign.right,
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
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            // strokeAlign: StrokeAlign.center,
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
    );
  }
}