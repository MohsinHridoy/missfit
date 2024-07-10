import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/payment_status/payment_status.dart';

class ReviewSummary1 extends StatefulWidget {
  const ReviewSummary1({Key? key}) : super(key: key);

  @override
  State<ReviewSummary1> createState() => _ReviewSummary1State();
}

class _ReviewSummary1State extends State<ReviewSummary1> {
  bool isSelected=false;
  bool isSelected1=false;

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
                      SizedBox(width: MediaQuery.of(context).size.width / 6),
                      Text(
                        'Résumé des commentaires',
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
              SizedBox(height: 10,),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(8),
                        //   image: DecorationImage(
                        //     image: AssetImage("assets/subscription/icon_basic.png",),
                        //     // Replace "your_image.png" with your actual image asset path
                        //     fit: BoxFit.fill,
                        //   ),
                        // ),
                        child: Image.asset("assets/subscription/icon_basic.png"),
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
                              fontSize: 18,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 0.07,
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
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: _buildDivider(context),
              ),
              const SizedBox(height: 16),
              // Add any additional widgets or SizedBoxes here
              // Add more widgets here if needed
              _buildSummeryText('Durée', '12 mois'),
              _buildSummeryText('Date de début', '09-05-24'),
              _buildSummeryText("Date d'expiration", '09-05-25'),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: _buildDivider(context),
              ),
              const SizedBox(height: 20),
              _buildSummeryText1('Abonnement', 'CHF 990'),
              _buildSummeryText1("Frais d'inscription", 'CHF 59'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: _buildDivider(context),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10,bottom: 25),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelected1=!isSelected1;

                    });
                  },
                  child: Container(
                    color: Color(0xFFF6F6F6),

                    child: Row(
                      children: [
                        Image.asset(
                          isSelected1 ? "assets/registration/icon_selected_box.png" : "assets/registration/icon_unselected_checkbox1.png",
                          scale: 2.0,
                        ),
                        SizedBox(width: 8,),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Location de médaillons',
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                  ),
                                ),
                              ),

                              Text(
                                'CHF 150',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.08,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,bottom: 10),
                child: _buildDivider(context),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 72,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, bottom: 6),
                              child: Container(
                                width: 55,
                                height: 55,
                                padding: const EdgeInsets.all(12),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/payment/img_delivary_item2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: SizedBox(
                                      width: 153,
                                      height: 20,
                                      child: Text(
                                        "Stripe",
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 16,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          height: 0.09,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 10,
                                    child: Text(
                                      // '•••• •••• •••• ' +
                                      //     item.cvvCode.substring(12),
                                      "•••• •••• •••• 232323232",
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 16,
                                        fontFamily: 'Archivo',
                                        fontWeight: FontWeight.w400,
                                        height: 0.09,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),

                            Padding(
                              padding: const EdgeInsets.only(left: 15.0,top:15,right: 15),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 68,
                                  child: Text(
                                    'Change',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFFFF4343),
                                      fontSize: 16,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isSelected=!isSelected;

                    });
                  },
                  child: Container(
                    color: Color(0xFFF6F6F6),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                              child:  Image.asset(
                                isSelected ? "assets/registration/icon_selected_box.png" : "assets/registration/icon_unselected_checkbox1.png",
                                scale: 2.0,
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "je suis d'accord avec",
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 16,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
                                  ),
                                ),
                                TextSpan(
                                  text: 'termes et conditions',
                                  style: TextStyle(
                                    color: Color(0xFFE88E32),
                                    fontSize: 16,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w500,
                                    height: 0.08,
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
              ),
              Spacer(),



              Container(
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
                          if(isSelected)
                          navigateToNextPage(context, PaymentStatus(status: 'reviewsummery',));
                        },
                        child: Container(
                          width: 121,
                          height: 52,

                          decoration: ShapeDecoration(
                            color: isSelected ? Color(0xFFFF4343):Color(0xFFD1D5DB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: isSelected ?  Colors.white:Color(0xFF66758C),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))


              // Add any additional widgets or SizedBoxes here
              // Add more widgets here if needed
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