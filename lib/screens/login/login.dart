import 'package:flutter/material.dart';




class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailOrPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFF18181B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 62),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFF18181B)),
              child: Image.asset("assets/splash/splash_icon.png"),
            ),
            Text(
              'Login to your account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w500,
                height: 0.05,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 320,
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF6B7280)),
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
            SizedBox(height: 20),
            Spacer(), // Pushes the login button to the bottom

            Container(
              width: 320,
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              decoration: ShapeDecoration(
                color: Color(0xFFFF4343),
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
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}