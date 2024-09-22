import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import '../../common_widgets.dart';
import '../bookmark/bookmark.dart';

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
            begin: Alignment(-0.999, -0.999),
            end: Alignment(-0.0, 0.22),
            colors: [Color(0xFFFF6443), Color(0xFFC1268C)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // clipBehavior: Clip.antiAlias,
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment(0.70, -0.71),
                //     end: Alignment(-0.7, 0.71),
                //     colors: [Color(0xFFFF6443), Color(0xFFC1268C)],
                //   ),
                // ),
                child: Column(
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
                        padding: const EdgeInsets.only(left: 30.0),
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
                                child: GestureDetector(
                                  onTap: (){
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ListTile(
                                              leading: Icon(Icons.photo_library),
                                              title: Text(
                                                'Choose from Gallery',
                                                style: TextStyle(
                                                  color: Color(0xFF334155),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              onTap: () {
                                                getImageFromGallery();
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(Icons.camera_alt),
                                              title: Text(
                                                'Take a Photo',
                                                style: TextStyle(
                                                  color: Color(0xFF334155),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              onTap: () {
                                                getImageFromCamera();
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
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
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: (){
                        navigateToNextPage(context,DashBoard(number: 2,));
                      },
                      child: Container(
                        width: 223,

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
                                'Acheter un abonnement',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.09,
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
                    _buildIndicatorTitleText('Générale'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_personal_info.png",
                        'Informations personnelles',
                        PersonalInfo()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_address.png",
                        'Mon adresse',
                        MyAddress()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_payment_card.png",
                        'Carte de paiement',
                        AddNewCard(
                          status: 'profile',
                        )),
                    _buildIndicatorTitleText('Signet'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_bookmark.png",
                        'Élément de signet',
                        Bookmark()),

                    _buildIndicatorTitleText('Boutique'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_order_history.png",
                        'Historique des commandes',
                        OrderHistory()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icon_review_star.png",
                        'Revoir',
                        ReviewListProfile()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Termes et conditions',
                        TermConditions()),
                    _buildIndicatorTitleText('About'),
                    SizedBox(
                      height: 20,
                    ),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Termes et conditions',
                        TermConditions()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_terms_condition.png",
                        'Privacy & Policy',
                        TermConditions()),
                    _buildProfileItemCategory(
                        context,
                        "assets/profile/icons_google_play.png",
                        'Évaluez-nous sur Google Play',
                        TermConditions()),
                    SizedBox(
                      height: 15,
                    ),
                    _buildProfileItemLogOutCategory(
                        context,
                        "assets/profile/icons_signout.png",
                        'Se déconnecter',
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
  Future getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
      const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 20),
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
                          height: 1.09,
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
              buildDivider(context)

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
      const EdgeInsets.only(left: 20.0, right: 20, top: 15, bottom: 10),
      child: GestureDetector(
        onTap: (){
          showModalBottomSheet(
            barrierColor: Color(0xFF111827).withOpacity(0.7),
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4, // Set a relative height
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(  // Wrap the content with SingleChildScrollView
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.h),
                      Image.asset(
                        "assets/profile/icon_bottomsheet_logout.png",
                        scale: 2,
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, right: 20),
                        child: SizedBox(
                          height: 60.h,
                          child: Text(
                            ' Êtes-vous sûr de vous déconnecter de cette application ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 18,
                              fontFamily: 'Archivo-SemiBold',
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              wordSpacing: 5.7,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h), // Adjust the spacing as needed
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context); // Close the modal when tapped
                                },
                                child: Container(
                                  height: 52,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: Color(0xFFFF4343),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Non',
                                      style: TextStyle(
                                        color: Color(0xFFFF4343),
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
                            SizedBox(width: 10.h),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  prefs.setBool('isLoggedIn', false);
                                  navigateToNextPage(context,
                                      LoginPage(status: 'profile',));
                                },
                                child: Container(
                                  height: 52,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFFF4343),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Oui',
                                      style: TextStyle(
                                        color: Colors.white,
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
                    ],
                  ),
                ),
              );
            },
          );
          ;
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
                          height: 1.09,
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