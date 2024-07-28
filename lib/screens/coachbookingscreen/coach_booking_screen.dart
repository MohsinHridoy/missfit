import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/selectservicescreen/select_service_screen.dart';

import '../../common_utils.dart';
import '../../widgets/custom_app_bar.dart';

class CoachListScreen extends StatelessWidget {
  // Define a list of data for images and names
  List<Map<String, dynamic>> itemList = [
    {
      'image': "assets/coachbooking/img_coach1.png",
      'name': 'Sarah Glayre',
    },
    {
      'image': "assets/coachbooking/img_caoch2.png",
      'name': 'Pauline Udriot',
    },

    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(97),
        //   child: AppBar(
        //     toolbarHeight: 97,
        //     // Adjust the height of the app bar
        //     backgroundColor: Colors.red,
        //     // App bar color
        //     leading: IconButton(
        //       // Back arrow icon
        //       icon: Icon(Icons.arrow_back, color: Colors.black),
        //       onPressed: () {
        //         // Handle back button press here
        //         // Typically you would use Navigator.pop(context) to navigate back
        //       },
        //     ),
        //     titleSpacing: 10,
        //     // Adjust the spacing between the icon and title
        //     title: Padding(
        //       padding: const EdgeInsets.only(top: 12.0),
        //       // Adjust top padding of title
        //       child: Text(
        //         'Select Your Coach',
        //         style: TextStyle(color: Colors.black), // Text color
        //       ),
        //     ),
        //     centerTitle: true, // Center align title
        //   ),
        // ),
        body: Container(
          color: Color(0xFFF6F6F6),

          child: Column(
            children: [
              CustomAppBar(
                title: 'Sélectionnez votre entraîneur',
                onBackTap: () {
                  Navigator.pop(context);
                },
                iconSpacing: 8.3,
              ),
              SizedBox(height: 30.h,),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust the number of columns as needed
                    crossAxisSpacing: 1, // Adjust the spacing between columns
                    mainAxisSpacing: 15, // Adjust the spacing between rows
                  ),
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        navigateToNextPage(context,ServiceSelectionScreen());

                      },
                      child: Container(
                        width: 205,
                        height: 181,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(itemList[index]['image']),
                            fit: BoxFit.fill,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        clipBehavior: Clip.antiAlias,
                        // decoration: ShapeDecoration(
                        //   color: Colors.white,
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        // ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 57,

                            padding:
                                EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-0.00, 1.00),
                                end: Alignment(0, -1),
                                colors: [
                                  Color(0xFF353535),
                                  Color(0xB2363636),
                                  Color(0x00363636)
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                itemList[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Medium',
                                  fontWeight: FontWeight.w500,
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
            ],
          ),
        ),
      ),
    );
  }
}
