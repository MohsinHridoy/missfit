import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/login/login.dart';
import 'package:miss_fit/screens/myaddress/my_address.dart';
import 'package:miss_fit/screens/mysubscription/my_subscription.dart';
import 'package:miss_fit/screens/orderhistory/order_history.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:miss_fit/screens/payment_status/payment_status.dart';
import 'package:miss_fit/screens/personalinfo/personal_info.dart';
import 'package:miss_fit/screens/review_list_profile/review_list_profile.dart';
import 'package:miss_fit/screens/settings/settings.dart';
import 'package:miss_fit/screens/termsconditions/terms_conditions.dart';

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
              Column(
                children: [
                  SizedBox(
                    height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: (){
                            navigateToNextPage(context,Settings());



                          },
                          child: Image.asset(
                            "assets/profile/icon_gearbox.png",
                            scale: 1.8,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
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
                                    ? Image.asset(
                                  "assets/review/icon_girl.png",
                                  fit: BoxFit.cover,
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
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateToNextPage(context,DashBoard(number: 3,));
                      },
                      child: Container(
                        width: 174,
                        height: 36,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFFA142),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/profile/icon_manage_subscription.png"),
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(
                                'Buy Subscription',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                ],
              ),

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
                    SizedBox(
                      height: 30,
                    ),
                    _buildIndicatorTitleText('General'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_personal_info.png",
                        'Personal Info',
                        PersonalInfo()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_address.png",
                        'My Address',
                        MyAddress()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_payment_card.png",
                        'Payment Card',
                        AddNewCard(
                          status: 'profile',
                        )),
                    _buildIndicatorTitleText('Subscription'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_manage_subscription.png",
                        'Manage Subscription',
                        MySubscription()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Terms & Conditions',
                        TermConditions()),
                    _buildIndicatorTitleText('Shop'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_order_history.png",
                        'Order History',
                        OrderHistory()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_review_star.png",
                        'Review',
                        ReviewListProfile()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Terms & Conditions',
                        TermConditions()),
                    _buildIndicatorTitleText('About'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Terms & Conditions',
                        TermConditions()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Privacy & Policy',
                        TermConditions()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_google_play.png",
                        'Rate Us on Google Play',
                        TermConditions()),
                    SizedBox(
                      height: 15,
                    ),
                    _buildProfileItemLogOutCategory(
                        context,
                        "assets/profile/icons_signout.png",
                        'Log Out',
                        TermConditions())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIndicatorTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30, bottom: 10),
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

  Widget _buildProfileItemCategory(
      BuildContext context, String imgPath, String title, Widget page) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: (){
          navigateToNextPage(context,page);

        },
        child: Container(
          color: Colors.white,

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        imgPath,
                        scale: 2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
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
                  Image.asset(
                    "assets/profile/icon_right_arrow.png",
                    scale: 1.8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
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
        ),
      ),
    );
  }

  Widget _buildProfileItemLogOutCategory(
      BuildContext context, String imgPath, String title, Widget page) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            barrierColor: Color(0xFF111827).withOpacity(0.7),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 250, // Adjust the height as necessary
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Image.asset(
                      "assets/profile/icon_bottomsheet_logout.png",
                      scale: 2,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Are you sure to log out from this app?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 18,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, right: 30, bottom: 1),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context); // Close the modal when tapped
                            },
                            child: Container(
                              width: 150,
                              height: 52,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 17),
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFFF4343)),
                                  borderRadius:
                                  BorderRadius.circular(8),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'No',
                                  style: TextStyle(
                                    color: Color(0xFFFF4343),
                                    fontSize: 16,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   paymentItems.removeAt(index);
                              //
                              // });

                              navigateToNextPage(context,LoginPage(status: 'profile',));
                            },
                            child: Container(
                              width: 150,
                              height: 52,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFF4343),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8)),
                              ),
                              child: Center(
                                child: Text(
                                  'Yes',
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
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        imgPath,
                        scale: 2,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFFEF4444),
                          fontSize: 16,
                          fontFamily: 'Archivo-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/profile/icon_right_arrow.png",
                    color: Color(0xFFEF4444),
                    scale: 1.8,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
