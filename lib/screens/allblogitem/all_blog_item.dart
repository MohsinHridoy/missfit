import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';

import '../../widgets/custom_app_bar.dart';
import '../blogdetails/blog_details.dart';

// Replace BlogItem with your actual class representing blog items
class BlogItem {
  final String title;
  final String imagePath;
  final String category;

  BlogItem({
    required this.title,
    required this.imagePath,
    required this.category,
  });
}

class AllBlogItemPage extends StatefulWidget {
  @override
  _AllBlogItemPageState createState() => _AllBlogItemPageState();
}

class _AllBlogItemPageState extends State<AllBlogItemPage> {
  int selectedIndex = 0; // Default selected index
  List<BlogItem> blogItems = [
    BlogItem(
      title: "Sample Blog Title 1",
      imagePath: "assets/home/img_blog_item.png",
      category: "Toute",
    ),
    BlogItem(
      title: "Sample Blog Title 2",
      imagePath: "assets/home/img_blog_item.png",
      category: "Gym",
    ),
    BlogItem(
      title: "Sample Blog Title 3",
      imagePath: "assets/home/img_blog_item.png",
      category: "Weight loss",
    ),
    BlogItem(
      title: "Sample Blog Title 4",
      imagePath: "assets/home/img_blog_item.png",
      category: "Nutrition",
    ),
    // Add more BlogItem objects as needed
  ];

  List<BlogItem> filteredItems = []; // List to hold filtered items

  @override
  void initState() {
    super.initState();
    // Initially show all items
    filteredItems = blogItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title:   'Tout le blog',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 3.5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 18),
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryItems.length,
                      itemBuilder: (context, index) {
                        final labelText = categoryItems[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              // Filter items based on the selected category
                              if (selectedIndex == 0) {
                                // All category selected, show all items
                                filteredItems = blogItems;
                              } else {
                                // Filter items based on the selected category
                                filteredItems = blogItems
                                    .where((item) =>
                                item.category ==
                                    categoryItems[index])
                                    .toList();
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 36,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: index == selectedIndex
                                    ? Colors.white
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: index == selectedIndex
                                        ? Color(0xFFFFA142) // Adjust color as needed
                                        :  Color(0xFFD1D5DB),
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    labelText,
                                    style: TextStyle(
                                      color: index == selectedIndex
                                          ? Color(0xFFFFA142) // Adjust color as needed
                                          : Colors.black,
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
                      BlogItem item = filteredItems[index];
                      // return GestureDetector(
                      //   onTap: () {
                      //     // Navigate to BlogDetailsPage or perform any action
                      //     // navigateToNextPage(context, BlogDetails());
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Container(
                      //       height: 200,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         image: DecorationImage(
                      //           image: AssetImage(item.imagePath),
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       child: Stack(
                      //         children: [
                      //           Positioned(
                      //             bottom: 10.0,
                      //             left: 10.0,
                      //             child: Container(
                      //               padding: EdgeInsets.symmetric(
                      //                   horizontal: 8.0, vertical: 4.0),
                      //               color: Colors.black54,
                      //               child: Text(
                      //                 item.title,
                      //                 style: TextStyle(
                      //                   color: Colors.white,
                      //                   fontSize: 20,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // );
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: (){
                            navigateToNextPage(context,BlogDetails());

                          },
                          child: Container(
                            width: 288,
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(item.imagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,top: 5),
                                      child: Container(
                                        width: 70,
                                        height: 25,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF252323),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(2)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset("assets/home/icon_calendar.png",scale: 2,),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 6.0),
                                              child: Text(
                                                '02 Fév',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontFamily: 'Archivo-Regular',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          width: 55,
                                          height: 18,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 2),
                                          decoration: ShapeDecoration(
                                            color: Color(0x21FFF4E4),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(1),
                                            ),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 5.0),
                                              child: Text(
                                                'Beginner',
                                                style: TextStyle(
                                                  color: Color(0xFFFFA142),
                                                  fontSize: 10,
                                                  fontFamily: 'Archivo-Regular',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.14,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(top: 5, left: 0),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    // Set color to transparent
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0,top: 25),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: Text(
                                            '5 exercices essentiels pour un tronc plus fort',
                                            style: TextStyle(
                                              color: Color(0xFF334155),
                                              fontSize: 16,
                                              fontFamily: 'Archivo',
                                              fontWeight: FontWeight.w500,
                                              height: 0.09,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Replace categoryItems with your list of categories
List<String> categoryItems = ['Toute', 'Gym', 'Weight loss', 'Nutrition'];
