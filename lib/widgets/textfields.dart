
import 'package:flutter/material.dart';



Widget textFormFieldAddress(BuildContext context,TextEditingController controller, String label, TextInputType keyboardType, VoidCallback onChangedCallback,) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 48,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType, // Use the provided keyboardType

        onChanged: (value) {
          // _checkFieldsFilled(); // This will be called every time the text changes
          onChangedCallback();
        },

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
          labelText: label, // Use the provided label

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
