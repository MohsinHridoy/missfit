import 'package:flutter/material.dart';

import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';

import '../cartscreen/cart.dart';

class ReturnRequest extends StatefulWidget {
  const ReturnRequest({Key? key}) : super(key: key);

  @override
  State<ReturnRequest> createState() => _ReturnRequestState();
}

class _ReturnRequestState extends State<ReturnRequest> {
  TextEditingController textEditingController = TextEditingController();
  List<File> _images = [];
  List<CartItem> cartItems = [
    CartItem(
        title: 'Dumbbells',
        quantity: 1,
        image: 'assets/cart/cart_items.png',
        weight: 0.5),
    CartItem(
        title: 'Dumbbells',
        quantity: 1,
        image: 'assets/cart/cart_items.png',
        weight: 0.7),
  ];


  String selectedText =
      'Select Reason'; // Declare a variable to store the selected text
bool isVisible=false;
  List<bool> itemSelection = [
    false,
    false,
    false,
    false
  ]; // Track selection state for each item

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
      backgroundColor: Color(0xFFF6F6F6),
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildAppBar(context),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, right: 18.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        _buildRatingQuestion('Retourner le produit'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildCartItemsList(),
                        SizedBox(
                          height: 30,
                        ),
                        _buildRatingQuestion('Raison du retour'),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              isVisible=true;

                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFD1D5DB)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    selectedText,
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.09,
                                    ),
                                  ),
                                ),
                                Image.asset(
                                    "assets/review/icon_dropdown.png")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        _buildRatingQuestion('Ajouter une photo'),
                        SizedBox(
                          height: 30,
                        ),
                        _buildImageUploader(),
                        SizedBox(
                          height: 50,
                        ),
                        _buildRatingQuestion("Remarques"),
                        SizedBox(
                          height: 30,
                        ),
                        _buildReviewTextField(),
                        SizedBox(height: 60),
                        _buildSubmitButton(),
                        SizedBox(height: 30),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.550000011920929),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 355,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                        color: Colors.white,

                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 288,
                                child: Text(
                                  "J'ai reçu le mauvais article",
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 18,
                                    fontFamily: 'Kanit-Semibold',
                                    fontWeight: FontWeight.w600,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            for (int i = 0; i < 4; i++) // Build items dynamically
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Unselect all items
                                      for (int j = 0; j < 4; j++) {
                                        itemSelection[j] = false;
                                      }
                                      itemSelection[i] = true; // Select current item
                                      print(itemSelection[i]);
                                      selectedText = _getBottomSheetItemText(
                                          i); // Store selected text
                                      print(selectedText); // Pr
                                    });
                                  },
                                  child: Container(
                                    color: Colors.white,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Image.asset(
                                            itemSelection[i]
                                                ? "assets/payment/icon_radio_check.png"
                                                : "assets/payment/icon_radio_uncheck.png",
                                            scale: 2,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        // Add spacing between checkbox and text
                                        _buildBottomSheetText(
                                            _getBottomSheetItemText(i)),
                                        // Get text based on index
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0,right: 18,top: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isVisible=false;
                                          selectedText = 'Select Reason';
                                        });
                                      },
                                      child: Container(
                                        height: 52,

                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                width: 1, color: Color(0xFFFF4343)),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                color: Color(0xFFFF4343),
                                                fontSize: 16,
                                                fontFamily: 'Archivo-SemiBold',
                                                fontWeight: FontWeight.w600,
                                                height: 0.09,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isVisible=false;
                                          ; // Update selected text to trigger a rebuild
                                        });
                                      },
                                      child: Container(
                                        height: 52,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFFF4343),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8)),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 7.0),
                                            child: Text(
                                              'Continue',
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
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _buildBottomSheetText(String text) {
    return SizedBox(
      width: 283,
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF334155),
          fontSize: 14,
          fontFamily: 'Archivo-Regular',
          fontWeight: FontWeight.w400,
          height: 1.10,
        ),
      ),
    );
  }

  String _getBottomSheetItemText(int index) {
    switch (index) {
      case 0:
        return "J'ai reçu le mauvais article.";
      case 1:
        return "L'article ne correspond pas à la description ou à l'image.";
      case 2:
        return "Article ou accessoires manquant dans le colis";
      case 3:
        return "L'article ne me convient pas";
      default:
        return "";
    }
  }

  Widget _buildCartItemsList() {
    return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 0, right: 16),
            child: Column(
              children: List.generate(
                cartItems.length,
                (index) {
                  final item = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 110,
                      child: Column(
                        children: [
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  width: 65,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    // Make the border fully circular
                                    color: Color(0xFF94A3B8).withOpacity(0.3),
                                    image: DecorationImage(
                                      image: AssetImage(cartItems[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 15),
                                child: SizedBox(
                                  height: 70,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Dumbbells',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 16,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.09,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10),
                                        child: Text(
                                          '2 kg',
                                          style: TextStyle(
                                            color: Color(0xFF66758C),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Regular',
                                            fontWeight: FontWeight.w400,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 15.0, bottom: 1),
                                        child: SizedBox(
                                          width: 114,
                                          child: Text(
                                            '2 x CHF 25.00',
                                            style: TextStyle(
                                              color: Color(0xFF334155),
                                              fontSize: 14,
                                              fontFamily: 'Archivo',
                                              fontWeight: FontWeight.w500,
                                              height: 0.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: SizedBox(
                                  width: 94,
                                  child: Text(
                                    'CHF 25.00',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 14,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w500,
                                      height: 0.10,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFFE5E7EB),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
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
          height: 270.h,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
              SizedBox(height: 10,),
              SizedBox(
                width: 320,
                child: Text(
                  'Votre demande de retour soumise',
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
                    'Nous avons reçu votre demande de retour. Dans les plus brefs délais, nous résoudrons votre problème.',
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
                    // Navigator.pop(context); // Close the bottom sheet
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashBoard(number: 3,)),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 52,

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
            SizedBox(width: MediaQuery.of(context).size.width / 4.8),
            Text(
              'Demande de retour',
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
            image: DecorationImage(
              image: NetworkImage("https://via.placeholder.com/50x50"),
              fit: BoxFit.fill,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
    );
  }

  Widget _buildRatingQuestion(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF334155),
        fontSize: 20,
        fontFamily: 'Kanit-Semibold',
        fontWeight: FontWeight.w600,
        height: 0.06,
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 152,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFD1D5DB)),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6),
        child: TextField(
          controller: textEditingController,
          maxLines: null,
          decoration: InputDecoration(
            hintText: 'Describe your experience (optional)', // Your hint text here
            hintStyle: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 16,
            fontFamily: 'Archivo-Medium',
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),

        ),
      ),
    );
  }

  Widget _buildImageUploader() {
    return DottedBorder(
      color: Colors.red,
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
          height: 46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/review/icon_camera.png",
                height: 25,
                width: 25,
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Upload Photo (${_images.length}/5)',
                  style: TextStyle(
                    color: Color(0xFFFF4343),
                    fontSize: 14,
                    fontFamily: 'Archivo-SemiBold',
                    fontWeight: FontWeight.w600,
                    height: 0.10,
                  ),
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
      onTap: () {
        showCongratulationsModal(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 112, vertical: 17),
        decoration: ShapeDecoration(
          color:selectedText == 'Select Reason'?Color(0xFFD1D5DB):Color(0xFFFF4343),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              selectedText == 'Select Reason'?'Continue':'Confirm Request',
             style: TextStyle(
                color:selectedText == 'Select Reason'? Color(0xFF66758C):Colors.white,
            fontSize: 16,
            fontFamily: 'Archivo-SemiBold',
            fontWeight: FontWeight.w600,
            height: 0.09,
                    ),
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
