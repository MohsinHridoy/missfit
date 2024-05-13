import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/completeorderpage/complete_order_page.dart';

import '../cartscreen/cart001.dart';

class PaymentModel {
  final String title;
  int quantity;
  final String image;
  final double weight;
  final String cardHolder;
  final String cardName;
  final String expiryDate;
  final String cvvCode;
  bool isChecked;

  PaymentModel({
    required this.title,
    required this.quantity,
    required this.image,
    required this.weight,
    required this.cardHolder,
    required this.cardName,
    required this.expiryDate,
    required this.cvvCode,
    this.isChecked = false,
  });
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  List<PaymentModel> paymentItems = [
    PaymentModel(
      title: 'Item 1',
      quantity: 1,
      image: 'assets/payment/img_delivary_item.png',
      weight: 0.5,
      cardHolder: 'John Doe',
      cardName: 'Cash On Delivary',
      expiryDate: '12/24',
      cvvCode: '122222222222222222',
      isChecked: true, // Initially checked
    ),
    PaymentModel(
      title: 'Item 2',
      quantity: 1,
      image: 'assets/payment/img_delivary_item2.png',
      weight: 0.7,
      cardHolder: 'Jane Doe',
      cardName: 'Stripe',
      expiryDate: '10/25',
      cvvCode: '45222222222222222',
      isChecked: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
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
                        // Handle back button tap
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.2),
                    Text(
                      'Payment',
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
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Select Payment Method',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            _buildListPaymentMethod(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddNewCard(),
                  ));
                },
                child:  Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),// Background color
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 20,
                          width: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset(
                              "assets/cart/icon_plus.png",
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Add New Card',
                          style: TextStyle(
                            color: Color(0xFFFF4343),
                            fontSize: 14,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 10),
              child: Text(
                'Order Summary',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w600,
                  height: 0.06,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _buildOrderSummeryItem(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    barrierColor: Color(0xFF111827).withOpacity(0.7),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 215, // Adjust the height as necessary
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 50),
                            Text(
                              'Order Confirmation',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 18,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                              'Do you want to confirm order?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(
                                          context); // Close the modal when tapped
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 52,

                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1, color: Color(0xFFFF4343)),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                            color: Color(0xFFFF4343),
                                            fontSize: 16,
                                            fontFamily: 'Archivo-SemiBold',
                                            fontWeight: FontWeight.w600,
                                            height: 0.09,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => CompleteOrderPage(),
                                      ));
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 52,

                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFF4343),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),

                                      child: Center(
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                            color:  Colors.white,
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
                            SizedBox(height: 20),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 104, vertical: 17),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Proceed to Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderSummeryItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        _buildSummeryItemText('Sub total', 'CHF 140'),
        _buildSummeryItemText('Discount', 'CHF 140'),
        _buildSummeryItemText('Vat', 'CHF 140'),
        _buildSummeryItemText('Shipping Charge', 'CHF 140'),
        _buildSummeryItemText('Grand Total', 'CHF 140'),
      ],
    );
  }

  Widget _buildListPaymentMethod() {
    return Column(
      children: List.generate(
        paymentItems.length,
        (index) {
          final item = paymentItems[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Uncheck all payment methods
                  for (var i = 0; i < paymentItems.length; i++) {
                    paymentItems[i].isChecked = false;
                  }
                  // Check the selected payment method
                  item.isChecked = true;
                });
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
                                item.image,
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
                                    item.cardName,
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
                              Visibility(
                                visible: index != 1 ? false : true,
                                child: SizedBox(
                                  height: 10,
                                  child: Text(
                                    '•••• •••• •••• ' +
                                        item.cvvCode.substring(12),
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          item.isChecked
                              ? "assets/payment/icon_radio_check.png"
                              : "assets/payment/icon_radio_uncheck.png",
                          scale: 2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummeryItemText(String title, String value) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 25.0, right: 25, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      wordSpacing: 1),
                ),
              ),
              SizedBox(
                width: 71,
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 25,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
            child: CustomPaint(
              painter: DashedLinePainter(),
            ),
          )
        ],
      ),
    );
  }
}
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
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