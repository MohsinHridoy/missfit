import 'package:flutter/material.dart';
import 'package:miss_fit/screens/payment_status/payment_status.dart';

class ReviewSummary extends StatefulWidget {
  const ReviewSummary({Key? key}) : super(key: key);

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  bool isSelected=false;

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
                      SizedBox(width: MediaQuery.of(context).size.width / 4.2),
                      Text(
                        'Review Summery',
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
              _buildSummeryText('Date & Hour', 'May 12, 2024 | 9:00 AM'),
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
              _buildSummeryText1('Duration', '1 hour'),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                child: _buildDivider(context),
              ),
              const SizedBox(height: 16),

              _buildSummeryText('Amount', 'CHF 150'),
              _buildSummeryText1('Total', 'CHF 150'),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          isSelected=!isSelected;

                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          child:  Image.asset(
                            isSelected ? "assets/registration/icon_selected_box.png" : "assets/registration/icon_unselected_checkbox1.png",
                            scale: 2.0,
                          )
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'I agree with ',
                            style: TextStyle(
                              color: Color(0xFF66758C),
                              fontSize: 16,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w500,
                              height: 0.08,
                            ),
                          ),
                          TextSpan(
                            text: 'terms & conditions',
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
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 25,bottom: 20,right: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentStatus()),
                    );
                  },
                  child: Container(
                    width: 370,
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
                ),
              ),


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