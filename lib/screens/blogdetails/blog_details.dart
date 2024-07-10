import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          CustomAppBar(
            title:   'Blog Post',
            onBackTap: () {
              Navigator.pop(context);
            },
            iconSpacing: 3.2,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          '5 exercices essentiels pour un tronc plus fort',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Kanit-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.06,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 280,
                        height: 18,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '20 janvier 2024',
                              style: TextStyle(
                                color: Color(0xFF66758C),
                                fontSize: 14,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(width: 11),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFD1D5DB),
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ),
                            const SizedBox(width: 11),
                            Text(
                              '4 minutes de lecture',
                              style: TextStyle(
                                color: Color(0xFF66758C),
                                fontSize: 14,
                                fontFamily: 'Archivo-Medium',
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: 365,
                        height: 145,
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Color(0xFFE5E7EB),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 356,
                              height: 188,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/home/img_blog_item.png"), // Update to use asset image
                                  fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 365,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text:
                                'Do we need to explain why core workouts are crucial? At this point you likely know that damn near everything you do with your body, from pushing iron on a bench press (remember those days?) to pushing around a grocery cart gets your core firing. And while the quarantine era has waylaid our gym runs and our after-work jogs with friends, you can at least roll out your ',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'yoga mat',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                ' for some planks and mountain climbers.\nYou probably think of your core as, essentially, your abs. \n\nDon\'t. Imagine the core as a pillar from your neck to your pelvis, suggests ',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Dan Giordano',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: ', DPT, CSCS, and cofounder of ',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Bespoke Treatments',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                '. “The stronger your pillar is, the stronger your entire body will be—all movements will either start at or be transferred through your pillar.”\nErgo, stronger core means more power. But core workouts aren\'t just for getting six packs and putting more oomph in your golf drives. \n\nCore workouts also improve your balance and stability. Strengthen that pillar, and you\'re more agile, more adept at picking up new movements, and you\'ll have less likelihood of tweaking a muscle that\'s trying to pick up the slack for a weak core. As just one example of the ripple effect that comes from focusing on your core: one ',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Chinese study',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text:
                                ' found that eight weeks of core strength workouts could even improve overall running economy and endurance (yes, please).\n\nHere, five top trainers offer their take on a 10-minute core routine. If you’ve used the lockdown to power through your push-up progressions and read the entirety War and Peace, CONGRATS. You should still focus some of that energy on your core to even out an imbalances. For the rest of us, a great core workouts delivers some endorphins and hits a wide array of muscle groups—and doesn\'t have to take that long. If you rotate through them during the week, you’ll never get bored—but you will feel better.\n\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'High plank hold\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 18,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text:
                                '\nGet in a high plank position with shoulders over wrists, a straight line from shoulder to ankle. Engage the core; hold.\n\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Superman raise\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 18,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text:
                                '\nStart lying face down on the floor with arms overhead, palms down. Engaging your core and glutes, lift arms and legs up off the ground. Hold for 2 counts, lower back down for one rep.\n\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                              TextSpan(
                                text: 'Bear plank shoulder taps\n',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 18,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w600,
                                  height: 1.3,
                                ),
                              ),
                              TextSpan(
                                text:
                                '\nStart in table top position with your toes tucked and knees lifted a few inches off the ground. Your shoulders should be directly over your wrists. Engaging the core, and without allowing your weight to shift over to one side, lift your right hand up and tap the left shoulder. Repeat on the opposite side for one rep.',
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 320,
                        child: Text(
                          'Blog connexe',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 20,
                            fontFamily: 'Kanit-SemiBold',
                            fontWeight: FontWeight.w600,
                            height: 1.06,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 370,
                      height: 216,
                      padding: const EdgeInsets.only(bottom: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 365,
                            height: 140,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 360,
                                  height: 140,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/home/img_blog_item.png',
                                    fit: BoxFit.cover,
                                    width: 360,
                                    height: 140,
                                  ),
                                )

                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 312,
                                          height: 48,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '5 exercices essentiels pour un tronc plus fort',
                                                  style: TextStyle(
                                                    color: Color(0xFF334155),
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),                                ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 370,
                      height: 216,
                      padding: const EdgeInsets.only(bottom: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 365,
                            height: 140,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  width: 360,
                                  height: 140,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: ShapeDecoration(
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/home/img_blog_item.png',
                                    fit: BoxFit.cover,
                                    width: 360,
                                    height: 140,
                                  ),
                                )

                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 312,
                                          height: 48,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  '5 exercices essentiels pour un tronc plus fort',
                                                  style: TextStyle(
                                                    color: Color(0xFF334155),
                                                    fontSize: 16,
                                                    fontFamily: 'Archivo-Medium',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),                                ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}