
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../review/write_review.dart';

class ReviewItemProfile {
  final String reviewText;
  final String details;
  final String name;
  final int stars;
  final List<String>? imageUrls; // List of image URLs
  final bool? isReviewed;

  ReviewItemProfile({
    required this.reviewText,
    required this.details,
    required this.name,
    required this.stars,
    this.imageUrls, // Initialize the list of image URLs
    this.isReviewed,
  });
}

class ReviewListProfile extends StatefulWidget {
  @override
  _ReviewListProfileState createState() => _ReviewListProfileState();
}

class _ReviewListProfileState extends State<ReviewListProfile> {
  int selectedIndex = 0;
  List<ReviewItemProfile> filteredReviews =
  []; // Items to be displayed based on the selected category
  bool isReviewedSelected = true; // Set to true initially

  final List<ReviewItemProfile> reviews = [
    ReviewItemProfile(
      reviewText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem,amet, consectetur adipiscingadipiscingadipiscingadipiscingadipiscingadipiscingadipiscingadipiscingadipiscing ',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
      isReviewed: true,
      imageUrls: [
        'assets/product_details/img_dumble.png',
        'assets/product_details/img_dumble.png'
      ],
    ),
    ReviewItemProfile(
      reviewText: 'Great product, highly recommended!',
      details: '5 stars - January 2023',
      name: 'John Doe',
      stars: 3,
      isReviewed: false,
      imageUrls: [
        'assets/product_details/img_dumble.png',
        'assets/product_details/img_dumble.png'
      ], // Example image URLs
    ),
    ReviewItemProfile(
      reviewText: 'Not satisfied with the quality.',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
      isReviewed: false,
    ),
    // Add more review items as needed...
  ];

  @override
  void initState() {
    super.initState();
    // Initialize filteredReviews to show only reviewed items initially
    filteredReviews = getFilteredReviews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            title: 'Revoir',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 3,
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: SizedBox(
              height: 45.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2, // Updated itemCount to match the options
                itemBuilder: (context, index) {
                  final labelText =
                  index == 0 ? 'Révisé' : 'Pas révisé';
                  return GestureDetector(
                    onTap: () {
                      onItemSelected(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 36,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color:index == selectedIndex
                              ? Colors.white:Colors.transparent ,
                          shape: RoundedRectangleBorder(

                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: index == selectedIndex
                                  ? Color(0xFFFFA142)
                                  : Color(0xFFD1D5DB),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0,right: 12),
                            child: Text(
                              labelText,
                              style: TextStyle(
                                color: index == selectedIndex
                                    ? Color(0xFFE88E32)
                                    : Color(0xFF334155),
                                fontSize: 14,
                                fontFamily: 'Archivo-Regular',
                                fontWeight: FontWeight.w400,
                                height: 1.00,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredReviews.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Container(
                  color: filteredReviews[index].isReviewed==true
                      ?Colors.white:Colors.transparent,

                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(

                        border: Border(
                            bottom: BorderSide(
                                color:filteredReviews[index].isReviewed==true
                                    ?Colors.transparent: Colors.grey.withOpacity(0.5))),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: filteredReviews[index].isReviewed==true?25.0:0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 64,
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.withOpacity(0.3)),
                                    child: Center(
                                        child: Image.asset(
                                          "assets/product_details/img_dumble.png",
                                          scale: 2,
                                        )),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0,top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                filteredReviews[index].name,
                                                style: TextStyle(
                                                  color: Color(0xFF334155),
                                                  fontSize: 16,
                                                  fontFamily: 'Archivo-Regular',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.00,
                                                ),
                                              ),


                                              filteredReviews[index]
                                                  .isReviewed==false? SizedBox():  Image.asset(
                                                "assets/product_details/icon_edit.png",
                                                scale: 2.5,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 128,
                                            child: Text(
                                              '2kg',
                                              style: TextStyle(
                                                color: Color(0xFF66758C),
                                                fontSize: 14,
                                                fontFamily: 'Archivo',
                                                fontWeight: FontWeight.w400,
                                                height: 0.10,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Visibility(
                                            visible: filteredReviews[index]
                                                .isReviewed==false,
                                            child: SizedBox(
                                              width: 114,
                                              child: Text(
                                                '2 x CHF 25.00',
                                                style: TextStyle(
                                                  color: Color(0xFF334155),
                                                  fontSize: 14,
                                                  fontFamily: 'Archivo-Medium',
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
                                  Visibility(
                                    visible:
                                    !filteredReviews[index].isReviewed!,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 15.0),
                                          child: SizedBox(
                                            width: 79,
                                            child: Text(
                                              'CHF 50.00',
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
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            navigateToNextPage(context,ProductReview());
                                          },
                                          child: Container(
                                            width: 140.h,
                                            height: 40,
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
                                                'Ecrire une critique',
                                                style: TextStyle(
                                                  color: Color(0xFFFF4343),
                                                  fontSize: 14,
                                                  fontFamily: 'Archivo-SemiBold',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.00,
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
                            SizedBox(
                              height: 15,
                            ),
                            if (filteredReviews[index].isReviewed == true) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ...(filteredReviews[index].stars != null
                                            ? List.generate(
                                            filteredReviews[index].stars!,
                                                (i) => Padding(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 0.5),
                                              child: Image.asset(
                                                  "assets/review/icon_star.png",
                                                  scale: 2.2),
                                            ))
                                            : []),
                                      ],
                                    ),
                                    Text(
                                      '5 days ago',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF66758C),
                                        fontSize: 12,
                                        fontFamily: 'Archivo-Regular',
                                        fontWeight: FontWeight.w400,
                                        height: 0.12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ] else ...[
                              SizedBox(height: 5.h),
                              // Placeholder space if not reviewed
                            ],

                            filteredReviews[index].isReviewed == true
                                ? SizedBox(
                              height: 66,
                              child: Text(
                                filteredReviews[index].reviewText,
                                style: TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.3
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                                : SizedBox(),
                            SizedBox(
                              height: 5.h,
                            ),

                            if (filteredReviews[index].isReviewed == true) ...[
                              if (filteredReviews[index].imageUrls !=
                                  null) // Check if image URLs exist
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: filteredReviews[index]
                                        .imageUrls
                                        ?.map((imageUrl) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFFE2E8F0),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                          ),
                                          child: Image.asset(imageUrl,
                                              width: 50, height: 50),
                                        ),
                                      );
                                    }).toList() ??
                                        [],
                                  ),
                                ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
      isReviewedSelected = index == 0;
      filteredReviews =
          getFilteredReviews(); // Update filtered reviews based on selection
    });
  }

  List<ReviewItemProfile> getFilteredReviews() {
    return isReviewedSelected
        ? reviews.where((review) => review.isReviewed == true).toList()
        : reviews.where((review) => review.isReviewed == false).toList();
  }
}