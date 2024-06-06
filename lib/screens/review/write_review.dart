
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';



class ProductReview extends StatefulWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  TextEditingController textEditingController =
  TextEditingController(text: '''
    We would like to bring to your attention that there is an outstanding credit of BDT 16,547 in your account with our store. We kindly request you to settle this amount at your earliest convenience.
    If you have any questions or concerns regarding this matter, please do not hesitate to contact our customer service team. 
    We appreciate your prompt attention to this matter.
  ''');
  File? _image;

  double _rating = 3.0;
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    // Show a bottom sheet with options for choosing an image
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
                final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                _setImage(pickedImage);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Camera'),
              onTap: () async {
                Navigator.pop(context); // Close the bottom sheet
                final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
                _setImage(pickedImage);
              },
            ),
          ],
        );
      },
    );
  }

  void _setImage(XFile? pickedImage) {
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // _buildAppBar(context),
            Container(
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
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/50x50"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Whole Chicken',
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Text(
              'What rating would you give this item?',
              style: TextStyle(
                color: Color(0xFF334155),
                fontSize: 18,
                fontFamily: 'Kanit-Medium',
                fontWeight: FontWeight.w500,
                height: 0.07,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildStarText("Terrible"),
                                  _buildStarText("Poor"),
                                  _buildStarText("Fair"),
                                  _buildStarText("Good"),
                                  _buildStarText("Excellent"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     print('Rating: $_rating');
                      //   },
                      //   child: Text("Submit Rating"),
                      // )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: 388,
                          child: Column(
                            children: [
                              DottedBorder(
                                color: Colors.red,
                                // Border color
                                strokeWidth: 2,
                                // Border width
                                borderType: BorderType.RRect,
                                // Rounded rectangle border
                                // radius: Radius.circular(999),
                                // Border radius
                                // padding: EdgeInsets.all(5), // Padding around the border
                                child: GestureDetector(
                                  onTap: () {},
                                  child: _image == null
                                      ? GestureDetector(
                                    onTap: () {
                                      _pickImage();
                                    },
                                    child: Container(
                                      width: 396,
                                      // Container width
                                      height: 66,
                                      // Container height
                                      // decoration: BoxDecoration(
                                      //   color: Color(0xFFFDE3E5),
                                      //   // borderRadius: BorderRadius.circular(999), // Border radius
                                      // ), // Background color
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Image.asset("assets/review/icon_camera.png",height: 30,width: 30,),
                                          Text(
                                            'Add Photo',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              fontFamily: 'Mulish',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                      : Stack(
                                    children: [
                                      Container(
                                        width: 396,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(_image!),
                                            // Assuming _image is your image
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        // Adjust the top position as needed
                                        right: 10,
                                        // Adjust the right position as needed
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _image = null;
                                            }); // Add your logic to remove the image here
                                          },
                                          child: Icon(
                                            Icons.close,
                                            // You can change the icon to your preference
                                            color: Colors
                                                .red, // You can change the color to your preference
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 210,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: Color(0xFF88CADA)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child:
                          Padding(
                            padding: const EdgeInsets.only(left:5.0,right:5.0),
                            child:  TextField(
                              controller: textEditingController,
                              maxLines: null,
                              // keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                  height: .9, // Adjust the line height as needed
                                  fontSize: 15
                              ),

                              decoration: InputDecoration(
                                border: InputBorder.none, // Hide input line
                              ),
                            ),

                          ),

                        ),
                      ),
                      SizedBox(height: 30,),
                      _buildSubmitButton()

                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }


  Widget _buildSubmitButton(){
    return Container(
      width: 300,
      height: 30,
      decoration: ShapeDecoration(
        color: Color(0xFFF51347),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),

      child: Center(
        child: Text(
          'Submit',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            height: 0,
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

  Widget _buildRatingBar() {
    return RatingBar.builder(
      initialRating: _rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      unratedColor: Colors.grey.withOpacity(0.5),
      itemSize: 50,
      itemBuilder: (context, _) =>

      //     Icon(
      //   Icons.star,
      //   color: Colors.amber,
      // ),

      Image.asset("assets/review/icon_star_review.png",color: Colors.amber,),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
      updateOnDrag: true,
    );
  }
}
