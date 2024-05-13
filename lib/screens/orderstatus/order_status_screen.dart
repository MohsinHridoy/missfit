import 'package:flutter/material.dart';
import 'package:miss_fit/screens/completeorderpage/complete_order_page.dart';
import 'package:miss_fit/screens/orderstatus/cancel_order_status_screen.dart';

import '../cartscreen/cart.dart';

enum OrderStatusEnum { Processing, Placed, Packed, Shipped, Packed1 }

class OrderStatus extends StatefulWidget {
  final OrderStatusEnum status;

  const OrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
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
  List<bool> itemSelection = [false, false, false, false]; // Track selection state for each item
  bool isInitialViewVisible=true;
  bool _isStatusChecked(
      OrderStatusEnum checkStatus, OrderStatusEnum targetStatus) {
    return OrderStatusEnum.values.indexOf(checkStatus) <=
        OrderStatusEnum.values.indexOf(targetStatus);
  }
  int _selectedRadio = 0;
  bool isChecked=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        // Handle back button tap
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width /3.5),
                    Text(
                      'Order Status',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 420,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: SizedBox(
                                    width: 121,
                                    child: Text(
                                      'Order #23232314',
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
                                SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Order Placed on 24th March, 2024',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 12,
                                      fontFamily: 'Archivo-Regular',
                                      fontWeight: FontWeight.w400,
                                      height: 0.12,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    width: 288,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),

                                _buildStatusItem(OrderStatusEnum.Processing,
                                    'Order Processing', 'Tuesday, 26 March, 09:13 AM'),
                                _buildStatusItem(OrderStatusEnum.Placed, 'Order Placed',
                                    'Tuesday, 26 March, 09:15 AM'),
                                _buildStatusItem(OrderStatusEnum.Packed, 'Order Packed',
                                    'Tuesday, 26 March, 10:00 AM'),
                                _buildStatusItem(OrderStatusEnum.Shipped, 'Order Shipped',
                                    'Wednesday, 27 March, 08:00 AM'),
                                _buildStatusItem(OrderStatusEnum.Packed1, 'Second Packing',
                                    'Wednesday, 27 March, 11:00 AM',
                                    isLast: true),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40),
                      child: Text(
                        'Delivery Location',
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
                      height: 20,
                    ),
                    _buildDelivaryStatusTextItem(),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,top: 40,bottom: 20),
                      child: Text(
                        'Product Details',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 20,
                          fontFamily: 'Kanit-Medium',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),
                      ),
                    ),

                    _buildCartItemsList(),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: GestureDetector(
                        onTap: (){
                          _showBottomSheet(context);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 44,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 17),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side:
                              BorderSide(width: 1, color: Color(0xFFFF4343)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),

                          child: Center(
                            child: Text(
                              'Cancel Order',
                              style: TextStyle(
                                color: Color(0xFFFF4343),
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
            ),
          ],
        ),
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              height: isInitialViewVisible ? 300 : 250,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: isInitialViewVisible
                    ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 288,
                      child: Text(
                        'Why are you canceling this order?',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 18,
                          fontFamily: 'Kanit-Medium',
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < 4; i++) // Build items dynamically
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset(
                                itemSelection[i]
                                    ? "assets/payment/icon_radio_check.png"
                                    : "assets/payment/icon_radio_uncheck.png",
                                scale: 2,
                              ),
                            ),
                            SizedBox(
                                width: 10), // Add spacing between checkbox and text
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  print(
                                      "Before setState: isInitialViewVisible = $isInitialViewVisible");
                                  // Unselect all items
                                  for (int j = 0; j < 4; j++) {
                                    itemSelection[j] = false;
                                  }
                                  itemSelection[i] =
                                  true; // Select current item
                                  isInitialViewVisible =
                                  false; // Hide initial view
                                });
                              },
                              child: _buildBottomSheetText(
                                  _getBottomSheetItemText(i)),
                            ), // Get text based on index
                          ],
                        ),
                      ),
                  ],
                )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/order/img_cancel_order.png",
                      scale: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          'Are you sure to cancel this order?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5, bottom: 1, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context); // Close the modal when tapped
                              isInitialViewVisible = true;
                            },
                            child: Container(
                              width: 150,
                              height: 52,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 17),
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
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CancelOrderStatus(
                                      status: CancelOrderStatusEnum.CANCELLED,
                                    ),
                              ));
                            },
                            child: Container(
                              width: 150,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFF4343),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  'Yes',
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
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }



  Widget _buildBottomSheetText(String text){
    return SizedBox(
      width: 283,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 14,
          fontFamily: 'Archivo-Regular',
          fontWeight: FontWeight.w400,
          height: 1.10,
        ),
      ),
    );
  }
  String _getBottomSheetItemText(int index) {
    switch (index) {
      case 0:
        return "Need to change delivery address";
      case 1:
        return "I made the mistake of choosing wrong quantity of products.";
      case 2:
        return "Modify existing order (Color, size, coupon code etc.)";
      case 3:
        return "Others";
      default:
        return "";
    }
  }








  Widget _buildCartItemsList() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE5E7EB),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
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
  Widget _buildStatusItem(OrderStatusEnum status, String title, String time,
      {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              Image.asset(
                _isStatusChecked(status, widget.status)
                    ? 'assets/order/icon_check.png'
                    : 'assets/order/icon_uncheck.png',
                height: 20,
                width: 20,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast) // Only add the following Padding widget if it's not the last item
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                _isStatusChecked(status, widget.status)
                    ? _buildLinearHeight(40)
                    : _buildDashedHeight(30),
                if (_isStatusChecked(status, widget.status)) // Only add the time if the status is checked
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: Color(0xFF66758C),
                        fontSize: 12,
                        fontFamily: 'Archivo-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
  Widget _buildLinearHeight(double height) {
    return Container(
      height: height,
      width: 1,
      color: Colors.greenAccent,
    );
  }

  Widget _buildDashedHeight(double height) {
    return SizedBox(
      height: height,
      width: 2,
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final double dashHeight = 5;
    final double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
