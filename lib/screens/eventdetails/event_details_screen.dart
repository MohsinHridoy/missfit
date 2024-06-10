import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isExpanded = false;
  String text =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  late String firstPart;
  late String trimmedText;
  bool isInitialViewVisible=false;

  @override
  void initState() {
    super.initState();

    if (text.length > 200) {
      firstPart = text.substring(0, 200) + '... ';
      trimmedText = text.substring(200);
    } else {
      firstPart = text;
      trimmedText = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
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

                        Navigator.pop(context);

                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.6),
                    Text(
                      'Event Details',
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/eventdetails/img.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: SizedBox(
                        width: 208,
                        child: Text(
                          'Fitness Decathlon',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: _fitnessSubItem(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: SizedBox(
                        width: 208,
                        child: Text(
                          'Date & Time',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: Row(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: ShapeDecoration(
                              color: Color(0xFFE5E7EB),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: Image.asset(
                              "assets/eventdetails/icon_calendar.png",
                              scale: 2.2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monday, December 24, 2022',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '18.00 - 23.00 PM (GMT +07:00)',
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 16,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 25),
                      child: SizedBox(
                        width: 208,
                        child: Text(
                          'About Event',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final linkText = 'Read more ...';
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
                          textPainter.layout(maxWidth: constraints.maxWidth);

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
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: SizedBox(
                        width: 208,
                        child: Text(
                          'Host',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 16,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w600,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 49,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/eventdetails/icon_profile.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Juliyet Evana',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 16,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w600,
                                    height: 0.09,
                                  ),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  'Trainer',
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 14,
                                    fontFamily: 'Archivo',
                                    fontWeight: FontWeight.w400,
                                    height: 0.10,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: SizedBox(
                        width: 318,
                        child: Text(
                          'Gallery (Pre-Event)',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            if (index == 2) {
                              // Display a text for the third item's length
                              return Container(
                                width: 98,
                                height: 98,
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFBDBDBD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                child: Text(
                                  '20+',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 0.07,
                                  ),
                                ),
                              );
                            } else {
                              // Display regular items
                              return Container(
                                width: 98,
                                height: 98,
                                margin: EdgeInsets.symmetric(horizontal: 8),
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFBDBDBD),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 70,),
                    GestureDetector(
                      onTap: () {
                        // showModalBottomSheet(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return Container(
                        //       // Define your modal bottom sheet content here
                        //       width: MediaQuery.of(context).size.width,
                        //       child:Column(
                        //         children: [
                        //           SizedBox(
                        //             width: 320,
                        //             child: Text(
                        //               'Do you want to confirm your seat?',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                 color: Color(0xFF334155),
                        //                 fontSize: 18,
                        //                 fontFamily: 'Archivo',
                        //                 fontWeight: FontWeight.w600,
                        //                 height: 0.08,
                        //               ),
                        //             ),
                        //           ),
                        //
                        //           SizedBox(
                        //             height: 30,
                        //           ),
                        //
                        //           Container(
                        //             width: 320,
                        //             height: 180,
                        //             decoration: ShapeDecoration(
                        //               image: DecorationImage(
                        //                 image: NetworkImage("https://via.placeholder.com/320x180"),
                        //                 fit: BoxFit.cover,
                        //               ),
                        //               shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(8),
                        //                   topRight: Radius.circular(8),
                        //                 ),
                        //               ),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     );
                        //   },
                        // );

                        _showBottomSheet(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 112, vertical: 17),
                          decoration: ShapeDecoration(
                            color: Color(0xFFFF4343),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Center(
                            child: Text(
                              'Book Event',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w600,
                                height: 0.09,
                              ),
                            ),
                          ),
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
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              height: isInitialViewVisible ?280: 430,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0), // Adjust the radius as needed
                  topRight: Radius.circular(20.0), // Adjust the radius as needed
                ),
              ),              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: isInitialViewVisible
                    ? Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(
                        'assets/lottie_anim/tik_anim.json', // Path to the Lottie JSON file in the assets folder
                        height: 200, // Adjust height as needed
                        width: 200, // Adjust width as needed
                        fit: BoxFit.cover, // Adjust the fit
                        repeat: false, // Play animation only once

                      ),
                    ),

                    SizedBox(
                      width: 320,
                      child: Text(
                        'Congratulations !',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 18,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 1.08,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'You Have successfullly booked',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF334155).withOpacity(0.9),
                            fontSize: 16,
                            fontFamily: 'Archivo-Medium',
                            fontWeight: FontWeight.w500,
                            height: 0.09,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 10),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);

                            // setState(() {
                            //   isVisible=true;
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) => DashBoard()),
                            //   );
                            // });
                          },
                          child:  Container(
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            decoration: BoxDecoration(
                              color: Color(0xFFFF4343),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w500,
                                  height: 1.11,
                                ),
                              ),
                            ),
                          )

                      ),
                    ),
                  ],
                ): Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Do you want to confirm your seat?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF334155),
                              fontSize: 18,
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w600,
                              height: 0.08,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Color(0xFFF3F4F6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/eventdetails/img.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(topRight:Radius.circular(8),topLeft:Radius.circular(8),)),
                                  ),
                                ),


                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    width: 284,
                                    child: Text(
                                      'Monday, December 24, 2022',
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 16,
                                        fontFamily: 'Archivo-SemiBold',
                                        fontWeight: FontWeight.w600,
                                        height: 0.09,
                                      ),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    '18.00 - 23.00 PM (GMT +07:00)',
                                    style: TextStyle(
                                      color: Color(0xFF66758C),
                                      fontSize: 16,
                                      fontFamily: 'Archivo',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5, bottom: 1, top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                        context); // Close the modal when tapped
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 52,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 17),
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1, color: Color(0xFFFF4343)),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                          color: Color(0xFFFF4343),
                                          fontSize: 16,
                                          fontFamily: 'Archivo-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          height: 0.09,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {

                                  // Close the modal when tapped
                                    setState(() {
                                      isInitialViewVisible = true;
                                    });
                                  },
                                  child: Container(
                                    width: 150,
                                    height: 52,
                                    decoration: ShapeDecoration(
                                      color: Color(0xFFFF4343),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Confirm',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Archivo-SemiBold',
                                          fontWeight: FontWeight.w600,
                                          height: 0.09,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ,
              ),
            );
          },
        );
      },
    );
  }

  Widget _fitnessSubItem() {
    return Row(
      children: [
        SizedBox(
          width: 60,
          child: Stack(
            children: [
              _buildPerticipentPhoto("assets/eventdetails/img_1.png"),
              Positioned(
                  left: 15,
                  child: _buildPerticipentPhoto(
                      "assets/eventdetails/icon_profile2.png")),
              Positioned(
                  left: 30,
                  child: _buildPerticipentPhoto(
                      "assets/eventdetails/icon_profile3.png")),
            ],
          ),
        ),
        Text(
          '200+ participant',
          style: TextStyle(
            color: Color(0xFF66758C),
            fontSize: 16,
            fontFamily: 'Archivo-Regular',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            width: 8,
            height: 8,
            decoration: ShapeDecoration(
              color: Color(0xFFCBD5E1),
              shape: OvalBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            width: 20,
            height: 20,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Image.asset("assets/eventdetails/icon_stool.png"),
          ),
        ),
        Text(
          '10 seats left',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF66758C),
            fontSize: 16,
            fontFamily: 'Archivo-Regular',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        )
      ],
    );
  }

  Widget _buildPerticipentPhoto(String photo) {
    return Container(
      width: 24,
      height: 24,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(photo),
          fit: BoxFit.fill,
        ),
        shape: OvalBorder(
          side: BorderSide(width: 1.20, color: Colors.white),
        ),
      ),
    );
  }
}
