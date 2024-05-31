import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miss_fit/screens/orderhistory/order_history.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isButtonEnabled = false;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Image.asset(
                "assets/profile/icon_gearbox.png",
                scale: 1.8,
              ),
              Container(
                width: 150,
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      decoration: ShapeDecoration(
                        color: Color(0xFFE5E7EB),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1.20,
                            color: Colors.white.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _image == null
                          ? Center(
                        child: Image.asset(
                          "assets/registration/icon_girl.png",
                          scale: 1.8,
                        ),
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 28,
                      left: 80,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF6F6F6),
                          shape: OvalBorder(),
                        ),
                        child: Image.asset(
                          "assets/profile/icon_camera.png",
                          scale: 2.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50,),
                    _buildIndicatorTitleText('General'),

                    _buildProfileItemCategory(context,"assets/profile/icon_personal_info.png",'Personal Info',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icon_address.png",'My Address',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icon_payment_card.png",'Payment Card',OrderHistory()),

                    _buildIndicatorTitleText('Subscription'),

                    _buildProfileItemCategory(context,"assets/profile/icon_manage_subscription.png",'Manage Subscription',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icons_terms_condition.png",'Terms & Conditions',OrderHistory()),
                    _buildIndicatorTitleText('Shop'),


                    _buildProfileItemCategory(context,"assets/profile/icon_order_history.png",'Order History',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icon_review_star.png",'Review',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icons_terms_condition.png",'Terms & Conditions',OrderHistory()),

                    _buildIndicatorTitleText('About'),
                    _buildProfileItemCategory(context,"assets/profile/icon_order_history.png",'Order History',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icon_order_history.png",'Order History',OrderHistory()),
                    _buildProfileItemCategory(context,"assets/profile/icon_order_history.png",'Order History',OrderHistory())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorTitleText(String text){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,top: 30,bottom: 10),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF66758C),
          fontSize: 14,
          fontFamily: 'Archivo-Regular',
          fontWeight: FontWeight.w400,
          height: 0.11,
        ),
      ),
    );
  }

  Widget _buildProfileItemCategory(BuildContext context,String imgPath,String title,Widget page){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(imgPath, scale: 2,),
                  SizedBox(width: 10,),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFF334155),
                      fontSize: 16,
                      fontFamily: 'Archivo-Regular',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                    ),
                  ),
                ],
              ),

              GestureDetector(
                  onTap: (){
                    print("Clicked");
                  },
                  child: Image.asset("assets/profile/icon_right_arrow.png", scale: 1.8,)

              ),
            ],
          ),

          SizedBox(height: 15,),

          Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0xFFF3F4F6),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
