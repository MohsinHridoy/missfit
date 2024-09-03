import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
class ReviewItem {
  final String reviewText;
  final String details;
  final String name;
  final int stars;
  final List<String>? imageUrls; // List of image URLs

  ReviewItem({
    required this.reviewText,
    required this.details,
    required this.name,
    required this.stars,
    this.imageUrls, // Initialize the list of image URLs
  });
}

class ReviewList extends StatefulWidget {
  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  int selectedIndex = 0;
  final List<ReviewItem> reviews = [
    ReviewItem(
      reviewText: 'Not satisfied with the quality.',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    ReviewItem(
        reviewText: 'Great product, highly recommended!',
        details: '5 stars - January 2023',
        name: 'John Doe',
        stars: 3,
        imageUrls: [
          'assets/product_details/img_dumble.png',
          'assets/product_details/img_dumble.png'
        ] // Example image URLs
    ),
    ReviewItem(
      reviewText: 'Not satisfied with the quality.',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    // Add more review items as needed...
  ];
  @override
  Widget build(BuildContext context) {
    List<ReviewItem> filteredReviews = selectedIndex == 0
        ? reviews
        : reviews.where((review) => review.stars == selectedIndex).toList();
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              title: 'Revoir',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3,
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 11.0,right: 5,left: 4),
                    child: Image.asset("assets/review/icon_star.png",scale: 1.7,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.2 ',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 16,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 1.09,
                            ),
                          ),
                          TextSpan(
                            text: '(12 avis)',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 12,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalListView(
              selectedIndex: selectedIndex,
              onItemSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            // Expanded(
            //   child: ReviewListView(
            //     selectedIndex: selectedIndex,
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero,
                child: ListView.builder(
                  itemCount: filteredReviews.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image: AssetImage("assets/review/icon_girl.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only( left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Rhaenyra',
                                            style: TextStyle(
                                              color: Color(0xFF334155),
                                              fontSize: 16,
                                              fontFamily: 'Archivo-Regular',
                                              fontWeight: FontWeight.w400,
                                              height: 1.09,
                                            ),
                                          ),
                                          SizedBox(height: 8,),
                                          if (index >= 0) ...[
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ...(filteredReviews[index].stars != null
                                                        ? List.generate(filteredReviews[index].stars, (i) => Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 0.5),
                                                      child: Image.asset("assets/review/icon_star.png", scale: 2.2),
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
                                                )
                                              ],
                                            ),
                                          ],
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            SizedBox(
                              height: 66,
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, Viverra vulputate sodales quis et dui,',
                                style: TextStyle(
                                  color: Color(0xFF475569),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 5,),
                            if (filteredReviews[index].imageUrls != null)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: filteredReviews[index].imageUrls?.map((imageUrl) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8,bottom:10 ),
                                      child: Container(
                                        width: 56,
                                        height: 56,
                                        padding: const EdgeInsets.all(4),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFE2E8F0),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                        ),
                                        child:  Center(child: Image.asset(imageUrl, width: 50, height: 50)),
                                      ),
                                    );
                                  }).toList() ?? [], // Use an empty list if imageUrls is null
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  HorizontalListView({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
      child: SizedBox(
        height: 45.0,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            final labelText = index == 0 ? 'All' : '$index';
            return GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: index == 0 ? 48 : 60,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: index == selectedIndex ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      width: 1,
                      color: index == selectedIndex ? Color(0xFFFFA142) : Color(0xFFD1D5DB),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (index != 0)
                          Image.asset("assets/review/icon_star.png", scale: 2,),
                        if (index != 0)
                          SizedBox(width: 5,),
                        Text(
                          labelText,
                          style: TextStyle(
                            color: index == selectedIndex ? Color(0xFFE88E32) : Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 1.2, // Adjusted to ensure proper line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReviewListView extends StatelessWidget {
  final List<ReviewItem> reviews = [
    ReviewItem(
      reviewText: 'Not satisfied with the quality.',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    ReviewItem(
        reviewText: 'Great product, highly recommended!',
        details: '5 stars - January 2023',
        name: 'John Doe',
        stars: 3,
        imageUrls: [
          'assets/product_details/img_dumble.png',
          'assets/product_details/img_dumble.png'
        ] // Example image URLs
    ),
    ReviewItem(
      reviewText: 'Not satisfied with the quality.',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    // Add more review items as needed...
  ];

  final int selectedIndex;

  ReviewListView({
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    List<ReviewItem> filteredReviews = selectedIndex == 0
        ? reviews
        : reviews.where((review) => review.stars == selectedIndex).toList();

    return Padding(
      padding: EdgeInsets.zero,
      child: ListView.builder(
        itemCount: filteredReviews.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/review/icon_girl.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only( left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rhaenyra',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.09,
                                  ),
                                ),
                                SizedBox(height: 8,),
                                if (index >= 0) ...[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ...(filteredReviews[index].stars != null
                                              ? List.generate(filteredReviews[index].stars, (i) => Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 0.5),
                                            child: Image.asset("assets/review/icon_star.png", scale: 2.2),
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
                                      )
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  SizedBox(
                    height: 66,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, Viverra vulputate sodales quis et dui,',
                      style: TextStyle(
                        color: Color(0xFF475569),
                        fontSize: 14,
                        fontFamily: 'Archivo-Regular',
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5,),
                  if (filteredReviews[index].imageUrls != null)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: filteredReviews[index].imageUrls?.map((imageUrl) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8,bottom:10 ),
                            child: Container(
                              width: 56,
                              height: 56,
                              padding: const EdgeInsets.all(4),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE2E8F0),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                              child:  Center(child: Image.asset(imageUrl, width: 50, height: 50)),
                            ),
                          );
                        }).toList() ?? [], // Use an empty list if imageUrls is null
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}