import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/checkout/checkout.dart';

class CartItem {
  final String title;
  int quantity;
  final String image;
  final double weight;
  bool isChecked;

  CartItem({
    required this.title,
    required this.quantity,
    required this.image,
    required this.weight,
    this.isChecked = false,
  });
}

class Cart001 extends StatefulWidget {
  const Cart001({Key? key}) : super(key: key);

  @override
  State<Cart001> createState() => _Cart001State();
}

class _Cart001State extends State<Cart001> {
  TextEditingController _voucherCodeController = TextEditingController();

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
    CartItem(
        title: 'Dumbbells',
        quantity: 1,
        image: 'assets/cart/cart_items.png',
        weight: 0.6),
  ];

  List<CartItem> removedItems = [];

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
                        Navigator.pop(context); // This will pop the current screen off the navigation stack and return to the previous screen
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 2.8),
                    Text(
                      'Cart',
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
                    SizedBox(height: 25),
                    _buildSelectAllCheckbox(),
                    SizedBox(height: 30),
                    _buildCartItemsList(),
                    SizedBox(height: 30),
                    _buildVoucherCode(),
                    SizedBox(
                      height: 50,
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
                      height: 20,
                    ),
                    _buildSummeryItemText('Subtotal', 'CHF 140'),
                    _buildRemovedItemsList(),
                    _buildOrderSummeryItem(),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 76,

                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.05000000074505806),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color:
                                  Colors.white.withOpacity(0.10999999940395355),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0,left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total price',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 10,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0.14,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'CHF 210',
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigateToNextPage(context,CheckOut());

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: 150,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF4343),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Checkout',
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
                            ),
                          ],
                        )),

                    // SizedBox(
                    //   height: 100,
                    // ),
                  ],
                ),
              ),
            ),
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
        _buildSummeryItemText('Discount', 'CHF 140'),
        _buildSummeryItemText('Vat', 'CHF 140'),
        _buildSummeryItemText('Shipping Charge', 'CHF 140'),
        _buildSummeryItemText('Grand Total', 'CHF 140'),
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

  Widget _buildVoucherCode() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add promo code or voucher',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 20,
              fontFamily: 'Kanit-Medium',
              fontWeight: FontWeight.w500,
              height: 0.06,
            ),
          ),
          SizedBox(height: 35),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 44,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextField(
                      controller: _voucherCodeController,
                      decoration: InputDecoration(
                        labelText: 'Voucher code',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Color(0xFF66758C),
                          fontSize: 12,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 93.47,
                  height: 44,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  decoration: ShapeDecoration(
                    color: Color(0xFF6B7280),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Apply',
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectAllCheckbox() {
    // Determine if all items are checked
    bool isAllSelected =
        cartItems.isNotEmpty && cartItems.every((item) => item.isChecked);

    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
              height: 39,
              width: 5, // Width of the amber stripe
              decoration: BoxDecoration(
                color: Colors.orange[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              )),
          GestureDetector(
            onTap: () {
              setState(() {
                bool newState =
                    !isAllSelected; // Determine the new state based on the inverse of all selected
                cartItems.forEach((item) => item.isChecked = newState);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10),
              child: Image.asset(
                isAllSelected
                    ? "assets/cart/icon_checkbox.png"
                    : "assets/cart/icon_uncheck.png",
                scale: 2,
              ),
            ),
          ),
          Text(
            'Select All (${cartItems.length} items)',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 14,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 18,
                width: 18,
                child: Image.asset(
                  "assets/cart/icon_remove.png",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _removeSelectedItems();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 12),
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 14,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildCartItemsList() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left:20,right: 25),
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
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item.isChecked = !item.isChecked;
                                    });
                                  },
                                  child: Image.asset(
                                    item.isChecked
                                        ? "assets/cart/icon_checkbox.png"
                                        : "assets/cart/icon_uncheck.png",
                                    scale: 2,
                                  )),
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
                                            top: 20.0, bottom: 30),
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
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 45.0),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (item.quantity > 1)
                                              item.quantity--;
                                          });
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.only(
                                            top: 4.50,
                                            left: 4,
                                            right: 4,
                                            bottom: 3.50,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF94A3B8),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "assets/cart/icon_minus.png"),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        child: SizedBox(
                                          width: 20,
                                          child: Center(
                                            child: Text(
                                              '${item.quantity}',
                                              style: TextStyle(
                                                color: Color(0xFF334155),
                                                fontSize: 14,
                                                fontFamily: 'Archivo-Regular',
                                                fontWeight: FontWeight.w400,
                                                height: 0.10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            item.quantity++;
                                          });
                                        },
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          padding: const EdgeInsets.only(
                                            top: 4.50,
                                            left: 4,
                                            right: 4,
                                            bottom: 3.50,
                                          ),
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFF4343),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "assets/cart/icon_add.png"),
                                          ),
                                        ),
                                      )
                                    ],
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


  Widget _buildRemovedItemsList() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: List.generate(
                removedItems.length,
                (index) {
                  final removedItem = removedItems[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 1, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '"${removedItem.title}" Deleted',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 14,
                                fontFamily: 'Archivo-Regular',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                cartItems.add(removedItem);
                                removedItems.remove(removedItem);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Container(
                                width: 40,
                                height: 40,
                                color: Colors.transparent,
                                child: Center(
                                  child: Text(
                                    'Undo',
                                    style: TextStyle(
                                      color: Color(0xFFEF4444),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Regular',
                                      fontWeight: FontWeight.w400,
                                      height: 0.11,
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
                },
              ),
            )));
  }

  void _removeSelectedItems() {
    setState(() {
      removedItems.addAll(cartItems.where((item) => item.isChecked));
      cartItems.removeWhere((item) => item.isChecked);
    });
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