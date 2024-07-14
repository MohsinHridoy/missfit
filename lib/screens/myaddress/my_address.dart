import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/delivaryaddress/delivary_address.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/custom_app_bar.dart';
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
            CustomAppBar(
              title: 'Mon adresse',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.6,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
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
                    _buildDelivaryStatusTextItem('Adresse de livraison','$txtFirstName $txtLastName','$txtEmail','$txtPhoneNumber',DeliavryAddress(status: 'profile',)),
                    _buildDelivaryStatusTextItem('Adresse de facturation','$txtFirstName1 $txtLastName1','$txtEmail1','$txtPhoneNumber1',BillingDeliavryAddress(status: 'profile',)),
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
      padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15),
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
