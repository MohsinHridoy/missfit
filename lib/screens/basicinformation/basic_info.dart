import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:image_picker/image_picker.dart';

class BasicInfo extends StatefulWidget {
  final VoidCallback onNextPressed;

  BasicInfo({required this.onNextPressed});

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

  @override
  Widget build(BuildContext context) {
    _isButtonEnabled =
        _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;
    print("_isButtonEnabled: $_isButtonEnabled");

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Shrink-wrap vertically
            children: [
              SizedBox(height: 20),
              Text(
                'Basic Information',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 24,
                  fontFamily: 'Kanit-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.05,
                ),
              ),
              SizedBox(height: 50),
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
                        left: 85,
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
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Color(0xFF334155),
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
                    labelStyle: TextStyle(color: Color(0xFF334155),
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
              SizedBox(height: MediaQuery.of(context).size.height/3.3),
              GestureDetector(
                onTap: _isButtonEnabled ? _login : _login2,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                          color:
                              _isButtonEnabled ? Colors.white : Color(0xFF334155),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  void _login() {
    print('Login button pressed');
    widget.onNextPressed();
  }

  void _login2() {
    print('Login button pressed');
    // widget.onNextPressed();
  }
}
