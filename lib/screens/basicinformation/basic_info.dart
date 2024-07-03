import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // Add a listener to the _ageController
    _ageController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      // Update _isButtonEnabled based on the conditions
      _isButtonEnabled =
          _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    // Clean up the listener when the widget is disposed
    _ageController.removeListener(_updateButtonState);
    super.dispose();
  }

  Future<void> _saveDataToSharedPreferences() async {
    // Get the SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save full name and age to SharedPreferences
    await prefs.setString('fullName', _fullNameController.text);
    await prefs.setString('age', _ageController.text);
  }

  Future<void> _initializeStateFromSharedPreferences() async {
    // Get the SharedPreferences instance
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get the saved data from SharedPreferences
    String? fullName = prefs.getString('fullName');
    String? age = prefs.getString('age');

    // Set the saved data to the controllers
    _fullNameController.text = fullName ?? '';
    _ageController.text = age ?? '';
  }

  @override
  Widget build(BuildContext context) {
    _isButtonEnabled =
        _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
    print("_isButtonEnabled: $_isButtonEnabled");

    return Scaffold(

      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: widget.status == "profile",
              child: Container(
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
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/cart/icon_left_arrow.png",
                          scale: 2,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 4.1),
                      title_textView('Basic Information'),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 34),
                  Visibility(
                    visible: widget.status != "profile",
                    child: title_textView('Basic Information')
                  ),
                  SizedBox(height: widget.status != "profile"?50:0),
                  Visibility(
                    visible: widget.status != "profile",
        
                    child: Text(
                      'Upload Profile Picture',
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 16,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
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
                    child: Visibility(
                      visible: widget.status != "profile",
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
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _fullNameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Full Name',
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
                      decoration: InputDecoration(
                        labelText: 'Age',
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
        
                  SizedBox(height: widget.status == "profile" ? MediaQuery.of(context).size.height / 1.8 : MediaQuery.of(context).size.height / 3.3),
        
        
                  GestureDetector(
                    onTap: _isButtonEnabled ? _login : _login2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Visibility(
                        visible: widget.status != "profile",
                        child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            color: _isButtonEnabled
                                ? Color(0xFFFF4343)
                                : Color(0xFFD1D5DB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: _isButtonEnabled
                                    ? Colors.white
                                    : Color(0xFF334155),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.status == "profile",
        
                    child: GestureDetector(
                      onTap: (){
                        navigateToNextPage(context,DashBoard(number: 2,));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 52,

                        decoration: ShapeDecoration(
                          color: Color(0xFFFF4343),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),

                        child: Center(
                          child: Text(
                            'Save Change',
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
                  )
                ],
              ),
            ),
          ],
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

  void _login() async {
    print('Login button pressed');
    _saveDataToSharedPreferences();
    widget.onNextPressed();
  }

  void _login2() {
    print('Login button pressed');
    // widget.onNextPressed();
  }
}
