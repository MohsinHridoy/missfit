import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';

import '../../common_utils.dart';
import '../../common_widgets.dart';
import '../../widgets/common_buttons.dart';
import '../../widgets/custom_app_bar.dart';
import '../reviewsummery/review_summery_screen.dart';
import '../reviewsummery/review_summery_subscription_screen.dart';

class AddNewCard extends StatefulWidget {
  String? status;

  AddNewCard({super.key, this.status});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  bool isVisible = false;
  bool isVisible_outlinebutton = true;
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _cardHolderCOntroller = TextEditingController();
  TextEditingController _expiredDateController = TextEditingController();
  TextEditingController _cvvCodeController = TextEditingController();

  List<PaymentModel> paymentItems = [
    PaymentModel(
      title: 'Item 2',
      quantity: 1,
      image: 'assets/payment/img_delivary_item2.png',
      weight: 0.7,
      cardHolder: 'Jane Doe',
      cardName: 'Stripe',
      expiryDate: '10/25',
      cvvCode: '452222222222222',
      isChecked: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF6F6F6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              title: widget.status == 'mentorship'
                  ? '        Mode de paiement'
                  : (widget.status == 'profile'
                      ? '       Carte de paiement'
                      : 'Ajouter une nouvelle carte'),
              onBackTap: () {
                if(isVisible_outlinebutton==false)
                  setState(() {
                    isVisible_outlinebutton=true;
                    isVisible=false;
                  });
                else
                Navigator.pop(context);
              },
              iconSpacing: 7,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
                padding: const EdgeInsets.all(25.0),
                child: title_textView_Kt_SBld(
                    isVisible ? 'Ajouter une carte' : 'Ma carte')),
            Visibility(visible: !isVisible, child: _buildListPaymentMethod()),
            widget.status == 'mentorship' || widget.status == 'subscription'
                ? Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isVisible) {
                              _addNewPaymentMethod(); // Add new card if currently in add card mode
                            }
                            isVisible = !isVisible;
                            isVisible_outlinebutton = false;
                          });
                        },
                        // child: outlineButton(context,'Ajouter une nouvelle carte')
                        child: Visibility(
                          visible: isVisible_outlinebutton,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 52,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFFFF4343)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Ajouter une nouvelle carte',
                                style: TextStyle(
                                  color: Color(0xFFFF4343),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 1.10,
                                ),
                              ),
                            ),
                          ),
                        )),
                  )
                : SizedBox(),
            Visibility(
              visible: isVisible,
              child: Column(
                children: [
                  _textFormField(_cardNumberController, 'Numéro de carte'),
                  _textFormField(
                      _cardHolderCOntroller, 'Titulaire de la carte'),
                  _textFormField(_expiredDateController, "Date d'expiration"),
                  _textFormField(_cvvCodeController, 'CVV Code'),
                ],
              ),
            ),
            Spacer(),
            widget.status != 'mentorship' && widget.status != 'subscription'
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: customButtonRed(
                        context, 'Ajouter une nouvelle carte', onPressed: () {
                      setState(() {
                        if (isVisible) {
                          _addNewPaymentMethod(); // Add new card if currently in add card mode
                        }
                        isVisible =
                            !isVisible; // Toggle the visibility state regardless
                        isVisible_outlinebutton = true;
                        ;
                      });
                    }),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: customButtonRed(
                        context,
                        isVisible == false
                            ? 'Continue'
                            : 'Ajouter une nouvelle carte', onPressed: () {
                      widget.status == 'subscription'
                          ? navigateToNextPage(context, ReviewSummary1())
                          : isVisible == false
                              ? navigateToNextPage(context, ReviewSummary())
                              : setState(() {
                                  if (isVisible) {
                                    _addNewPaymentMethod(); // Add new card if currently in add card mode
                                  }
                                  isVisible =
                                      !isVisible; // Toggle the visibility state regardless
                                  isVisible_outlinebutton = true;
                                  ;
                                });
                    }),
                  )
          ],
        ),
      ),
    );
  }

  Widget _textFormField(TextEditingController controller, String Label) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 16,
            fontFamily: 'Archivo-Medium',
            fontWeight: FontWeight.w500,
            height: 1.09,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
            labelText: Label,
            labelStyle: TextStyle(
              color: Color(0xFF334155),
              fontSize: 16,
              fontFamily: 'Archivo-Medium',
              fontWeight: FontWeight.w500,
              height: 0.09,
            ),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
          ),
        ),
      ),
    );
  }

  String safeSubstring(String text, int start, [int? end]) {
    if (text.length > start) {
      return text.substring(start, end ?? text.length);
    }
    return ''; // or return the original text or any placeholder
  }

  Widget _buildListPaymentMethod() {
    return Column(
      children: List.generate(
        paymentItems.length,
        (index) {
          final item = paymentItems[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Uncheck all payment methods
                  for (var i = 0; i < paymentItems.length; i++) {
                    paymentItems[i].isChecked = false;
                  }
                  // Check the selected payment method
                  item.isChecked = true;
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 72,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 6),
                          child: Container(
                            width: 55,
                            height: 55,
                            padding: const EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: SizedBox(
                                  width: 153,
                                  height: 20,
                                  child: Text(
                                    item.cardName,
                                    style: TextStyle(
                                      color: Color(0xFF334155),
                                      fontSize: 16,
                                      fontFamily: 'Archivo-Regular',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '•••• •••• •••• ' +
                                    safeSubstring(item.cvvCode, 12),
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo-Regular',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              // Remove the payment item at the current index
                              showModalBottomSheet(
                                barrierColor:
                                    Color(0xFF111827).withOpacity(0.7),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 215,
                                    // Adjust the height as necessary
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 50),
                                        Text(
                                          'Supprimer la carte existante',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 18,
                                            fontFamily: 'Archivo-SemiBold',
                                            fontWeight: FontWeight.w600,
                                            height: 0.08,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          'Voulez-vous supprimer cette carte ?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF334155),
                                            fontSize: 16,
                                            fontFamily: 'Archivo',
                                            fontWeight: FontWeight.w500,
                                            height: 0.09,
                                          ),
                                        ),
                                        SizedBox(height: 40),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30.0, right: 30, bottom: 1),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(
                                                        context); // Close the modal when tapped
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 32,
                                                        vertical: 17),
                                                    decoration: ShapeDecoration(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: Color(
                                                                0xFFFF4343)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Text(
                                                          'Non',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFF4343),
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Archivo',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 0.09,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      paymentItems
                                                          .removeAt(index);

                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    decoration: ShapeDecoration(
                                                      color: Color(0xFFFF4343),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                    ),
                                                    child: Center(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 8.0),
                                                        child: Text(
                                                          'Oui',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'Archivo-SemiBold',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            height: 0.09,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            padding: const EdgeInsets.all(6),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Image.asset(
                              "assets/cart/icon_remove.png",
                              scale: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _addNewPaymentMethod() {
    if (isVisible) {
      // Optionally validate input data
      if (_cardNumberController.text.isEmpty ||
          _cardHolderCOntroller.text.isEmpty ||
          _expiredDateController.text.isEmpty ||
          _cvvCodeController.text.isEmpty) {
        // Show an error or handle validation failure
        return;
      }

      // Create a new PaymentModel and add it to paymentItems
      final newItem = PaymentModel(
        title: 'New Item',
        // Set this or generate dynamically
        quantity: 1,
        // Set according to your needs
        image: 'assets/payment/default.png',
        // Default image or based on some logic
        weight: 1.0,
        // Default or dynamic
        cardHolder: _cardHolderCOntroller.text,
        cardName: 'New Card',
        // Dynamic based on your logic
        expiryDate: _expiredDateController.text,
        cvvCode: _cvvCodeController.text,
        isChecked: false,
      );

      setState(() {
        print(_cardHolderCOntroller.text);

        paymentItems.add(newItem);
        _cardNumberController.clear();
        _cardHolderCOntroller.clear();
        _expiredDateController.clear();
        _cvvCodeController.clear();
      });
    }
  }
}
