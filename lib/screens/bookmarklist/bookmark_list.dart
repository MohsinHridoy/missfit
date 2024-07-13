import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_app_bar.dart';

class BookmarkList extends StatelessWidget {
  final String title;

  const BookmarkList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> assetImages = [
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
      'assets/bookmark/bookmarklist.png', // Replace with your actual asset path
    ];

    return Scaffold(
      backgroundColor:  Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title: title,
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing:title=='Entraînement'?3.9: 4.2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: assetImages.length,
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
                                      assetImages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Torche calorique',
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
                                  Container(
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