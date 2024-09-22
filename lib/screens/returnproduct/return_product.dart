import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/returnrequest/return_request.dart';

import '../../common_widgets.dart';
import '../../widgets/custom_app_bar.dart';
import '../cartscreen/cart.dart';


class CartItem1 {
  String title;
  String image;
  double weight;
  bool isChecked; // Track if the item is selected for return

  CartItem1({
    required this.title,
    required this.image,
    required this.weight,
    this.isChecked = false, // Default to unchecked
  });
}


class ReturnProduct extends StatefulWidget {
  const ReturnProduct({super.key});

  @override
  State<ReturnProduct> createState() => _ReturnProductState();
}

class _ReturnProductState extends State<ReturnProduct> {
  List<CartItem1> cartItems = [
    CartItem1(
      title: 'Dumbbells',
      image: 'assets/cart/cart_items.png',
      weight: 0.5,
    ),
    CartItem1(
      title: 'Dumbbells',
      image: 'assets/cart/cart_items.png',
      weight: 0.7,
    ),
    CartItem1(
      title: 'Dumbbells',
      image: 'assets/cart/cart_items.png',
      weight: 0.6,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    bool hasSelectedItems = cartItems.any((item) => item.isChecked);

    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title:  'Retourner le produit',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 5.5,
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 320,
                child: Text(
                  "Sélectionnez l'article que vous souhaitez retourner",
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 20,
                    fontFamily: 'Kanit-Semibold',
                    fontWeight: FontWeight.w600,
                    height: 1.06,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Expanded(child: _buildCartItemsList()),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  // Handle continue button tap
                  List<CartItem1> selectedItems = cartItems.where((item) => item.isChecked).toList();
                  // Navigate or perform action with selected items

                  if(hasSelectedItems)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReturnRequest()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: hasSelectedItems?Color(0xFFFF4343): Color(0xFFD1D5DB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child:Text(
                      'Continuer',
                      style: TextStyle(
                        color:hasSelectedItems? Colors.white:Color(0xFF66758C),
                        fontSize: 16,
                        fontFamily: 'Archivo-Semibold',
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
    );
  }

  Widget _buildCartItemsList() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 20, right: 25),
        child: Column(
          children: cartItems.map((item) {
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
                              item.isChecked = !item.isChecked; // Toggle selection
                            });
                          },
                          child: Image.asset(
                            item.isChecked ? "assets/cart/icon_checkbox.png" : "assets/cart/icon_uncheck.png",
                            scale: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 65,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Color(0xFF94A3B8).withOpacity(0.3),
                              image: DecorationImage(
                                image: AssetImage(item.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 15),
                          child: SizedBox(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  item.title,
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                ),
                                SizedBox(height: 35),
                                Text(
                                  '${item.weight} kg',
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: SizedBox(
                            width: 94,
                            child: Text(
                              'CHF 25.00',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 14,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w500,
                                height: 0.10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    buildDivider(context)

                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}