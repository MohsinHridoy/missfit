





import 'package:flutter/material.dart';

void navigateToNextPage(BuildContext context,Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>page,
    ),
  );
}