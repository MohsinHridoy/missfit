import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glossy/glossy.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:miss_fit/screens/orderstatus/order_status_screen.dart';

import '../../common_utils.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/common_text_widgets.dart';
import '../../widgets/dotted_image_uploader.dart';
import '../../widgets/horizontal_product_list.dart';
import '../../widgets/review_text_field.dart';

class ProductReview extends StatefulWidget {
  final String? status;

  const ProductReview({Key? key,this.status}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  TextEditingController textEditingController = TextEditingController();
  List<File> _images = [];

  double _rating = 0.0;
  void _deleteImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());

      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor:  Color(0xFFF6F6F6),
        body: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 10.h,),
                      _buildProductInfo(),
                      SizedBox(height: 30.h,),

                      _buildRatingQuestion('Quelle note donneriez-vous à cet article ?'),
                      SizedBox(height: 15.h,),

                      _buildRatingBar(),
                      SizedBox(height: 25.h,),

                      _buildRatingQuestion('Ecrire une critique'),
                      SizedBox(height: 17.h,),

                      _buildReviewTextField(),
                      SizedBox(height: 20.h),

                      _buildImageUploader(),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: HorizontalProductList(
                          images: _images,
                          onDelete: _deleteImage,
                        ),
                      ),
                      SizedBox(height: 50.h),


                    ],
                  ),
                ),
              ),
            ),
            _buildSubmitButton(),



          ],
        ),
      ),
    );
  }


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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h,),

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
              SizedBox(height: 20.h,),
              SizedBox(
                width: 320,
                child: Text(
                  'Avis soumis',
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
                  width: 340.h,
                  child: Text(
                    'Merci pour votre avis. Vos informations aideront d’autres clients à faire un bon achat.',
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
              Spacer(),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: customButtonRed(context, 'Continuer', onPressed: () {
                  Navigator.pop(context);
                  if(widget.status=='profile')
                    Navigator.pop(context);
                  else

                  navigateToNextPage(context,OrderStatus(navigationStatus: 'WriteReview', status:OrderStatusEnum.Processing,));

                }),
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
              'Ecrire une critique',
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
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildRatingQuestion(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SizedBox(width:300,child: txtKanitMedium18_2(text)),
    );
  }

  Widget _buildRatingBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: RatingBar.builder(
        initialRating: _rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        unratedColor: Colors.grey.withOpacity(0.5),
        itemSize: 30,
        itemBuilder: (context, _) => Image.asset(
          "assets/review/icon_star_review.png",
          color:  Color(0xFFFFA142),
        ),
        onRatingUpdate: (rating) {
          setState(() {
            _rating = rating;
          });
        },
        itemPadding: EdgeInsets.symmetric(horizontal: 11.0),
        updateOnDrag: true,
      ),
    );
  }

  Widget _buildReviewTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: buildReviewTextField(context,textEditingController),
    );
  }

  Widget _buildImageUploader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: DottedImageUploader(
        imageCount: _images.length,
        onPickImage: _images.length >= 5
            ? null
            : () {
          _pickImage();
        }, // Pass the function to handle image picking
      ),
    );
  }

  Widget _buildSubmitButton() {
    return GlossyContainer(
      width: MediaQuery.of(context).size.width,
      height: 76,
      blendMode: BlendMode.srcATop,
      // opacity:0.1,
      color: Colors.white.withOpacity(0.04),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: customButtonRed(context, 'Soumettre', onPressed: () {
              showCongratulationsModal(context);

            }),
          )
      ),
    );
  }

}