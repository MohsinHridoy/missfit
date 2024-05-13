import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Container(
          color: Color(0xFFF6F6F6),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 97,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
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
                      SizedBox(width: MediaQuery.of(context).size.width / 3),
                      Text(
                        'Review',
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
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/review/icon_star.png",scale: 1.7,),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.2 ',
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 16,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                            ),
                          ),
                          TextSpan(
                            text: '(12 Reviews)',
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
              Expanded(
                child: ReviewListView(
                  selectedIndex: selectedIndex,
                ),
              ),
            ],
          ),
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
                  width: index == 0 ?48:60,
                  height: 36,
                  alignment: Alignment.center,
                  // margin: EdgeInsets.symmetric(horizontal: 8.0),
                  // padding: EdgeInsets.all(10.0),
                  // decoration: BoxDecoration(
                  //   color: index == selectedIndex ? Colors.blue : Colors.grey[300],
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: index == selectedIndex ? Color(0xFFFFA142):Color(0xFFD1D5DB),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      children: [

                        SizedBox(width: 15,),

                        index == 0 ?SizedBox(): Image.asset("assets/review/icon_star.png",scale: 2,),
                        SizedBox(width:index == 0 ? 0:5,),


                        Text(
                          labelText,

                          style: TextStyle(
                            color: index == selectedIndex ?Color(0xFFE88E32): Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.10,
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

    return ListView.builder(
      itemCount: filteredReviews.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5))),
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
                          padding: const EdgeInsets.only(top: 8.0,left: 10),
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
                                  height: 0.09,
                                ),
                              ),
                              SizedBox(height: 15,),


                              if (index >= 0) ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ...(filteredReviews[index].stars != null
                                            ? List.generate(filteredReviews[index].stars!, (i) => Padding(
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

                // Text(
                //   filteredReviews[index].reviewText,
                //   style: TextStyle(fontSize: 16.0),
                // ),
                // SizedBox(height: 5.0),
                // Text(
                //   filteredReviews[index].details,
                //   style: TextStyle(color: Colors.grey),
                // ),
                // SizedBox(height: 5.0),
                // Text(
                //   'By: ${filteredReviews[index].name}',
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                if (filteredReviews[index].imageUrls != null) // Check if image URLs exist
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: filteredReviews[index].imageUrls?.map((imageUrl) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(imageUrl, width: 50, height: 50),
                      );
                    }).toList() ??
                        [], // Use an empty list if imageUrls is null
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
