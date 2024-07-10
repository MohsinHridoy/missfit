import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/completeorderpage/complete_order_page.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';

import '../../common_widgets.dart';
import '../../widgets/common_buttons.dart';
import '../cartscreen/cart.dart';

enum CancelOrderStatusEnum { Processing,CANCELLED, Placed, Packed, Shipped, Packed1 }

class CancelOrderStatus extends StatefulWidget {
  final CancelOrderStatusEnum status;

  const CancelOrderStatus({Key? key, required this.status}) : super(key: key);

  @override
  State<CancelOrderStatus> createState() => _CancelOrderStatusState();
}

class _CancelOrderStatusState extends State<CancelOrderStatus> {
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
      CancelOrderStatusEnum checkStatus, CancelOrderStatusEnum targetStatus) {
    return CancelOrderStatusEnum.values.indexOf(checkStatus) <=
        CancelOrderStatusEnum.values.indexOf(targetStatus);
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
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width /4.9),
                    Text(
                      'Cancel Order Status',
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
                          height: 425,
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
                                SizedBox(height: 20),
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
                                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                  child: buildDivider(context),
                                ),

                                SizedBox(height: 40),

                                _buildStatusItem(CancelOrderStatusEnum.Processing,
                                    'Order Processing', 'Tuesday, 26 March, 09:13 AM'),
                                _buildStatusItem(CancelOrderStatusEnum.Placed, 'Order Canceled',
                                    'Tuesday, 26 March, 09:15 AM'),
                                _buildStatusItem(CancelOrderStatusEnum.Placed, 'Order Placed',
                                    'Tuesday, 26 March, 09:15 AM'),
                                _buildStatusItem(CancelOrderStatusEnum.Packed, 'Order Packed',
                                    'Tuesday, 26 March, 10:00 AM'),
                                _buildStatusItem(CancelOrderStatusEnum.Shipped, 'Order Shipped',
                                    'Wednesday, 27 March, 08:00 AM'),
                                _buildStatusItem(CancelOrderStatusEnum.Packed1, 'Second Packing',
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


                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: GestureDetector(
                onTap: (){
                  navigateToNextPage(context, DashBoard(number: 1,));
                },
                child: outlineButton(context, 'Back to Shopping'),
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
  Widget _buildStatusItem(CancelOrderStatusEnum status, String title, String time,
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
                    : 'assets/order/icon_delete.png',
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
  Widget _buildLinearHeight1(double height) {
    return Container(
      height: height,
      width: 2,
      color: Colors.red,
    );
  }
  Widget _buildDashedHeight(double height) {
    return SizedBox(
      height: height,
      width: 2,
      child: CustomPaint(
        painter: DashedLinePainter1(),
      ),
    );
  }
}

class DashedLinePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
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
