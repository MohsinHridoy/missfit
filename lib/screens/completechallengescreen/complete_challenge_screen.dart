import 'package:flutter/material.dart';

class CompleteChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Container(
              width: 120, // Adjust size as needed
              height: 120, // Adjust size as needed
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage( "assets/workout/icon_circle_background.png"),
                ),

              ),

              child: Center(child: Image.asset("assets/workout/icon_thumbs_up.png",scale: 2,)),
            ),
            SizedBox(height: 20), // Adjust spacing as needed

            Text(
              'Well Done!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 24,
                fontFamily: 'Archivo-SemiBold',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20), // Adjust spacing as needed

            Text(
              'You have completed your challenge',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 0.09,
              ),
            ),

            SizedBox(height: 20), // Adjust spacing as needed

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.20, color: Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/workout/icon_flame.png",
                            scale: 1.7,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Burned calories',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF66758C),
                              fontSize: 14,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            '200 cal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 20,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 0.07,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Container(
                      height: 170,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 1.20, color: Color(0xFFE5E7EB)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/workout/icon_timer.png",
                            scale: 1.7,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'total times',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF66758C),
                              fontSize: 14,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.10,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            '32 mnts',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 20,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 0.07,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(), // Adjust spacing as needed
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 52,
                decoration: BoxDecoration(
                  color: Color(0xFFFF4343),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Archivo-SemiBold',
                      fontWeight: FontWeight.w600,
                      height: 0.09,
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
}
