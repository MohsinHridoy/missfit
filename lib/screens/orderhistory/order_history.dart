import 'package:flutter/material.dart';

class ImageItem {
  final String imageUrl;
  final String title;
  final String price;

  ImageItem({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

class OrderHistoryItem {
  final String reviewText;
  final String details;
  final String name;
  final int stars;
  final String reviewStatus;
  final List<ImageItem>? imageItems; // List of image items

  OrderHistoryItem({
    required this.reviewText,
    required this.details,
    required this.name,
    required this.stars,
    required this.reviewStatus,

    this.imageItems, // Initialize the list of image items
  });
}

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
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
              // Header Section
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
              // Rating Section
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
              // Horizontal List View Section
              HorizontalListView(
                selectedIndex: selectedIndex,
                onItemSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              // Review List View Section
              Expanded(
                child: ReviewListView(
                  selectedIndex: selectedIndex,
                  reviews: [
                    OrderHistoryItem(
                      reviewText: 'Not satisfied with the quality.',
                      details: '2 stars - March 2023',
                      name: 'Jane Smith',
                      stars: 2,
                      reviewStatus: 'Processing',
                      imageItems: [
                        ImageItem(
                          imageUrl: 'assets/product_details/img_dumble.png',
                          title: 'Big Power Sports Nutrition',
                          price: 'CHF 240',
                        ),
                        ImageItem(
                          imageUrl: 'assets/product_details/img_dumble.png',
                          title: 'Another Product',
                          price: 'CHF 120',
                        ),
                      ],
                    ),
                    OrderHistoryItem(
                      reviewText: 'Great product, highly recommended!',
                      details: '5 stars - January 2023',
                      name: 'John Doe',
                      stars: 3,
                      reviewStatus: 'Delivered',

                      imageItems: [
                        ImageItem(
                          imageUrl: 'assets/product_details/img_dumble.png',
                          title: 'Big Power Sports Nutrition',
                          price: 'CHF 240',
                        ),
                        ImageItem(
                          imageUrl: 'assets/product_details/img_dumble.png',
                          title: 'Another Product',
                          price: 'CHF 120',
                        ),
                      ],
                    ),
                    OrderHistoryItem(
                      reviewText: 'Not satisfied with the quality.',
                      details: '2 stars - March 2023',
                      name: 'Jane Smith',
                      stars: 2,
                      reviewStatus: 'Cancelled',

                    ),
                    // Add more review items as needed...
                  ],
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
  final List<OrderHistoryItem> reviews;
  final int selectedIndex;

  ReviewListView({
    required this.selectedIndex,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    List<OrderHistoryItem> filteredReviews = selectedIndex == 0
        ? reviews
        : reviews.where((review) => review.stars == selectedIndex).toList();

    return ListView.builder(
      itemCount: filteredReviews.length,
      itemBuilder: (context, index) {
        double totalPrice = 0;
        if (filteredReviews[index].imageItems != null) {
          for (var item in filteredReviews[index].imageItems!) {
            totalPrice += double.parse(item.price.split(' ')[1]); // Assuming price format is 'CHF xxx'
          }
        }
        return Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15),
          child: Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.5))),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'INV #26510654',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Container(
                          height: 18,
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: ShapeDecoration(
                            color: _getColorForReviewStatus(filteredReviews[index].reviewStatus),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              filteredReviews[index].reviewStatus,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w400,
                                height: 0.14,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      '12 May, 2024',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xFF66758C),
                        fontSize: 12,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
                Text(
                  'Total Price: CHF ${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo-Regular',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                ),
                SizedBox(height: 15,),

                SizedBox(height: 5,),
                if (filteredReviews[index].imageItems != null) // Check if image items exist
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: filteredReviews[index].imageItems!.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(item.imageUrl, width: 50, height: 50),
                              SizedBox(height: 5),
                              SizedBox(
                                width: 157,
                                child: Text(
                                  item.title,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Color(0xFF334155),

                                    fontSize: 14,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 63,
                                    child: Text(
                                      item.price,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 14,
                                        fontFamily: 'Archivo',
                                        fontWeight: FontWeight.w500,
                                        height: 0.09,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  SizedBox(
                                    width: 85,
                                    child: Text(
                                      '2 x CHF 120',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF66758C),
                                        fontSize: 14,
                                        fontFamily: 'Archivo',
                                        fontWeight: FontWeight.w400,
                                        height: 0.09,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
  Color _getColorForReviewStatus(String status) {
    switch (status) {
      case 'Processing':
        return Color(0xFFFFA142); // Orange
      case 'Cancelled':
        return Colors.red;
      case 'Packed':
      case 'Shipped':
        return Colors.blue; // Choose any color you prefer for these statuses
      default:
        return Color(0xFF22C55E); // Green for other statuses
    }
  }
}