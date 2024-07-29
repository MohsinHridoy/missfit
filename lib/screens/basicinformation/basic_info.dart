import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';

// class BasicInfo extends StatefulWidget {
//   final VoidCallback onNextPressed;
//   String? status;
//
//   BasicInfo({required this.onNextPressed, this.status});
//
//   @override
//   _BasicInfoState createState() => _BasicInfoState();
// }
//
// class _BasicInfoState extends State<BasicInfo> {
//   TextEditingController _fullNameController = TextEditingController();
//   TextEditingController _ageController = TextEditingController();
//
//   final ImagePicker _picker = ImagePicker();
//   File? _image;
//   bool _isButtonEnabled = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeStateFromSharedPreferences();
//     _ageController.addListener(_updateButtonState);
//   }
//
//   void _updateButtonState() {
//     setState(() {
//       _isButtonEnabled =
//           _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
//     });
//   }
//
//   @override
//   void dispose() {
//     _ageController.removeListener(_updateButtonState);
//     super.dispose();
//   }
//
//   Future<void> _saveDataToSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fullName', _fullNameController.text);
//     await prefs.setString('age', _ageController.text);
//   }
//
//   Future<void> _initializeStateFromSharedPreferences() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? fullName = prefs.getString('fullName');
//     String? age = prefs.getString('age');
//     _fullNameController.text = fullName ?? '';
//     _ageController.text = age ?? '';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _isButtonEnabled =
//         _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
//     print("_isButtonEnabled: $_isButtonEnabled");
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     // Calculate the dynamic height based on the status
//     double boxHeight = widget.status == "profile" ? screenHeight * 0.55 : screenHeight * 0.2;
//     return Scaffold(
//       backgroundColor: Color(0xFFF6F6F6),
//       resizeToAvoidBottomInset: false,
//       body: SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             Visibility(
//               visible: widget.status == "profile",
//               child: CustomAppBar(
//                 title: 'Informations de base',
//                 onBackTap: () {
//                   Navigator.pop(context);
//                 },
//                 iconSpacing: 5,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20.0,right: 20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: widget.status != "profile" ? 20.h : 0),
//                   widget.status != "profile" ? title_textView('Informations de base') : SizedBox(),
//                   SizedBox(height: widget.status != "profile" ? 30.h : 0),
//                   Visibility(
//                     visible: widget.status != "profile",
//                     child: Text(
//                       'Upload Profile Picture',
//                       style: TextStyle(
//                         color: Color(0xFF334155),
//                         fontSize: 16,
//                         fontFamily: 'Archivo-Medium',
//                         fontWeight: FontWeight.w500,
//                         height: 0.09,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   GestureDetector(
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: <Widget>[
//                               ListTile(
//                                 leading: Icon(Icons.photo_library),
//                                 title: Text(
//                                   'Choose from Gallery',
//                                   style: TextStyle(
//                                     color: Color(0xFF334155),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   getImageFromGallery();
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               ListTile(
//                                 leading: Icon(Icons.camera_alt),
//                                 title: Text(
//                                   'Take a Photo',
//                                   style: TextStyle(
//                                     color: Color(0xFF334155),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   getImageFromCamera();
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Visibility(
//                       visible: widget.status != "profile",
//                       child: Container(
//                         width: 150,
//                         height: 150,
//                         child: Stack(
//                           children: [
//                             Container(
//                               width: 110,
//                               height: 110,
//                               decoration: BoxDecoration(
//                                 color: Color(0xFFE5E7EB),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: _image == null
//                                   ? Center(
//                                 child: Image.asset(
//                                   "assets/registration/icon_girl.png",
//                                   scale: 1.8,
//                                 ),
//                               )
//                                   : ClipRRect(
//                                 borderRadius: BorderRadius.circular(8),
//                                 child: Image.file(
//                                   _image!,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 28,
//                               left: 80,
//                               child: Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: ShapeDecoration(
//                                   color: Color(0xFFFF4343),
//                                   shape: CircleBorder(),
//                                 ),
//                                 child: Image.asset(
//                                   "assets/registration/icon_take_photo.png",
//                                   scale: 2.1,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     height: 50,
//                     child: TextFormField(
//                       controller: _fullNameController,
//                       keyboardType: TextInputType.text,
//                       style: TextStyle(
//                         color: Color(0xFF334155),
//                         fontSize: 16,
//                         fontFamily: 'Archivo-Medium',
//                         fontWeight: FontWeight.w500,
//                       ),
//                       decoration: InputDecoration(
//                         labelText: 'Nom et prénom',
//                         labelStyle: TextStyle(
//                           color: Color(0xFF334155),
//                           fontSize: 16,
//                           fontFamily: 'Archivo-Medium',
//                           fontWeight: FontWeight.w500,
//                           height: 0.09,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFD1D5DB)),
//                         ),
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFD1D5DB)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     height: 50,
//                     child: TextFormField(
//                       controller: _ageController,
//                       keyboardType: TextInputType.number,
//                       style: TextStyle(
//                         color: Color(0xFF334155),
//                         fontSize: 16,
//                         fontFamily: 'Archivo-Medium',
//                         fontWeight: FontWeight.w500,
//                       ),
//                       decoration: InputDecoration(
//                         labelText: 'Âge',
//                         labelStyle: TextStyle(
//                           color: Color(0xFF334155),
//                           fontSize: 16,
//                           fontFamily: 'Archivo-Medium',
//                           fontWeight: FontWeight.w500,
//                           height: 0.09,
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFD1D5DB)),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color(0xFFD1D5DB)),
//                         ),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: boxHeight),
//                   // SizedBox(height: widget.status == "profile" ? 410.h : 240.3.h),
//                   widget.status != "profile"
//                       ? GestureDetector(
//                     onTap: _isButtonEnabled ? _login : _login2,
//                     child: Padding(
//                       padding: const EdgeInsets.only(bottom: 15.0),
//                       child: Container(
//                         width: double.infinity,
//                         height: 52,
//                         decoration: BoxDecoration(
//                           color: _isButtonEnabled
//                               ? Color(0xFFFF4343)
//                               : Color(0xFFD1D5DB),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Center(
//                           child:  Text(
//                             'Suivante',
//                             style: TextStyle(
//                               color: _isButtonEnabled
//                                   ? Colors.white
//                                   : Color(0xFF334155),
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               height: 1.09,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                       : customButtonRed(context, 'Sauvegarder les modifications',
//                       onPressed: () {
//                         navigateToNextPage(
//                           context,
//                           DashBoard(number: 3),
//                         );
//                       }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future getImageFromGallery() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//
//   Future getImageFromCamera() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       }
//     });
//   }
//
//   void _login() async {
//     print('Login button pressed');
//     _saveDataToSharedPreferences();
//     widget.onNextPressed();
//   }
//
//   void _login2() {
//     print('Login button pressed');
//     // widget.onNextPressed();
//   }
// }




class BasicInfo extends StatefulWidget {
  final VoidCallback onNextPressed;
  String? status;

  BasicInfo({required this.onNextPressed, this.status});

  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _image;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _initializeStateFromSharedPreferences();
    _ageController.addListener(_updateButtonState);
    _fullNameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _ageController.removeListener(_updateButtonState);
    _fullNameController.removeListener(_updateButtonState);
    super.dispose();
  }

  Future<void> _saveDataToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', _fullNameController.text);
    await prefs.setString('age', _ageController.text);
  }

  Future<void> _initializeStateFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fullName = prefs.getString('fullName');
    String? age = prefs.getString('age');
    _fullNameController.text = fullName ?? '';
    _ageController.text = age ?? '';
  }

  @override
  Widget build(BuildContext context) {
    _isButtonEnabled = _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: true, // Ensure the body resizes when the keyboard is shown
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Pushes the button to the bottom
        children: [
          if (widget.status == "profile")
            CustomAppBar(
              title: 'Informations de base',
              onBackTap: () {
                // Navigator.pop(context);
                navigateToNextPage(context, DashBoard(number: 3));

              },
              iconSpacing: 5,
            ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: widget.status != "profile" ? 20 : 0),
                  if (widget.status != "profile")
                    title_textView('Informations de base'),
                  SizedBox(height: widget.status != "profile" ? 30 : 0),
                  if (widget.status != "profile")
                    Text(
                      'Upload Profile Picture',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                  SizedBox(height: 20),
                  if (widget.status != "profile")
                    GestureDetector(
                      onTap: () {
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
                        width: 150,
                        height: 150,
                        child: Stack(
                          children: [
                            Container(
                              width: 110,
                              height: 110,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.circular(8),
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
                                  color: Color(0xFFFF4343),
                                  shape: CircleBorder(),
                                ),
                                child: Image.asset(
                                  "assets/registration/icon_take_photo.png",
                                  scale: 2.1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _fullNameController,
                      keyboardType: TextInputType.text,
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Nom et prénom',
                        labelStyle: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Âge',
                        labelStyle: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 16,
                          fontFamily: 'Archivo-Medium',
                          fontWeight: FontWeight.w500,
                          height: 0.09,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD1D5DB)),
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: widget.status != "profile"
                ? GestureDetector(
              onTap: _isButtonEnabled ? _login : _login2,
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: _isButtonEnabled ? Color(0xFFFF4343) : Color(0xFFD1D5DB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Suivante',
                    style: TextStyle(
                      color: _isButtonEnabled ? Colors.white : Color(0xFF334155),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.09,
                    ),
                  ),
                ),
              ),
            )
                : customButtonRed(context, 'Sauvegarder les modifications', onPressed: () {
              navigateToNextPage(context, DashBoard(number: 3));
            }),
          ),
        ],
      ),
    );
  }




  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  void _login() async {
    print('Login button pressed');
    await _saveDataToSharedPreferences();
    widget.onNextPressed();
  }

  void _login2() {
    print('Login button pressed');
    // widget.onNextPressed();
  }
}
