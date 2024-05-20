import 'package:flutter/material.dart';

class SelectService extends StatelessWidget {
  // Define a list of data for images and names
  List<Map<String, dynamic>> itemList = [
    {
      'image': "assets/coachbooking/img_coach1.png",
      'name': 'Sarah Glayre',
    },
    {
      'image': "assets/coachbooking/img_caoch2.png",
      'name': 'John Doe',
    },
    {
      'image': "assets/coachbooking/img_coach1.png",
      'name': 'John Doe',
    },
    {
      'image': "assets/coachbooking/img_caoch2.png",
      'name': 'John Doe',
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
        body: Column(
          children: [
            Container(
              height: 97,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                border: Border.all(color: Colors.white.withOpacity(0.11)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Handle back button tap
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 4.1),
                    Text(
                      'Select Your Coach',
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

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Adjust the number of columns as needed
                  crossAxisSpacing: 1, // Adjust the spacing between columns
                  mainAxisSpacing: 15, // Adjust the spacing between rows
                ),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 150,
                    height: 180,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(itemList[index]['image']),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                            child: Text(
                              itemList[index]['name'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Archivo',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
