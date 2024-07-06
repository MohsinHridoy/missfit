import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/cartscreen/cart001.dart';
import 'package:miss_fit/screens/reviewlistscreen/review_list_screen.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:miss_fit/screens/wishlist/wish_list_screen.dart';

import '../../common_widgets.dart';
import '../wishlist/wishlist_screen.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<ReviewItem> reviews = [
    ReviewItem(
      reviewText:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, Viverra vulputate sodales quis et dui",
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    ReviewItem(
      reviewText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, Viverra vulputate sodales quis et dui',
      details: '5 stars - January 2023',
      name: 'John Doe',
      stars: 3,
      imageUrls: [
        'assets/product_details/img_dumble.png',
        'assets/product_details/img_dumble.png'
      ], // Example image URLs
    ),
    ReviewItem(
      reviewText:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, Viverra vulputate sodales quis et dui',
      details: '2 stars - March 2023',
      name: 'Jane Smith',
      stars: 2,
    ),
    // Add more review items as needed...
  ];
  final List<String> imageUrls = [
    'assets/product_details/img_dumble.png',
    'assets/product_details/img_dumble.png',
    'assets/product_details/img_kettle_bells.png',
    'assets/product_details/img_power_bottle.png',
    'assets/product_details/img_protienshake.png',
    'assets/product_details/img_dumble.png',
    'assets/product_details/img_kettle_bells.png',
  ];
  int selectedIndex = -1; // Initial state with no selected index

  String? selectedImageUrl;
  bool showAll = false; // Flag to control whether to show all items
  int _productQuantity = 1;
  bool isExpanded = false;
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  late ScrollController _controller;
  bool isVisible = true;

  void _scrollListener() {
    if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
      setState(() {
        isVisible = false;
      });
    } else if (_controller.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    if (imageUrls.isNotEmpty) {
      selectedImageUrl = imageUrls[0];
    }
    if (text.length > 200) {
      firstPart = text.substring(0, 200) + '... ';
      trimmedText = text.substring(200);
    } else {
      firstPart = text;
      trimmedText = '';
    }
  }

  late String firstPart;
  late String trimmedText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine number of items to display
    int displayCount = showAll ? imageUrls.length : 4;

    return Scaffold(
      body: Container(
        color: Color(0xFFE2E8F0),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 380,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Center(
                          child: selectedImageUrl == null
                              ? const Placeholder()
                              : SizedBox(
                                  width: 280,
                                  height: 180,
                                  child: Image.asset(selectedImageUrl!,
                                      fit: BoxFit.contain)),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 290,
                          height: 64,
                          padding: const EdgeInsets.all(12),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: Color(0xFFD1D5DB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int index = 0;
                                    index <
                                        (imageUrls.length >= 4 && !showAll
                                            ? 5
                                            : imageUrls.length);
                                    index++)
                                  if (index == 4 && !showAll)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showAll =
                                              true; // Expand to show all items
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                        width: 36,
                                        height: 36,
                                        child: Text(
                                          '+${imageUrls.length - 4}',
                                          style: TextStyle(
                                            color: Color(0xFFE88E32),
                                            fontSize: 12,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedImageUrl = imageUrls[index];
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            imageUrls[index],
                                            scale: 1.5,
                                            fit: BoxFit.cover,
                                          ),
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
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1462,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF6F6F6),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(40)),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, right: 20, top: 30, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10.0, right: 5),
                                    child: Image.asset(
                                      "assets/review/icon_star.png",
                                      scale: 2,
                                    ),
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
                                            fontSize: 16,
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
                              Text(
                                '12 left in stock',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 12,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10),
                          child: SizedBox(
                            width: 289,
                            child: Text(
                              'Dumbbells',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 18,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.08,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 179,
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'CHF 25.00',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 18,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.08,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                          color: Color(0xFF334155),
                                          fontSize: 22,
                                          fontFamily: 'Archivo-Medium',
                                          fontWeight: FontWeight.w500,
                                          height: 0.06,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'CHF 32.00',
                                        style: TextStyle(
                                          color: Color(0xFF66758C),
                                          fontSize: 12,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          // Correct property is `decoration`, not `textDecoration`
                                          height: 0.12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (_productQuantity > 1)
                                          _productQuantity--;
                                      });
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      padding: const EdgeInsets.only(
                                        top: 4.50,
                                        left: 4,
                                        right: 4,
                                        bottom: 3.50,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF4343),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/cart/icon_minus.png",
                                          scale: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4.0, right: 4.0, top: 5),
                                    child: SizedBox(
                                      width: 20,
                                      child: Center(
                                        child: Text(
                                          '${_productQuantity}',
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 14,
                                            fontFamily: 'Archivo-Regular',
                                            fontWeight: FontWeight.w400,
                                            height: 0.10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _productQuantity++;
                                      });
                                    },
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      padding: const EdgeInsets.only(
                                        top: 4.50,
                                        left: 4,
                                        right: 4,
                                        bottom: 3.50,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFF4343),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/cart/icon_add.png",
                                          scale: 2,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        buildDivider(context),
                        SizedBox(
                          height: 45,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: textAmW5S16('Variants')),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            height: 36, // Fixed height for the container
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4, // Assume 10 items for the example
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex =
                                          index; // Update selected index on tap
                                      // Optional: print the selected index to console
                                      print('Selected Item $index');
                                    });
                                  },
                                  child: Container(
                                    width: 58,
                                    height: 36,
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      // Background color of the container
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        width: 1,
                                        color: selectedIndex == index
                                            ? Color(0xFFE88E32)
                                            : Color(0xFFD1D5DB),
                                        // Conditional border color based on selectedIndex
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '$index kg',
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Color(0xFFE88E32)
                                            : Color(0xFF334155),
                                        fontSize: 14,
                                        fontFamily: 'Archivo-Regular',
                                        fontWeight: FontWeight.w400,
                                        height:
                                            1.0, // Adjust line height if needed
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildDivider(context),
                        Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 45),
                            child: textAmW5S16('Specification')),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, top: 35),
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final linkText = 'see more';
                              final linkStyle = TextStyle(
                                color: Color(0xFFFF4343),
                                fontWeight: FontWeight.w500,
                              );

                              // Setup the TextPainter to calculate if we need "see more"
                              final textPainter = TextPainter(
                                text: TextSpan(
                                  text: firstPart + trimmedText,
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                ),
                                maxLines: 2,
                                textDirection: TextDirection.ltr,
                              );

                              // Layout the painter with available width
                              textPainter.layout(
                                  maxWidth: constraints.maxWidth);

                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (!isExpanded)
                                    GestureDetector(
                                      onTap: () {
                                        if (trimmedText.isNotEmpty) {
                                          setState(() {
                                            isExpanded = true;
                                          });
                                        }
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          text: firstPart,
                                          children: [
                                            TextSpan(
                                              text: linkText,
                                              style: linkStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  else
                                    Text(
                                      firstPart + trimmedText,
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 14,
                                        fontFamily: 'Archivo-Regular',
                                        fontWeight: FontWeight.w400,
                                        height: 1.11,
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildDivider(context),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textAmW5S16('Service & Return Policy'),
                              Image.asset(
                                "assets/cart/icon_right_arrow.png",
                                scale: 2,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildServicePolicyItem('14 Days Return'),
                        _buildServicePolicyItem(
                            '100% Authenic from trusted brands'),
                        _buildServicePolicyItem('2 months warranty'),
                        SizedBox(
                          height: 25,
                        ),
                        _buildDivider(),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textAmW5S16('Review'),
                              InkWell(
                                onTap: () {

                                  navigateToNextPage(context, ReviewList());

                                },
                                child: SizedBox(
                                  height: 10,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      'See All',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFFFF4343),
                                        fontSize: 12,
                                        fontFamily: 'Archivo-Medium',
                                        fontWeight: FontWeight.w500,
                                        height: 0.12,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, right: 10, left: 5),
                                child: Image.asset(
                                  "assets/review/icon_star.png",
                                  scale: 2,
                                ),
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
                        SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: reviews
                                .map((item) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, right: 20, bottom: 15),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:  Color(0xFFE5E7EB)
                                                      )),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 40,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: ShapeDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/review/icon_girl.png"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4)),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0,
                                                              left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Rhaenyra',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF334155),
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Archivo-Regular',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 0.09,
                                                            ),
                                                          ),
                                                          SizedBox(height: 15),
                                                          if (item.stars !=
                                                              null) ...[
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    ...(item.stars !=
                                                                            null
                                                                        ? List.generate(
                                                                            item.stars!,
                                                                            (i) => Padding(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 0.5),
                                                                                  child: Image.asset("assets/review/icon_star.png", scale: 2.2),
                                                                                ))
                                                                        : []),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  '5 days ago',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFF66758C),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'Archivo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height:
                                                                        0.12,
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
                                            SizedBox(height: 15),
                                            SizedBox(
                                              height: 66,
                                              child: Text(
                                                item.reviewText,
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
                                            SizedBox(height: 5),
                                            // Text(
                                            //   item.details,
                                            //   style: TextStyle(color: Colors.grey),
                                            // ),
                                            // SizedBox(height: 5),
                                            // Text(
                                            //   'By: ${item.name}',
                                            //   style: TextStyle(fontWeight: FontWeight.bold),
                                            // ),
                                            if (item.imageUrls !=
                                                null) // Check if image URLs exist
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: item.imageUrls
                                                          ?.map((imageUrl) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Image.asset(
                                                              imageUrl,
                                                              width: 50,
                                                              height: 50),
                                                        );
                                                      }).toList() ??
                                                      [], // Use an empty list if imageUrls is null
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 60),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                // Adjust the duration as needed
                opacity: isVisible ? 1.0 : 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Some things");
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Color(0x0C18181B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/cart/icon_left_arrow.png",
                            scale: 2,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Some things");
                        navigateToNextPage(context, WishList());
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Color(0x0C18181B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/shophome/icon_wishlist.png",
                            scale: 2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 76,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.05000000074505806),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.10999999940395355),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [


                            Text(
                              'CHF 210',
                              style: TextStyle(
                                color: Color(0xFF334155),
                                fontSize: 16,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 0.09,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                'CHF 32.00',
                                style: TextStyle(
                                  color: Color(0xFF66758C),
                                  fontSize: 10,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.lineThrough, // Apply line-through decoration
                                  height: 0.14,
                                )
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateToNextPage(context, Cart001());
                        },
                        child: Container(
                          width: 150,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4343),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Checkout',
                                textAlign: TextAlign.center,
                                // Ensure text alignment is centered

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
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildServicePolicyItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Container(
              width: 8,
              height: 8,
              decoration: ShapeDecoration(
                color: Color(0xFFD1D5DB),
                shape: OvalBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              width: 300,
              child: Text(
                text,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 0.10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFE5E7EB),
          ),
        ),
      ),
    );
  }
}
