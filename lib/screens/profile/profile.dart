import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.70, -0.71),
            end: Alignment(-0.7, 0.71),
            colors: [Color(0xFFFF6443), Color(0xFFC1268C)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),

              Text(
                'Helen Hanf',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.05,
                ),
              ),
              SizedBox(height: 30,),

              Text(
                'Premium User',
                style: TextStyle(
                  color: Color(0xFFF1F5F9),
                  fontSize: 16,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                ),
              ),
              SizedBox(height: 100,),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 1195,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
