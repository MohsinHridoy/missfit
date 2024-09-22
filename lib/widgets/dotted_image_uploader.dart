import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedImageUploader extends StatelessWidget {
  final int imageCount;
  final int maxImages;
  final VoidCallback? onPickImage;

  const DottedImageUploader({
    Key? key,
    required this.imageCount,
    this.maxImages = 5,
    this.onPickImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.red,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      child: GestureDetector(
        onTap: imageCount >= maxImages ? null : onPickImage,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/review/icon_camera.png",
                height: 25,
                width: 25,
              ),
              SizedBox(width: 10),
              Text(
                'Télécharger une photo ($imageCount/$maxImages)',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
