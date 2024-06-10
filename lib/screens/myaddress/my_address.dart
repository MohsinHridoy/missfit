import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cartscreen/cart001.dart';


class MyAddress extends StatefulWidget {
  const MyAddress({Key? key}) : super(key: key);

  @override
  State<MyAddress> createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  TextEditingController _voucherCodeController = TextEditingController();
  Map<String, dynamic> shippingAddress = {};
  Map<String, dynamic> billingAddress = {};



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
                    SizedBox(width: MediaQuery.of(context).size.width / 3.4),
                    Text(
                      'My Address',
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
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
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
                    SizedBox(height: 5),
                    _buildDelivaryStatusTextItem('Shipping Address','$txtFirstName $txtLastName','$txtEmail','$txtPhoneNumber',DeliavryAddress()),
                    _buildDelivaryStatusTextItem('Billing Address','$txtFirstName1 $txtLastName1','$txtEmail1','$txtPhoneNumber1',BillingDeliavryAddress()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDelivaryStatusTextItem(String title,String name,String phoneNumber,String Email,Widget page) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => page),
                          );
                        },

                        child: Image.asset("assets/order/icon_edit.png",scale: 2.1,))
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




}
