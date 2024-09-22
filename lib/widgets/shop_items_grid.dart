import 'package:flutter/material.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';

class ShopItemsGridView extends StatelessWidget {
  final List<CustomItem> items; // Assuming you have an `Item` model class
  final int crossAxisCount;
  final Function(CustomItem) onTap;

  const ShopItemsGridView({
    Key? key,
    required this.items,
    this.crossAxisCount = 2,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(), // Disable internal scrolling
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 13.0,
            crossAxisSpacing: 13.0,
            childAspectRatio: 0.748,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildGridItem(context, item);
          },
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, CustomItem item) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double itemWidth = constraints.maxWidth;
        double itemHeight = itemWidth * (3 / 4.1); // Calculate height based on aspect ratio

        return GestureDetector(
          onTap: () => onTap(item),
          child: Container(
            width: itemWidth, // Use the width provided by LayoutBuilder
            height: itemHeight, // Dynamic height based on aspect ratio
            padding: const EdgeInsets.only(bottom: 5),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: itemHeight * 1.25, // Adjust this value based on design
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
                          item.image!,
                          width: itemWidth * 0.75,
                          height: itemHeight * 0.75, // Adjust the image size as needed
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF3F4F6),
                          border: Border(
                            left: BorderSide(
                              width: 1,
                              color: Color(0xFFE5E7EB), // Your desired color
                            ),
                            right: BorderSide(
                              width: 1,
                              color: Color(0xFFE5E7EB), // Your desired color
                            ),
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0xFFE5E7EB), // Your desired color
                            ),
                            // No top border, so don't include it here
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 14,
                                  fontFamily: 'Archivo-SemiBold',
                                  fontWeight: FontWeight.w600,
                                  height: 1.3
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'CHF ${item.price!.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Color(0xFF334155),
                                        fontSize: 12,
                                        fontFamily: 'Archivo-Medium',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'CHF ${item.originalPrice!.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: Color(0xFF66758C),
                                          fontSize: 10,
                                          fontFamily: 'Archivo-Regular',
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.lineThrough,
                                          height: 1.2
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (item.isChecked ?? false) ...[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      height: 40,
                      width: 50,
                      child: Image.asset("assets/product_details/icon_sale.png"),
                    ),
                  ),
                  Positioned(
                    top: 13,
                    left: 10,
                    child: Text(
                      'Sale',
                      style: TextStyle(
                        color: Color(0xFF0F172A),
                        fontSize: 10,
                        fontFamily: 'Archivo-Medium',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
