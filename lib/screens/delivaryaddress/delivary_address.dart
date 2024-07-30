import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/reviewsummery/review_summery_screen.dart';
import 'package:miss_fit/screens/reviewsummery/review_summery_subscription_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliavryAddress extends StatefulWidget {
  String? status;

  DeliavryAddress({super.key, this.status});

  @override
  State<DeliavryAddress> createState() => _DeliavryAddressState();
}

class _DeliavryAddressState extends State<DeliavryAddress> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF6F6F6),
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
                    widget.status=='subscription' ?SizedBox(width: MediaQuery.of(context).size.width / 3.1):SizedBox(width: MediaQuery.of(context).size.width / 4.7),
                    Text(
                      widget.status=='subscription' ?'Vérifier':'Adresse de livraison',
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
                    widget.status!='subscription' ?Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Ajouter une adresse de livraison',
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 20,
                          fontFamily: 'Kanit-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 0.06,
                        ),
                      ),
                    ):SizedBox(),


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
                    _textFormField(_firstNameController, 'Prénom'),
                    _textFormField(_lastNameController, 'Nom de famille'),
                    _textFormField(_emailController, 'Email'),
                    _textFormField(_phoneNumberController, 'Numéro de téléphone''Phone Number'),
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
                    _textFormField(_regionController, 'Région'),
                    _textFormField(_postCodeController, 'Code Postal'),
                    _textFormField(_streetAddressController, 'Adresse de la rue'),
                    _textFormField(_cityController, 'Ville'),
                    _textFormField(_addressController, 'Adresse'),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (widget.status == 'subscription') {

                  navigateToNextPage(context, AddNewCard(status: 'subscription',));
                  // navigateToNextPage(context, ReviewSummary1());

                }
                else {
                  _isAllFieldsFilled ? _saveData() : null;

                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,

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
                      'Enregistrer continuer',
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
            )

          ],
        ),
      ),
    );
  }

  void _checkFieldsFilled() {
    setState(() {
      _isAllFieldsFilled = _firstNameController.text.isNotEmpty &&
          _lastNameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneNumberController.text.isNotEmpty &&
          _regionController.text.isNotEmpty &&
          _postCodeController.text.isNotEmpty &&
          _streetAddressController.text.isNotEmpty &&
          _cityController.text.isNotEmpty &&
          _addressController.text.isNotEmpty &&
          // Add other controllers if you have more fields
          true; // This true is just to avoid syntax error, you can remove it when you add your last controller check
    });
  }

  Future<void> _saveData() async {

    if(widget.status=='profile')
    {
      Navigator.pop(context);

    }
    else if (_isAllFieldsFilled) {
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
      await prefs.setString('shippingaddress', jsonData);

      // Optionally navigate to another page or show a message
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BillingDeliavryAddress(status: widget.status,)),
      );
    } else {
      // Handle the case where not all fields are filled
      // Possibly show an alert dialog or a snackbar
    }
  }

  Widget _textFormField(TextEditingController controller, String Label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            _checkFieldsFilled(); // This will be called every time the text changes
          },
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 16,
            fontFamily: 'Archivo-Medium',
            fontWeight: FontWeight.w500,
            height: 1.09,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
            labelText: Label,
            labelStyle: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
          ),
        ),
      ),
    );
  }
}