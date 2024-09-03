import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class CheckOutAddress extends StatefulWidget {
  const CheckOutAddress({Key? key}) : super(key: key);

  @override
  State<CheckOutAddress> createState() => _CheckOutAddressState();
}

class _CheckOutAddressState extends State<CheckOutAddress> {
  TextEditingController _voucherCodeController = TextEditingController();
  Map<String, dynamic> shippingAddress = {};
  Map<String, dynamic> billingAddress = {};

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

  String? txtFirstName, txtLastName, txtEmail, txtPhoneNumber, txtRegion, txtPostCode, txtStreetAddress, txtCity, txtAddress;
  String? txtFirstName1, txtLastName1, txtEmail1, txtPhoneNumber1, txtRegion1, txtPostCode1, txtStreetAddress1, txtCity1, txtAddress1;

  @override
  void initState() {
    super.initState();
    _loadData();
    _loadData1();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('shippingaddress');
    if (jsonData != null) {
      final userData = jsonDecode(jsonData);
      setState(() {
        txtFirstName = userData['firstName'] ?? '';
        txtLastName = userData['lastName'] ?? '';
        txtEmail = userData['email'] ?? '';
        txtPhoneNumber = userData['phoneNumber'] ?? '';
        txtRegion = userData['region'] ?? '';
        txtPostCode = userData['postCode'] ?? '';
        txtStreetAddress = userData['streetAddress'] ?? '';
        txtCity = userData['city'] ?? '';
        txtAddress = userData['address'] ?? '';
        // _isAllFieldsFilled=true;
      });
    }
  }


  Future<void> _loadData1() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('billing_address');
    if (jsonData != null) {
      final userData = jsonDecode(jsonData);
      setState(() {
        txtFirstName = userData['firstName'] ?? '';
        txtLastName = userData['lastName'] ?? '';
        txtEmail = userData['email'] ?? '';
        txtPhoneNumber = userData['phoneNumber'] ?? '';
        txtRegion = userData['region'] ?? '';
        txtPostCode = userData['postCode'] ?? '';
        txtStreetAddress = userData['streetAddress'] ?? '';
        txtCity = userData['city'] ?? '';
        txtAddress = userData['address'] ?? '';
        // _isAllFieldsFilled=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Stack(
        children: [
          Column(
            children: [

              CustomAppBar(
                title: 'Vérifier',
                onBackTap: () {
                  Navigator.pop(context);
                },
                iconSpacing: 3,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Padding(
                          padding: const EdgeInsets.only(left: 25.0,top: 25),
                          child: title_textView_Kt_SBld('Lieu de livraison')

                      ),
                      _buildDelivaryStatusTextItem('Adresse de livraison','$txtFirstName $txtLastName','$txtEmail','$txtPhoneNumber',DeliavryAddress(status: 'profile',)),
                      _buildDelivaryStatusTextItem('Adresse de facturation','$txtFirstName1 $txtLastName1','$txtEmail1','$txtPhoneNumber1',BillingDeliavryAddress(status: 'profile',)),
                      SizedBox(height: 10),


                      Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: title_textView_Kt_SBld( 'Délai de livraison')
                      ),
                      _buildEsrtimatedDateStatus(),
                      Padding(
                          padding: const EdgeInsets.only(left: 25.0,top: 25),
                          child: title_textView_Kt_SBld('Détails du produit')
                      ),
                      SizedBox(height: 25),

                      _buildCartItemsList(),
                      SizedBox(height: 25),


                      Padding(
                          padding: const EdgeInsets.only(left: 25.0,bottom: 10),
                          child: title_textView_Kt_SBld('Récapitulatif de la commande')


                      ),

                      SizedBox(
                        height: 10,
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
                //
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
                        navigateToNextPage(context,PaymentScreen());
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
                            child:  Text(
                              'Vérifier',
                              style: TextStyle(
                                color: Colors.white,
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
    );
  }
  Widget _buildEsrtimatedDateStatus() {
    return Padding(
      padding: const EdgeInsets.only(left: 23.0,right: 23,bottom: 20),
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
              child: Center(child: Image.asset("assets/order/icon_box.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,top: 6),
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
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: SizedBox(
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDelivaryStatusTextItem(String title,String name,String phoneNumber,String Email,Widget page) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 175,
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
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),

                    GestureDetector(
                      onTap: (){
                        navigateToNextPage(context, page);
                      },
                        child: Image.asset("assets/order/icon_edit.png",scale: 2.1,)

                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
                child: Text(
                  name,
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
              _buildDelivaryDetailsTextItem('Phone Number : $phoneNumber'),
              _buildDelivaryDetailsTextItem('Email : $Email'),
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
                                          height: 0.5,
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

                          buildDivider(context),

                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }


}
