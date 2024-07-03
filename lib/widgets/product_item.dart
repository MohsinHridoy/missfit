import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Function? onTap;
  final String? image;
  final String? title;
  final double? price;
  final double? originalPrice;
  final bool? isChecked;

  const ProductItem({
    Key? key,
    this.onTap,
    this.image,
    this.title,
    this.price,
    this.originalPrice,
    this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!() : null,
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        height: 250,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 152,
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      image!,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: ShapeDecoration(
                      color: Color(0xFFF3F4F6),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: Color(0xFFE5E7EB).withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(4),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 128,
                              child: Text(
                                title!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CHF ${price!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Color(0xFF334155),
                                    fontSize: 12,
                                    fontFamily: 'Archivo-Medium',
                                    fontWeight: FontWeight.w500,
                                    height: 0.12,
                                  ),
                                ),
                                Text(
                                  'CHF ${originalPrice!.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: Color(0xFF66758C),
                                    fontSize: 10,
                                    fontFamily: 'Archivo-Regular',
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.lineThrough,
                                    height: 0.14,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: isChecked ?? false,
              child: Container(
                height: 40,
                width: 50,
                child: Image.asset("assets/product_details/icon_sale.png"),
              ),
            ),
            Positioned(
              top: 19,
              left: 10,
              child: Visibility(
                visible: isChecked ?? false,
                child: Text(
                  'Sale',
                  style: TextStyle(
                    color: Color(0xFF0F172A),
                    fontSize: 10,
                    fontFamily: 'Archivo-Medium',
                    fontWeight: FontWeight.w500,
                    height: 0.15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
