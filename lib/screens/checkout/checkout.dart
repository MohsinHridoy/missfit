import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';

import '../../common_widgets.dart';
import '../../widgets/custom_app_bar.dart';
import '../cartscreen/cart001.dart';

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

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextEditingController _voucherCodeController = TextEditingController();
  bool isVoucherCodeResponse = false;
  bool isEditable=true;

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

  List<CartItem> removedItems = [];
  FocusNode _voucherCodeFocusNode = FocusNode();
  bool isVoucherCodeValid = false;

  @override
  void initState() {
    super.initState();
    _voucherCodeController.addListener(_validateVoucherCode);
  }

  void _validateVoucherCode() {
    setState(() {
      isVoucherCodeValid = _voucherCodeController.text.length > 3;
    });
  }

  @override
  void dispose() {
    _voucherCodeController.dispose();
    _voucherCodeFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              children: [
                CustomAppBar(
                  title: 'Checkout',
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
                        SizedBox(height: 20),
                        Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: title_textView_Kt_SBld('Lieu de livraison')
                        ),
                        SizedBox(height: 10),

                        GestureDetector(
                          onTap: (){
                            navigateToNextPage(context,  DeliavryAddress(status: 'cart',));

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width, // Container width
                              height: 44,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ), // Background color
                              child: Center(
                                child: Text(
                                  'Ajouter une adresse de livraison',
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

                        SizedBox(height: 25),

                        _buildCartItemsList(),
                        SizedBox(height: 40),
                        _buildVoucherCode(),
                        SizedBox(
                          height: 40,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 25.0,bottom: 10),
                          child: Text(
                            'Récapitulatif de la commande',
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
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            Positioned(
              bottom: 0,
              child: GlossyContainer(
                  width: MediaQuery.of(context).size.width,
                  height: 76,
                  blendMode: BlendMode.srcATop,
                  // opacity:0.1,
                  color: Colors.white.withOpacity(0.04),
                  // decoration: ShapeDecoration(
                  //   color: Colors.white.withOpacity(0.05000000074505806),
                  //   shape: RoundedRectangleBorder(
                  //     side: BorderSide(
                  //       width: 1,
                  //       color:
                  //       Colors.white.withOpacity(0.10999999940395355),
                  //     ),
                  //   ),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0,left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Prix total',
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

                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: 150,
                            height: 44,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD1D5DB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Center(
                              child: Text(
                                'Vérifier',
                                style: TextStyle(
                                  color: Color(0xFF66758C),
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
                    ],
                  )),
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
        buildSummeryItemText(context,'Sous-total', 'CHF 140'),

        buildSummeryItemText(context,'Rabais', '-CHF 140'),
        buildSummeryItemText(context,'T.V.A', 'CHF 140'),
        buildSummeryItemText(context,'Frais de port', 'CHF 140'),
        buildSummeryItemText1('Total', 'CHF 140'),
      ],
    );
  }


  Widget _buildVoucherCode() {
    return GestureDetector(
      onTap: () {
        // Dismiss the keyboard when tapping outside of the text field
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ajouter un code promo ou un \nbon d'achat",
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 20,
                fontFamily: 'Kanit-Medium',
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 44,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,bottom: 2),
                      child: TextField(
                        controller: _voucherCodeController,
                        enabled:isEditable ,
                        cursorColor: Color(0xFF9CA3AF).withOpacity(0.7),
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 14,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                        decoration: InputDecoration(
                          hintText: _voucherCodeFocusNode.hasFocus ?'': "Code du bon d'achat",
                          hintStyle: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 14,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                        ),
                      ),
                    ),
                  ),
                  isVoucherCodeResponse==false?  GestureDetector(
                    onTap:()
                    {
                      setState(() {
                        isVoucherCodeResponse=true;
                        isEditable=false;

                      });
                    },
                    child: Container(
                      width: 93.47,
                      height: 44,
                      decoration: BoxDecoration(
                        color:_voucherCodeController.text.length>3 ?  Color(0xFFFF4343):Color(0xFF6B7280),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Appliquer',
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
                  ):Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/subscription/icon_cross.png",
                            scale: 2,
                          ),
                          Text(
                            'Retirer',
                            style: TextStyle(
                              color: Color(0xFFEF4444),
                              fontSize: 14,
                              fontFamily: 'Archivo-Medium',
                              fontWeight: FontWeight.w500,
                              height: 1.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            if(isVoucherCodeResponse==true)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Votre code promotionnel est appliqué avec succès.',
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 14,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 0.10,
                  ),
                ),
              )

          ],
        ),
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
              padding: const EdgeInsets.only(left: 15.0, right: 5),
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
              fontFamily: 'Archivo',
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
                  padding: const EdgeInsets.only(left: 4.0, right: 8),
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 14,
                      fontFamily: 'Archivo',
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

                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
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
                                          height: 0.5,
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
                                            color:item.quantity > 1? Color(0xFFFF4343):Color(0xFF94A3B8),
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
                                            left: 10.0, right: 10.0,top: 5),
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

                          buildDivider(context)

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
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '"${removedItem.title}" Deleted',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 14,
                                fontFamily: 'Archivo-Regular',
                                fontWeight: FontWeight.w400,
                                height: 0.10,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cartItems.add(removedItem);
                                  removedItems.remove(removedItem);
                                });
                              },
                              child: SizedBox(
                                width: 100,
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
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }
  double _calculateListItemHeight(CartItem item) {
    // Adjust this value based on your ListTile's content
    double defaultItemHeight = 50.0;
    // You can calculate the height based on the content of the list item
    // For example, you can add the heights of text widgets, buttons, etc.
    // Here, we're just returning a default height for simplicity
    return defaultItemHeight;
  }

  void _removeSelectedItems() {
    setState(() {
      removedItems.addAll(cartItems.where((item) => item.isChecked));
      cartItems.removeWhere((item) => item.isChecked);
    });
  }}