import 'package:flutter/material.dart';
import 'package:miss_fit/common_utils.dart';
import 'package:miss_fit/screens/addnewcard/add_new_card_screen.dart';
import 'package:miss_fit/screens/billingaddress/billing_address.dart';
import 'package:miss_fit/screens/dashboard/dashboard.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';
import 'package:miss_fit/screens/paymentmethod/payment_method.dart';
import 'package:miss_fit/screens/subscription/subscription.dart';
import 'package:miss_fit/screens/subscription_history/subscription_history.dart';


class MySubscription extends StatelessWidget {
  final String? title;

  const MySubscription({Key? key,  this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   centerTitle: true,
        //   title: Text(
        //     'My Subscription',
        //     style: TextStyle(
        //       color: Color(0xFF1E293B),
        //       fontSize: 18,
        //       fontFamily: 'Kanit',
        //       fontWeight: FontWeight.w500,
        //       height: 1.07, // Adjusted height to fix text height
        //     ),
        //   ),
        //   toolbarHeight: 97.0,
        // ),
        body: Container(
          color: Color(0xFFF6F6F6),
          child: Column(
            children: [
              Container(
                height: 97,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.11)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                            navigateToNextPage(context, DashBoard(number: 3,));

                        },
                        child: Image.asset(
                          "assets/cart/icon_left_arrow.png",
                          scale: 2,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 4.2),
                      Text(
                        'My Subscription',
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
                    children: [
                      _SubscriptionDetailsContainer(),
                      _BillingInfoContainer(),
                      _PaymentDetailsContainer(), // Added new container here
                      SizedBox(height: 40),

                      // Add more widgets here as needed
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class _SubscriptionDetailsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 22.0, left: 22.0, right: 22, bottom: 10),
      child: Container(
        width: 380,
        height: 330,
        padding: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          clipBehavior: Clip.none, // Allows the icons to overflow the container
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 5), // Placeholder height for icons
                _SubscriptionInfo(),
                SizedBox(height: 10), // Placeholder height for icons

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.5,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                  ),
                ),

                SizedBox(height: 20),
                _SubscriptionOptions(),
              ],
            ),
            Positioned(
              top: -4, // Adjust position as needed
              right: -38,
              child: _NewIcon(),
            ),
            Positioned(
              top: -44, // Adjust position as needed
              right: -39,
              child: _SubscriptionIcon(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BillingInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 16),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 10),
              child: Text(
                'Billing Information',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                  height: 0.09,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.5,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              child: CustomPaint(
                painter: DashedLinePainter(),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Tom Hank',
              style: TextStyle(
                color: Color(0xFF66758C),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
                height: 0.10,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 280,
              child: Text(
                'Netstal, 1920, 10A Thornidge Street, Glarus Flat - 13B, House - 23',
                style: TextStyle(
                  color: Color(0xFF66758C),
                  fontSize: 16,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'tommy1265@gmail.com',
              style: TextStyle(
                color: Color(0xFF66758C),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '+243 555-0108',
              style: TextStyle(
                color: Color(0xFF66758C),
                fontSize: 16,
                fontFamily: 'Archivo-Regular',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){


                        navigateToNextPage(context, SubscriptionHistory());

                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/mysubscription/icon_history.png",
                              scale: 2.2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                'History',
                                style: TextStyle(
                                  color: Color(0xFFFF4343),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 0.10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 22,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {


                        navigateToNextPage(context, BillingDeliavryAddress(status: 'profile',));

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/mysubscription/icon_edit.png",
                                scale: 2.2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Modify Info',
                                  style: TextStyle(
                                    color: Color(0xFFFF4343),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 0.10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class _PaymentDetailsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 370,
        height: 145,
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 24,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 333,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 135,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Payment Details',
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
                        const SizedBox(width: 25),
                        GestureDetector(
                          onTap: (){


                            navigateToNextPage(context, PaymentMethod());

                          },
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Image.asset(
                                      'assets/mysubscription/icon_edit.png'), // Use your asset image here
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  'Change',
                                  style: TextStyle(
                                    color: Color(0xFFFF4343),
                                    fontSize: 14,
                                    fontFamily: 'Archivo-SemiBold',
                                    fontWeight: FontWeight.w600,
                                    height: 0.10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 365,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE5E7EB),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 14),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF3F4F6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/42x20"),
                              // Replace with the URL of your image
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 52,
                          child: Text(
                            'Stripe',
                            style: TextStyle(
                              color: Color(0xFF66758C),
                              fontSize: 16,
                              fontFamily: 'Archivo-Regular',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          '•••• •••• •••• 87652',
                          style: TextStyle(
                            color: Color(0xFF66758C),
                            fontSize: 16,
                            fontFamily: 'Archivo-Regular',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFFFFCBD0),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _NewIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        color: Color(0xFFFB9694),
        shape: OvalBorder(),
      ),
    );
  }
}

class _SubscriptionInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(14),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Color(0xFFF9FAFB),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: Container(
              width: 28,
              height: 28,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/mysubscription/icon_crown.png',
                // Replace with your asset image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12), // Space between image and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Premium Plan',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 20,
                  fontFamily: 'Archivo-SemiBold',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Monthly Subscription',
                style: TextStyle(
                  color: Color(0xFF66758C),
                  fontSize: 14,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubscriptionOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _OptionItem(title: 'Locket Rental', value: 'Yes'),
        _OptionItem(title: 'Duration', value: '06 months'),
        _OptionItem(title: 'Start Date', value: '09-05-24'),
        _OptionItem(
            title: 'Expire Date',
            value: '09-11-25',
            valueColor: Color(0xFFE88E32)),
        SizedBox(height: 20),
        _RenewSubscriptionButton(),
      ],
    );
  }
}

class _OptionItem extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;

  const _OptionItem({
    Key? key,
    required this.title,
    required this.value,
    this.valueColor = const Color(0xFF334155),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo-Regular',
              fontWeight: FontWeight.w400,
              height: 0.08,
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: valueColor,
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _RenewSubscriptionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateToNextPage(context,Subscription());
      },
      child: Container(
        width: double.infinity,
        height: 44,
        decoration: BoxDecoration(
          color: Color(0xFFFF4343),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            'Renew Subscription',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Archivo-SemiBold',
              fontWeight: FontWeight.w600,
              height: 1.2, // Adjusted height
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square; // Setting strokeCap to square

    final double dashWidth = 5;
    final double dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}