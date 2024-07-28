import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/completeorderpage/complete_order_page.dart';

import '../../common_utils.dart';
import '../../common_widgets.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';
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
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Paiement',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 3.2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: title_textView_Kt_SBld('Sélectionnez le mode de paiement')),
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


                        navigateToNextPage(context, AddNewCard());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 44,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ), // Background color
                        child: Center(
                          child:Text(
                            'Ajouter une nouvelle carte',
                            style: TextStyle(
                              color: Color(0xFFFF4343),
                              fontSize: 14,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 25.0, bottom: 10),
                      child: title_textView_Kt_SBld('Récapitulatif de la commande')),
                  SizedBox(
                    height: 15,
                  ),
                  _buildOrderSummeryItem(),
                  SizedBox(
                    height: 15,
                  ),
                  // Spacer(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: customButtonRed(context, 'Procéder à la confirmation', onPressed: () {
              showModalBottomSheet(
                barrierColor: Color(0xFF111827).withOpacity(0.7),
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 215, // Adjust the height as necessary
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20), // Adjust the radius as needed
                        topRight: Radius.circular(20), // Adjust the radius as needed
                      ),
                      // You can add other decorations like border or shadow here if needed
                    ),

                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        Text(
                          'Confirmation de commande',
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
                          'Voulez-vous confirmer la commande?',
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
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30, bottom: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                        context); // Close the modal when tapped
                                  },
                                  child: Container(
                                    height: 52,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFFFF4343)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Center(
                                      child:Text(
                                        'Non',
                                        style: TextStyle(
                                          color: Color(0xFFFF4343),
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
                              SizedBox(width: 12,),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    navigateToNextPage(context,CompleteOrderPage());
                                  },
                                  child: Container(
                                    height: 52,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFF4343),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Oui',
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
            }),
          )

        ],
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
        _buildSummeryItemText('Sous-total', 'CHF 140'),
        _buildSummeryItemText('Rabais', 'CHF 140'),
        _buildSummeryItemText('T.V.A', 'CHF 140'),
        _buildSummeryItemText('Frais de port', 'CHF 140'),
        _buildSummeryItemText('Total', 'CHF 140'),
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
          SizedBox(
            height: 25,
          ),
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
