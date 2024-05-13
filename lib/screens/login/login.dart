import 'package:flutter/material.dart';
import 'package:miss_fit/screens/otp/otp.dart';
import 'package:miss_fit/screens/otp/otp001.dart';




class LoginPage extends StatefulWidget {
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

    // Add listener to the focus node to update _isEmailFocused
    _emailOrPhoneNumberFocusNode.addListener(() {
      setState(() {
        _isEmailFocused = _emailOrPhoneNumberFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _emailOrPhoneNumberController.removeListener(_validateEmail);
    _emailOrPhoneNumberController.dispose();
    _emailOrPhoneNumberFocusNode.dispose();

    super.dispose();
  }

  void _validateEmail() {
    setState(() {
      _isValidEmail = _isEmailValid(_emailOrPhoneNumberController.text);
    });
  }

  bool _isEmailValid(String email) {
    // Basic email validation, you can customize this according to your needs
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
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
              child: Text(
                'Login to your account',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 24,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w600,
                  height: 0.05,
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
                  controller: _emailOrPhoneNumberController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailOrPhoneNumberFocusNode,

                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 1.09,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                    ),
                    labelText: _isEmailFocused || _emailOrPhoneNumberController.text.isNotEmpty ? 'Email' : 'Enter your email address',
                    labelStyle: TextStyle(color: Color(0xFF334155),
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
            Spacer(), // Pushes the login button to the bottom

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
              child: GestureDetector(
                onTap: (){
                  _isValidEmail ?
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Otp001(email: _emailOrPhoneNumberController.text)),
                  ):null;
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  decoration: ShapeDecoration(
                    color: _isValidEmail ?  Color(0xFFFF4343) :  Color(0xFFD1D5DB),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color:_isValidEmail ? Colors.white.withOpacity(0.9):Color(0xFF334155),
                          // color: Color(0xFF94A3B8),
                          fontSize: 16,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}