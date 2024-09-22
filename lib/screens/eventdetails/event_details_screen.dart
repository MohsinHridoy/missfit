import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';
import 'package:lottie/lottie.dart';

import '../../widgets/common_buttons.dart';

class EventDetails extends StatefulWidget {
  final dynamic item;
  String? status;

  EventDetails({required this.item,this.status});

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool isExpanded = false;
  bool isVisible = true;
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
  void _showBottomSheet(BuildContext context, VoidCallback onContinue) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(top: 20, left: 15),
              height: isInitialViewVisible ? 280 : 430,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: isInitialViewVisible
                    ? Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.asset(
                        'assets/lottie_anim/tik_anim.json',
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                        repeat: false,
                      ),
                    ),
                    SizedBox(
                      width: 320,
                      child: Text(
                        'Congratulations!',
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
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'You Have successfully booked',
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
                      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          onContinue(); // Trigger the callback to update parent state
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4343),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Continuer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Archivo-SemiBold',
                                fontWeight: FontWeight.w500,
                                height: 1.11,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Voulez-vous confirmer votre place?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF334155),
                        fontSize: 18,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                      ),
                    ),
                    SizedBox(height: 20),
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
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  topLeft: Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
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
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0, right: 0, bottom: 1, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 52,
                                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                                decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1, color: Color(0xFFFF4343)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Non',
                                    style: TextStyle(
                                      color: Color(0xFFFF4343),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      height: 1.09,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isInitialViewVisible = true;
                                });
                              },
                              child: Container(
                                height: 52,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFF4343),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Confirmer',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Archivo-SemiBold',
                                      fontWeight: FontWeight.w600,
                                      height: 1.09,
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
        );
      },
    );
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
                    widget.status=='event' ?
                    SizedBox(width: MediaQuery.of(context).size.width / 4.9):
                    SizedBox(width: MediaQuery.of(context).size.width / 3.9),
                    Text(
                      widget.status=='event' ? "Détails de l'évènement" : 'Cours de groupe',
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
                            image: AssetImage(widget.item.imagePath),
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
                          widget.item.title,
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
                          'Date et heure',
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
                      child:  Text(
                        "À propos de l'événement",
                        style: TextStyle(
                          color: Color(0xFF334155),
                          fontSize: 18,
                          fontFamily: 'Archivo-SemiBold',
                          fontWeight: FontWeight.w600,
                          height: 0.08,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
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
                            height: 1.11,
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
                              child: RichText(
                                text: TextSpan(
                                  text: firstPart,
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    height: 1.11,
                                  ),
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
                      padding: const EdgeInsets.only(left: 20.0, top: 40),
                      child: SizedBox(
                        width: 208,
                        child: Text(
                          'Hôtesse',
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
                    widget.status=='event'?
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: SizedBox(
                        width: 318,
                        child: Text(
                          'Galerie (pré-événement)',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 18,
                            fontFamily: 'Archivo-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 0.08,
                          ),
                        ),
                      ),
                    ):SizedBox(),
                    SizedBox(
                      height: 30,
                    ),
                    widget.status=='event'?  Padding(
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
                                width: 108,
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
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
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
                                  ),
                                ),
                              );
                            } else {
                              // Display regular items
                              return Container(
                                width: 108,
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
                    ):SizedBox(),

                    SizedBox(height: 70,),
                  ],
                ),
              ),
            ),
            if(isVisible)
              GlossyContainer(
                width: MediaQuery.of(context).size.width,
                height: 76,
                color:Colors.white.withOpacity(0.10999999940395355),
                blendMode: BlendMode.srcATop,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 76,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.10999999940395355),
                      ),
                    ),
                  ),
                  child: customButtonRed(context, widget.status=='event' ?'Événement de livre':'Reserve maintenant', onPressed: () {
                    _showBottomSheet(context, () {
                      setState(() {
                        isVisible = false;
                      });
                    });
                  }),
                ),
              )

          ],
        ),
      ),

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
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '200+ participant',
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
              height: 0.09,
            ),
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
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'reste 10 places',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
              height: 0.09,
            ),
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


