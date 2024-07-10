import 'package:flutter/material.dart';
import 'package:miss_fit/screens/orderstatus/cancel_order_status_screen.dart';
import 'package:miss_fit/screens/orderstatus/order_status_screen.dart';
import 'package:miss_fit/screens/review/write_review.dart';

import '../../common_utils.dart';
import '../../widgets/custom_app_bar.dart';

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
  List<String> categoryItems = ['All', 'Processing', 'Delivered', 'Cancelled'];
  List<OrderHistoryItem> orderHistoryItems = [
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
  ];
  List<OrderHistoryItem> filteredItems =
      []; // Items to be displayed based on the selected category

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredItems = orderHistoryItems;
  }

  @override
  Widget build(BuildContext context) {
    // List<OrderHistoryItem> filteredReviews = selectedIndex == 0
    //     ? orderHistoryItems
    //     : orderHistoryItems
    //         .where((review) => review.reviewStatus == selectedIndex)
    //         .toList();
    return  Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            CustomAppBar(
              title:  'Order History',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.8,
            ),
            SizedBox(
              height: 15,
            ),
            // Rating Section
            // Horizontal List View Section

            // Review List View Section
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
              child: SizedBox(
                height: 45.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    final labelText = index == 0 ? 'All' : '$index';
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          // Filter items based on the selected category
                          if (selectedIndex == 0) {
                            // All category selected, show all items
                            filteredItems = orderHistoryItems;
                          } else {
                            // Filter items based on the selected category
                            filteredItems = orderHistoryItems
                                .where((item) =>
                            item.reviewStatus == categoryItems[index])
                                .toList();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                        child: Container(
                          height: 36,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            color: index == selectedIndex ?Colors.white:Colors.transparent,
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
                            child:  Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                categoryItems[index],
                                style: TextStyle(
                                  color: index == selectedIndex
                                      ? Color(0xFFE88E32)
                                      : Color(0xFF334155),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.10,
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

            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  double totalPrice = 0;
                  if (filteredItems[index].imageItems != null) {
                    for (var item in filteredItems[index].imageItems!) {
                      totalPrice += double.parse(item.price.split(
                          ' ')[1]); // Assuming price format is 'CHF xxx'
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 0.0, right: 0, bottom: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.5))),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'INV #26510654',
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 14,
                                        fontFamily: 'Archivo-Medium',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 8.0),
                                      child: Container(
                                        height: 18,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: ShapeDecoration(
                                          color: _getColorForReviewStatus(
                                              filteredItems[index]
                                                  .reviewStatus),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(4)),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              filteredItems[index].reviewStatus,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: 'Archivo-Regular',
                                                fontWeight: FontWeight.w400,
                                                height: 0.14,
                                              ),
                                            ),
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
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          if (filteredItems[index].imageItems !=
                              null) // Check if image items exist
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: filteredItems[index]
                                    .imageItems!
                                    .map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 44,
                                              height: 44,
                                              decoration: ShapeDecoration(
                                                color: Color(0xFFD9D9D9),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                              ),
                                              child: Image.asset(item.imageUrl,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: SizedBox(
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
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                        SizedBox(height: 15),
                                        Divider(height: 0.5,color: Color(0xFFE5E7EB),)
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Price:',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                ),
                                Text(
                                  'CHF ${totalPrice.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          filteredItems[index].reviewStatus !=
                              'Delivered'?    Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: GestureDetector(
                              onTap:(){
                                if(filteredItems[index].reviewStatus ==
                                    'Processing')
                                navigateToNextPage(context,OrderStatus(status: OrderStatusEnum.Processing,navigationStatus:'Processing'));

                                else if(filteredItems[index].reviewStatus ==
                                    'Cancelled')
                                {

                                  navigateToNextPage(context,CancelOrderStatus(status: CancelOrderStatusEnum.CANCELLED));

                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5.0,right: 5,bottom: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 40,

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
                                        'View Details',
                                        style: TextStyle(
                                          color: Color(0xFFFF4343),
                                          fontSize: 14,
                                          fontFamily: 'Archivo-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          height: 0.10,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ):  Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 30),
                            child:  Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap:(){
                                      navigateToNextPage(context,OrderStatus(status: OrderStatusEnum.Packed1,navigationStatus:'Processing'));

                                    },
                                    child: Container(
                                      height: 40,

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
                                            'View Details',
                                            style: TextStyle(
                                              color: Color(0xFFFF4343),
                                              fontSize: 14,
                                              fontFamily: 'Archivo-SemiBold',
                                              fontWeight: FontWeight.w600,
                                              height: 0.10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: GestureDetector(
                                    onTap:(){

                                      navigateToNextPage(context,ProductReview());

                                    },
                                    child: Container(
                                      height: 40,

                                      decoration: ShapeDecoration(
                                        color: Color(0xFFFF4343),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Write Review',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Archivo-SemiBold',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                          ),
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
                  );
                },
              ),
            )
          ],
        ),
      ),
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
