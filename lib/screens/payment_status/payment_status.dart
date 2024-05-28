import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:miss_fit/screens/e_receipt_screen/e_receipt_screen.dart';

class PaymentStatus extends StatelessWidget {
  const PaymentStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        // Handle back button tap
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.2),
                    Text(
                      'Payment',
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
            SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Lottie.asset(
                'assets/lottie_anim/tik_anim.json',
                // Path to the Lottie JSON file in the assets folder
                height: 200, // Adjust height as needed
                width: 200, // Adjust width as needed
                fit: BoxFit.cover, // Adjust the fit
                repeat: false, // Play animation only once
              ),
            ),
            SizedBox(
              width: 320,
              child: Text(
                'Payment Successfull',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.07,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 320,
                child: Text(
                  'You Have successfullly booked',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF66758C),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 320,
                child: Text(
                  'Programme d\'entraînement avec suivi',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-SemiBold',
                    fontWeight: FontWeight.w600,
                    height: 0.09,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   isVisible=true;
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => DashBoard()),
                    //   );
                    // });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4343),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w500,
                          height: 1.11,
                        ),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EReceiptScreen()),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'View E-Receipt',
                      style: TextStyle(
                        color: Color(0xFFFF4343),
                        fontSize: 16,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.09,
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
}
