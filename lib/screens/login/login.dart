import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/otp/otp001.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../strings.dart';

class LoginPage extends StatefulWidget {
  final String? status;

  const LoginPage({Key? key, this.status}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailOrPhoneNumberController = TextEditingController();
  bool _isValidEmail = false;
  bool _isEmailFocused = false;
  late FocusNode _emailOrPhoneNumberFocusNode;

  @override
  void initState() {
    super.initState();
    _emailOrPhoneNumberController.addListener(_validateEmail);
    _emailOrPhoneNumberFocusNode = FocusNode();

    _emailOrPhoneNumberFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailOrPhoneNumberFocusNode.hasFocus;
      });
    });
  }
  void loadSharedData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedOut', false);
  }
  void _validateEmail() {
    setState(() {
      _isValidEmail = _isEmailValid(_emailOrPhoneNumberController.text);
    });
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(_emailOrPhoneNumberFocusNode);

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Container(
                  height: 150,
                  width: 180,
                  child: Center(
                    child: Image.asset(
                      "assets/splash/splash_icon.png",
                      height: 140,
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                width: 320,

                child: Text(
                  loginToYourAccountText_fr,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 24,
                    fontFamily: 'Kanit-Medium',
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: TextFormField(
                  // autofocus: true,
                  controller: _emailOrPhoneNumberController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  focusNode: _emailOrPhoneNumberFocusNode,
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
                    labelText: _emailOrPhoneNumberFocusNode.hasFocus ? 'Email' : '${enterYourEmailAddressText_fr}',
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
            ),
            SizedBox(height: 20),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
              child: GestureDetector(
                onTap: (){
                  if(widget.status=='profile') {
                    loadSharedData();
                    _isValidEmail ?

                    _navigateToDashboard(context):null;
                  } else if(widget.status=='onboarding') {
                    loadSharedData();
                    _isValidEmail ?
                    navigateToNextPage(context, Otp001(email: _emailOrPhoneNumberController.text,status: 'onboarding',))
                        : null;
                  }
                  else
                  {
                    loadSharedData();
                    _isValidEmail ?

                    _navigateToDashboard1(context):null;
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: _isValidEmail ?  Color(0xFFFF4343) :  Color(0xFFD1D5DB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        color:_isValidEmail ? Colors.white.withOpacity(0.9) : Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 1.09,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  //
  @override
  void dispose() {
    // _emailOrPhoneNumberController.removeListener(_validateEmail);
    // _emailOrPhoneNumberController.dispose();
    // _emailOrPhoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _navigateToDashboard(BuildContext context) async {
    // Unfocus the text field
    // FocusManager.instance.primaryFocus!.unfocus();
    FocusScope.of(context).unfocus();
    navigateToNextPage(context,Otp001(email:  _emailOrPhoneNumberController.text,status: 'profile',));


  }

  void _navigateToDashboard1(BuildContext context) async {
    // Unfocus the text field
    // FocusManager.instance.primaryFocus!.unfocus();
    FocusScope.of(context).unfocus();
    navigateToNextPage(context,Otp001(email:  _emailOrPhoneNumberController.text,status: 'profile',));


  }
}


