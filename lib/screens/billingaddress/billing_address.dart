import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/checkout/checkout_with_address.dart';
import 'package:miss_fit/screens/mysubscription/my_subscription.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/textfields.dart';

class BillingDeliavryAddress extends StatefulWidget {
  final String? status;

  const BillingDeliavryAddress({super.key, this.status});

  @override
  State<BillingDeliavryAddress> createState() => _BillingDeliavryAddressState();
}

class _BillingDeliavryAddressState extends State<BillingDeliavryAddress> {
  Map<String, dynamic> userData = {};

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  TextEditingController _regionController = TextEditingController();
  TextEditingController _postCodeController = TextEditingController();
  TextEditingController _streetAddressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  bool _isAllFieldsFilled = false;
  bool _copyShippingToBilling = false;

  @override
  void initState() {
    super.initState();
    if (widget.status == 'profile') _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString('shippingaddress');
    print(jsonData);
    if (jsonData != null) {
      setState(() {
        final userData = jsonDecode(jsonData);
        _firstNameController.text = userData['firstName'];
        _lastNameController.text = userData['lastName'];
        _emailController.text = userData['email'];
        _phoneNumberController.text = userData['phoneNumber'];
        _regionController.text = userData['region'];
        _postCodeController.text = userData['postCode'];
        _streetAddressController.text = userData['streetAddress'];
        _cityController.text = userData['city'];
        _addressController.text = userData['address'];
        _isAllFieldsFilled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFF6F6F6) ,
      body: Stack(
        children: [
          Column(
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
                      SizedBox(
                        width: widget.status == 'cart'
                            ? MediaQuery.of(context).size.width / 5.2
                            : (widget.status == 'profile'
                            ? MediaQuery.of(context).size.width / 7.2
                            : MediaQuery.of(context).size.width / 3.4),
                      ),
                      Text(
                        widget.status == 'cart'
                            ? 'Adresse de livraison'
                            : (widget.status == 'profile'
                            ? 'Informations de facturation'
                            : 'CheckOut'),
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
                      SizedBox(
                        height: 15,
                      ),
                      widget.status == 'profile'
                          ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Add Billing Address',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Kanit-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                          ),
                        ),
                      )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      widget.status == 'profile'|| widget.status == 'cart'
                          ? _buildSelectAllCheckbox()
                          : SizedBox(),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Informations personnelles',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      textFormFieldAddress(context,_firstNameController,'Prénom',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_lastNameController,'Nom de famille',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_emailController,'Email',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_phoneNumberController,'Numéro de téléphone''Phone Number',TextInputType.phone, _checkFieldsFilled),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                        child: Text(
                          'Adresse',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                      textFormFieldAddress(context,_regionController,'Région',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_postCodeController,'Code Postal',TextInputType.phone, _checkFieldsFilled),
                      textFormFieldAddress(context,_streetAddressController,'Adresse de la rue',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_cityController,'Ville',TextInputType.emailAddress, _checkFieldsFilled),
                      textFormFieldAddress(context,_addressController,'Adresse',TextInputType.emailAddress, _checkFieldsFilled),
                      SizedBox(
                        height: 130,
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
              child: GestureDetector(
                onTap: () {
                  _saveData();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20,top: 12),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 17),
                    decoration: ShapeDecoration(
                      color: _isAllFieldsFilled
                          ? Colors.red
                          : Color(0xFFD1D5DB),
                      // Dynamic color based on validation
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Center(
                      child: Text(
                        widget.status != 'profile'
                            ? 'Enregistrer continuer'
                            : 'Enregistrer continuer',
                        style: TextStyle(
                          color: _isAllFieldsFilled
                              ? Colors.white
                              : Color(0xFF334155),
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
            ),
          )

        ],
      ),
    );
  }

  Widget _buildSelectAllCheckbox() {
    // Determine if all items are checked

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
          Padding(
            padding: const EdgeInsets.only(left: 15.0,top: 8),
            child: Text(
              "Même que l'adresse d'expédition",
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 14,
                fontFamily: 'Archivo-Medium',
                fontWeight: FontWeight.w500,
                height: 0.10,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _copyShippingToBilling = !_copyShippingToBilling;
                    _loadData();
                  });
                },
                child: Container(
                  width: 30,
                  height: 18,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: _copyShippingToBilling==true ? Colors.orange[400]:Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(12), // Half of width or height
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !_copyShippingToBilling,
                        child: Container(
                          width: 16,
                          height: 16,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _copyShippingToBilling,
                        child: Container(
                          width: 16,
                          height: 16,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
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

  void _checkFieldsFilled() {
    setState(() {
      _isAllFieldsFilled = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          // Add other controllers if you have more fields
          true; // This true is just to avoid syntax error, you can remove it when you add your last controller check
    });
  }

  Future<void> _saveData() async {
    if (_isAllFieldsFilled) {
      final prefs = await SharedPreferences.getInstance();
      final data = {
        'firstName': _firstNameController.text,
        'lastName': _lastNameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneNumberController.text,
        'region': _regionController.text,
        'postCode': _postCodeController.text,
        'streetAddress': _streetAddressController.text,
        'city': _cityController.text,
        'address': _addressController.text,
      };
      final jsonData = jsonEncode(data);
      await prefs.setString('billing_address', jsonData);
      if (widget.status == 'profile') {
        Navigator.pop(context);
      } else if (widget.status == 'subscription') {
        navigateToNextPage(context, MySubscription());
      } else {
        navigateToNextPage(context, CheckOutAddress());
      }
    } else {
      // Handle the case where not all fields are filled
      // Possibly show an alert dialog or a snackbar
    }
  }
}