import 'package:flutter/material.dart';

Widget buttonLightGrey(BuildContext context, String buttonText) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 52,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 17),
    decoration: BoxDecoration(
      color: Color(0xFFD1D5DB),
      borderRadius: BorderRadius.circular(8),
    ),
    child: TextButton(
      onPressed: () {
        // Handle button press
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            buttonText,
            style: TextStyle(
              color: Color(0xFF66758C),
              fontSize: 16,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w600,
              height: 0.09,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget customButtonRed(BuildContext context, String buttonText, {VoidCallback? onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFFFF4343),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0), // Adjust vertical padding as needed
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Archivo',
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
  );
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonLightGrey(context, 'Suivante'),
          SizedBox(height: 16), // Adding some space between the buttons
          customButtonRed(context, 'Soumettre', onPressed: () {
            // Handle button press
          }),
        ],
      ),
    );
  }
}
