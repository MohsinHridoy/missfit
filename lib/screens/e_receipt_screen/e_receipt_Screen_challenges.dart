import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/payment_status/payment_status.dart';

class EReceiptScreenSubscription extends StatefulWidget {
  const EReceiptScreenSubscription({Key? key}) : super(key: key);

  @override
  State<EReceiptScreenSubscription> createState() => _EReceiptScreenState();
}

class _EReceiptScreenState extends State<EReceiptScreenSubscription> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(kToolbarHeight),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       color: Colors.white,
      //       borderRadius: BorderRadius.only(
      //         bottomLeft: Radius.circular(20),
      //         // Adjust the corner radius as needed
      //         bottomRight:
      //         Radius.circular(20), // Adjust the corner radius as needed
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           color: Colors.black.withOpacity(0.1),
      //           spreadRadius: 1,
      //           blurRadius: 10,
      //           offset: Offset(0, 2), // changes position of shadow
      //         ),
      //       ],
      //     ),
      //     child: AppBar(
      //       backgroundColor: Colors.transparent,
      //       elevation: 0,
      //       leading: IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         color: Colors.black,
      //       ),
      //       title: Text(
      //         'Review Summary',
      //         textAlign: TextAlign.center,
      //         style: TextStyle(
      //           color: Color(0xFF1E293B),
      //           fontSize: 18,
      //           fontFamily: 'Kanit',
      //           fontWeight: FontWeight.w500,
      //           height: 0.07,
      //         ),
      //       ),
      //       centerTitle: true,
      //     ),
      //   ),
      // ),
      body: Container(
          color: Color(0xFFF6F6F6),
          child: Column(
            children: [
              Container(
                height: 97,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      SizedBox(width: MediaQuery.of(context).size.width / 4.2),
                      Text(
                        'Reçu électronique',
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
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
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(14),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                                // decoration: BoxDecoration(
                                //   borderRadius: BorderRadius.circular(8),
                                //   image: DecorationImage(
                                //     image: AssetImage("assets/subscription/icon_basic.png",),
                                //     // Replace "your_image.png" with your actual image asset path
                                //     fit: BoxFit.fill,
                                //   ),
                                // ),
                                child: Image.asset(
                                    "assets/subscription/icon_basic.png"),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              // Adjust the padding as needed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Forfait Premium',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      height: 1.08,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Souscription annuelle',
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
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildDivider(context),
                      ),
                      const SizedBox(height: 16),
                      // Add any additional widgets or SizedBoxes here
                      // Add more widgets here if needed
                      _buildSummeryText('Durée', '12 months'),
                      _buildSummeryText('Date de début', '09-05-24'),
                      _buildSummeryText("Date d'expiration", '09-05-25'),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildDivider(context),
                      ),
                      const SizedBox(height: 20),
                      _buildSummeryText1('Abonnement', 'CHF 990'),
                      _buildSummeryText1("Frais d'inscription", 'CHF 59'),
                      _buildSummeryText1('Code promo', 'CHF 59'),
                      _buildSummeryText1('Location de casier', 'CHF 59'),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: _buildDivider(context),
                      ),

                      const SizedBox(height: 20),
                      _buildSummeryText1('Nom', 'Jhon Lennon'),
                      _buildSummeryText1('Numéro de téléphone', '+243 555-0108'),
                      _buildSummeryText1('Mode de paiement', 'Stripe'),
                      _buildSummeryText1('Numéro de transaction', '#ES0329321'),
                      const SizedBox(height: 10),

                      const SizedBox(height: 16),


                      // Add any additional widgets or SizedBoxes here
                      // Add more widgets here if needed
                    ],
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.01),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.10999999940395355),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15,top: 20),
                  child: GestureDetector(
                    onTap: (){
                      // navigateToNextPage(context,DashBoard(number: 2,));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Downloading e-receipt...'),
                          duration: Duration(seconds: 2), // Adjust duration as needed
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 52,

                      decoration: ShapeDecoration(
                        color: Color(0xFFFF4343),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Télécharger le reçu électronique',
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
                    ),
                  ),
                ),
              )

            ],
          )),
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
