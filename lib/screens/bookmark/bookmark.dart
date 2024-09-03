import 'package:flutter/material.dart';
// import 'package:miss_fit/screens/bookmark/bmtakechallenge.dart';

import '../../common_utils.dart';
import '../../widgets/custom_app_bar.dart';
import '../bookmarklist/bookmark_list.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> assetImages = [
      'assets/bookmark/img_1.png', // Replace with your actual asset path
      'assets/bookmark/img_3.png', // Replace with your actual asset path
      'assets/bookmark/img_4.png', // Replace with your actual asset path
    ];

    final List<String> titles = [
      'Relever un défi',
      'Entraînement',
      'Suivre un programme',
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Élément de signet',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 4.5,
          ),
          SizedBox(height: 25,),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: assetImages.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateToNextPage(context, BookmarkList(title: titles[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15), // Add padding here
                    child: Container(
                      width: double.infinity,
                      height: 85,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(assetImages[index]), // Use AssetImage
                                  fit: BoxFit.cover, // Adjust BoxFit as per your requirement
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 20, // Adjusted from 45 to fit within 85 height
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  titles[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Kanit',
                                    fontWeight: FontWeight.w500,
                                    height: 1.2, // Adjust height for proper line spacing
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '12 articles',
                                  style: TextStyle(
                                    color: Color(0xFFE2E8F0),
                                    fontSize: 12,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.2, // Adjust height for proper line spacing
                                  ),
                                ),
                              ],
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
    );
  }
}