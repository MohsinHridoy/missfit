import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';





class BookmarkItem {
  final String name;
  final String imagePath;

  BookmarkItem({required this.name, required this.imagePath});
}



class BookmarkList extends StatefulWidget {
  final String title;

  const BookmarkList({Key? key, required this.title}) : super(key: key);

  @override
  _BookmarkListState createState() => _BookmarkListState();
}

class _BookmarkListState extends State<BookmarkList> {
  List<BookmarkItem> bookmarkItems = [
    BookmarkItem(name: 'Torche calorique', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 2', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 3', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 4', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 5', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 6', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 7', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 8', imagePath: 'assets/bookmark/bookmarklist.png'),
    BookmarkItem(name: 'Torche calorique 9', imagePath: 'assets/bookmark/bookmarklist.png'),
  ];

  void _removeItem(int index) {
    setState(() {
      bookmarkItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(bookmarkItems[index].name +'  removed'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title: widget.title,
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: (widget.title == 'Entraînement' || widget.title == 'Relever un défi') ? 3.9 : 4.9,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bookmarkItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: 78,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(4)),
                                      ),
                                    ),
                                    child: Image.asset(
                                      bookmarkItems[index].imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          bookmarkItems[index].name,
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 18,
                                            fontFamily: 'Archivo-Medium',
                                            fontWeight: FontWeight.w500,
                                            height: 1.5,
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          children: [
                                            Container(
                                              width: 16,
                                              height: 16,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/takechallenge/icon_level.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              'Intermédiaire',
                                              style: TextStyle(
                                                color: Color(0xFF334155),
                                                fontSize: 12,
                                                fontFamily: 'Archivo-Regular',
                                                fontWeight: FontWeight.w400,
                                                height: 1.5,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 44),
                                  GestureDetector(
                                    onTap: () => _removeItem(index),
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                        ),
                                      ),
                                      child: Image.asset(
                                        "assets/shophome/icon_bookmark_fill.png",
                                        scale: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color(0xFFE5E7EB),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}