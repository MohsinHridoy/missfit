import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class ProductReview extends StatefulWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  TextEditingController textEditingController = TextEditingController(
      text:
      'Describe your experience (optional)');
  List<File> _images = [];

  double _rating = 3.0;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Gallery'),
              onTap: () async {
                Navigator.pop(context); // Close the bottom sheet
                final XFile? pickedImage =
                await _picker.pickImage(source: ImageSource.gallery);
                _addImageToList(pickedImage);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                Navigator.pop(context); // Close the bottom sheet
                final XFile? pickedImage =
                await _picker.pickImage(source: ImageSource.camera);
                _addImageToList(pickedImage);
              },
            ),
          ],
        );
      },
    );
  }

  void _addImageToList(XFile? pickedImage) {
    if (pickedImage != null) {
      setState(() {
        _images.add(File(pickedImage.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),

        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              
                  children: [
                    SizedBox(height: 10,),
                    _buildProductInfo(),
                    SizedBox(height: 50,),
              
                    _buildRatingQuestion('What rating would you give this item?'),
                    SizedBox(height: 30,),
              
                    _buildRatingBar(),
                    SizedBox(height: 40,),
              
                    _buildRatingQuestion('Write Review'),
                    SizedBox(height: 30,),
              
                    _buildReviewTextField(),
                    SizedBox(height: 30),
              
                    _buildImageUploader(),
              
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildSubmitButton(),
            )

          ],
        ),
      ),
    );
  }
  void showCongratulationsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 320,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Lottie.asset(
                  'assets/lottie_anim/tik_anim.json',
                  height: 200, // Adjust height as needed
                  width: 200, // Adjust width as needed
                  fit: BoxFit.cover, // Adjust the fit
                  repeat: false, // Play animation only once
                ),
              ),
              SizedBox(
                width: 320,
                child: Text(
                  'Review Submitted',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 18,
                    fontFamily: 'Archivo-Semibold',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 340,
                  child: Text(
                    'Thank you for your review. Your insights will help other customer make good purchase.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF66758C),
                      fontSize: 16,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Close the bottom sheet
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => DashBoard()),
                    // );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 44,
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
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 97,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
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
            SizedBox(width: MediaQuery.of(context).size.width / 3.8),
            Text(
              'Write Review',
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
    );
  }

  Widget _buildProductInfo() {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: ShapeDecoration(
            color: Color(0xFF94A3B8).withOpacity(0.3),
            image: DecorationImage(
              image: AssetImage('assets/cart/cart_items.png'),
              fit: BoxFit.fill,
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 128,
          child: Text(
            'Dumbbells',
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRatingQuestion(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF334155),
        fontSize: 18,
        fontFamily: 'Kanit-Medium',
        fontWeight: FontWeight.w500,
        height: 0.07,
      ),
    );
  }

  Widget _buildRatingBar() {
    return RatingBar.builder(
      initialRating: _rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey.withOpacity(0.5),
      itemSize: 35,
      itemBuilder: (context, _) => Image.asset(
        "assets/review/icon_star_review.png",
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
      updateOnDrag: true,
    );
  }

  Widget _buildReviewTextField() {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        decoration: ShapeDecoration(
          // color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: TextField(
            controller: textEditingController,
            maxLines: null,
            style: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageUploader() {
    return DottedBorder(
      color: Color(0xFFFF4343),
      strokeWidth: 2,
      borderType: BorderType.RRect,
      child: GestureDetector(
        onTap: _images.length >= 5
            ? null
            : () {
          _pickImage();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/review/icon_camera.png",
                height: 25,
                width: 25,
              ),
              SizedBox(width: 10),
              Text(
                'Upload Photo (${_images.length}/5)',
                style: TextStyle(
                  color: Color(0xFFFF4343),
                  fontSize: 14,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GestureDetector(
      onTap: (){
        showCongratulationsModal(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 17),
        decoration: ShapeDecoration(
          color: Color(0xFFFF4343),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Archivo-Semibold',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStarText(String txt) {
    return Flexible(
      child: Text(
        txt,
        style: TextStyle(
          color: Color(0xFFF1B31C),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          height: 1,
        ),
      ),
    );
  }
}