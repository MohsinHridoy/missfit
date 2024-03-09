import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailOrPhoneNumberController = TextEditingController();
  bool _isValidEmail = false;

  @override
  void initState() {
    super.initState();
    _emailOrPhoneNumberController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _emailOrPhoneNumberController.removeListener(_validateEmail);
    _emailOrPhoneNumberController.dispose();
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
      backgroundColor: Color(0xFF18181B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/splash/splash_icon.png",
              height: 200,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Login to your account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Kanit',
                  fontWeight: FontWeight.w500,
                  height: 0.05,
                ),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: _isValidEmail ? Colors.green : Color(0xFF6B7280)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: TextFormField(
                  controller: _emailOrPhoneNumberController,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email or Phone Number',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Spacer(), // Pushes the login button to the bottom

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                decoration: ShapeDecoration(
                  color: _isValidEmail ? Colors.red : Color(0xFFF1F5F9),
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
                        color: Color(0xFF94A3B8),
                        fontSize: 16,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}