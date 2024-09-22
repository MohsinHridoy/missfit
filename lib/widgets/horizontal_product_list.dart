import 'dart:io';

import 'package:flutter/material.dart';

class HorizontalProductList extends StatelessWidget {
  final List<File> images;
  final ValueChanged<int> onDelete;
  final double imageSize;
  final double spacing;
  final Color deleteIconColor;
  final Color containerColor;
  final Color deleteIconBackgroundColor;

  const HorizontalProductList({
    Key? key,
    required this.images,
    required this.onDelete,
    this.imageSize = 88.0,
    this.spacing = 8.0,
    this.deleteIconColor = Colors.red,
    this.containerColor = const Color(0xFFE5E7EB),
    this.deleteIconBackgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: spacing),
      child: SizedBox(
        height: imageSize, // Height of each item in the list
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: spacing), // Spacing between items
              child: Container(
                width: imageSize,
                height: imageSize,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: containerColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        onDelete(index); // Pass the index to the onDelete callback
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: spacing, top: 2),
                          child: Container(
                            width: 20,
                            height: 20,
                            padding: EdgeInsets.all(4),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: deleteIconBackgroundColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Icon(
                              Icons.delete,
                              size: 12,
                              color: deleteIconColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: imageSize / 2.5,
                        height: imageSize / 2.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
