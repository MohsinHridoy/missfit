import 'package:flutter/material.dart';

import '../../common_utils.dart';
import '../../common_widgets.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';
import '../cartscreen/cart.dart';
import '../orderstatus/order_status_screen.dart';

class CompleteOrderPage extends StatefulWidget {
  const CompleteOrderPage({super.key});

  @override
  State<CompleteOrderPage> createState() => _CompleteOrderPageState();
}

class _CompleteOrderPageState extends State<CompleteOrderPage> {
  List<CartItem> cartItems = [
    CartItem(
        title: 'Dumbbells',
        quantity: 1,
        image: 'assets/cart/cart_items.png',
        weight: 0.5),
    CartItem(
        title: 'Dumbbells',
        quantity: 1,
        image: 'assets/cart/cart_items.png',
        weight: 0.7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          children: [

            CustomAppBar(
              title:  'Commande réussie',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 4.5,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 10,bottom: 10),
                              child: Image.asset(
                                "assets/order/icon_congrates.png",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: SizedBox(
                                    height: 20,
                                    child: Text(
                                      'Bravo! Votre commande est soumise',
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 16,
                                        fontFamily: 'Archivo-Medium',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Votre numéro de commande est',
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 0.10,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '#126546',
                                          style: TextStyle(
                                            color: Color(0xFFE88E32),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 0.10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40),
                      child: title_textView_Kt_SBld('Lieu de livraison')
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    _buildDelivaryStatusTextItem(),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40,bottom: 20),
                      child: title_textView_Kt_SBld('Délai de livraison')
                    ),

                    _buildEsrtimatedDateStatus(),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 30,bottom: 20),
                      child: title_textView_Kt_SBld('Mode de paiement')
                    ),

                    _buildPaymentMethodStatus(),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40,bottom: 20),
                      child: title_textView_Kt_SBld( 'Détails du produit')
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    _buildCartItemsList(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40,bottom: 20),
                      child:  title_textView_Kt_SBld('Récapitulatif de la commande')


                    ),

                    _buildOrderSummeryItem(),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                  onTap: (){
                    navigateToNextPage(context, OrderStatus( status: OrderStatusEnum.Packed,));
                  },
                  child: outlineButton(context, 'Afficher le statut de la commande')
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartItemsList() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: List.generate(
                cartItems.length,
                (index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 65,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    // Make the border fully circular
                                    color: Color(0xFF94A3B8).withOpacity(0.3),
                                    image: DecorationImage(
                                      image: AssetImage(cartItems[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: SizedBox(
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dumbbells',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 16,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.09,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 25.0, bottom: 25),
                                        child: Text(
                                          '2 kg',
                                          style: TextStyle(
                                            color: Color(0xFF66758C),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Regular',
                                            fontWeight: FontWeight.w400,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'CHF 25.00',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 14,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              // Align(
                              //   alignment: Alignment.bottomCenter,
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(top: 45.0),
                              //     child: Row(
                              //       children: [
                              //         GestureDetector(
                              //           onTap: () {
                              //             setState(() {
                              //               if (item.quantity > 1)
                              //                 item.quantity--;
                              //             });
                              //           },
                              //           child: Container(
                              //             width: 24,
                              //             height: 24,
                              //             padding: const EdgeInsets.only(
                              //               top: 4.50,
                              //               left: 4,
                              //               right: 4,
                              //               bottom: 3.50,
                              //             ),
                              //             clipBehavior: Clip.antiAlias,
                              //             decoration: BoxDecoration(
                              //               color: Color(0xFF94A3B8),
                              //               borderRadius:
                              //               BorderRadius.circular(4),
                              //             ),
                              //             child: Center(
                              //               child: Image.asset(
                              //                   "assets/cart/icon_minus.png"),
                              //             ),
                              //           ),
                              //         ),
                              //         Padding(
                              //           padding: const EdgeInsets.only(
                              //               left: 4.0, right: 4.0),
                              //           child: SizedBox(
                              //             width: 20,
                              //             child: Center(
                              //               child: Text(
                              //                 '${item.quantity}',
                              //                 style: TextStyle(
                              //                   color: Color(0xFF334155),
                              //                   fontSize: 14,
                              //                   fontFamily: 'Archivo',
                              //                   fontWeight: FontWeight.w400,
                              //                   height: 0.10,
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         GestureDetector(
                              //           onTap: () {
                              //             setState(() {
                              //               item.quantity++;
                              //             });
                              //           },
                              //           child: Container(
                              //             width: 24,
                              //             height: 24,
                              //             padding: const EdgeInsets.only(
                              //               top: 4.50,
                              //               left: 4,
                              //               right: 4,
                              //               bottom: 3.50,
                              //             ),
                              //             clipBehavior: Clip.antiAlias,
                              //             decoration: BoxDecoration(
                              //               color: Color(0xFFFF4343),
                              //               borderRadius:
                              //               BorderRadius.circular(4),
                              //             ),
                              //             child: Center(
                              //               child: Image.asset(
                              //                   "assets/cart/icon_add.png"),
                              //             ),
                              //           ),
                              //         )
                              //       ],
                              //     ),
                              //   ),
                              // )
                              SizedBox(
                                width: 79,
                                child: Text(
                                  'CHF 50.00',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 14,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w500,
                                    height: 0.10,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          buildDivider(context)
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
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
      ],
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


  Widget _buildDelivaryStatusTextItem() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 155,
        padding: const EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
                child: Text(
                  "jhon Lennon",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: 300,
                height: 45,
                child: Text(
                  'Address : 1901 Thornridge Cir. Shiloh, Hawaii 81063',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _buildDelivaryDetailsTextItem('Phone Number : (239) 555-0108'),
              _buildDelivaryDetailsTextItem('Email : lennon@36.com'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodStatus() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
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
                    '•••• •••• •••• 222323',
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildEsrtimatedDateStatus() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: SizedBox(
                width: 122,
                child: Text(
                  'Estimated Date',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 90,
              child: Text(
                '20 Mar - 26 Mar',
                style: TextStyle(
                  color: Color(0xFF66758C),
                  fontSize: 12,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDelivaryDetailsTextItem(String text) {
    return SizedBox(
      width: 300,
      height: 25,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 14,
          fontFamily: 'Archivo-Regular',
          fontWeight: FontWeight.w500,
        ),
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