import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miss_fit/common_widgets.dart';
import 'package:image_picker/image_picker.dart';

class BasicInfo extends StatefulWidget {
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? _image;

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




  @override
  Widget build(BuildContext context) {
    bool _isButtonEnabled =
        _fullNameController.text.isNotEmpty && _ageController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Color(0xFF18181B),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 50,
              ),
              txt_headline('Basic Information'),

              SizedBox(
                height: 30,
              ),

              Text(
                'upload profile picture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w500,
                  height: 1.09,
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: 110,
                height: 110,
                // color: Colors.blueAccent,
                child: Stack(
                  children: [
                    Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _image == null
                            ? Image.asset("assets/registration/icon_girl.png", fit: BoxFit.cover)
                            : Image.file(_image!, fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 0,
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
                                    title: Text('Choose from Gallery'),
                                    onTap: () {
                                      getImageFromGallery();
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('Take a Photo'),
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
                            color: Color(0xFFFF4343),
                            shape: OvalBorder(),
                          ),
                          child: Image.asset(
                            "assets/registration/icon_take_photo.png",
                            scale: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 1.09,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Full Name',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 48,
                child: TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w500,
                    height: 1.09,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 20),
              Spacer(), // Pushes the login button to the bottom

              GestureDetector(
                onTap: _isButtonEnabled ? _login : null,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 52,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                  decoration: ShapeDecoration(
                    color: _isButtonEnabled ? Colors.red : Color(0xFFF1F5F9),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 16,
                          fontFamily: 'Archivo',
                          fontWeight: FontWeight.w600,
                          height: 0.09,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void _login() {
    // Perform login action here
    print('Login button pressed');
  }
}
