import 'package:flutter/material.dart';
import 'package:miss_fit/screens/payment/payment_screeen.dart';

class AddNewCard extends StatefulWidget {
  String? status;
   AddNewCard({super.key,this.status});

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  bool isVisible = false;
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
                    SizedBox(width: MediaQuery.of(context).size.width / 4.2),
                    Text(
                     widget.status == 'profile'?'Payment Card': 'Add New Card',
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                isVisible ?  'Add Card':'My Card',
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 18,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
            ),
            Visibility(visible:!isVisible ,child: _buildListPaymentMethod()),
            Visibility(
              visible:isVisible ,
              child: Column(
                children: [
                  _textFormField(_cardNumberController,'Card Number'),
                  _textFormField(_cardHolderCOntroller,'Card Holder'),
                  _textFormField(_expiredDateController,'Expired Date'),
                  _textFormField(_cvvCodeController,'CVV Code'),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: (){
                  setState(() {
                    if (isVisible) {
                      _addNewPaymentMethod();  // Add new card if currently in add card mode
                    }
                    isVisible = !isVisible;  // Toggle the visibility state regardless
                  });

                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 104, vertical: 17),
                  decoration: ShapeDecoration(
                    color: Color(0xFFFF4343),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      'Add new cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Archivo-SemiBold',
                        fontWeight: FontWeight.w600,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textFormField(TextEditingController controller,String Label){
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20,top: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 48,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,

          style: TextStyle(
            color: Color(0xFF334155),
            fontSize: 16,
            fontFamily: 'Archivo',
            fontWeight: FontWeight.w500,
            height: 1.09,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD1D5DB)),
            ),
            labelText: Label,
            labelStyle: TextStyle(color: Color(0xFF334155),
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
                                '•••• •••• •••• ' + safeSubstring(item.cvvCode, 12),

                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 16,
                                  fontFamily: 'Archivo',
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
                                barrierColor: Color(0xFF111827).withOpacity(0.7),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 215, // Adjust the height as necessary
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
                                          'Delete Existing Card',
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
                                          'Do you want to delete this card?',
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
                                          padding: const EdgeInsets.only(left: 30.0,right: 30,bottom: 1),
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
                                                        fontFamily: 'Archivo',
                                                        fontWeight: FontWeight.w600,
                                                        height: 0.09,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: (){

                                                  setState(() {
                                                    paymentItems.removeAt(index);

                                                  });

                                                },
                                                child: Container(
                                                  width: 150,
                                                  height: 52,

                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFF4343),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(8)),
                                                  ),

                                                  child: Center(
                                                    child: Text(
                                                      'Yes',
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
      if (_cardNumberController.text.isEmpty || _cardHolderCOntroller.text.isEmpty ||
          _expiredDateController.text.isEmpty || _cvvCodeController.text.isEmpty) {
        // Show an error or handle validation failure
        return;
      }

      // Create a new PaymentModel and add it to paymentItems
      final newItem = PaymentModel(
        title: 'New Item', // Set this or generate dynamically
        quantity: 1, // Set according to your needs
        image: 'assets/payment/default.png', // Default image or based on some logic
        weight: 1.0, // Default or dynamic
        cardHolder: _cardHolderCOntroller.text,
        cardName: 'New Card', // Dynamic based on your logic
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
