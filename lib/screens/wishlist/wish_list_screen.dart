import 'package:flutter/material.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  List<CustomItem> items = [

    CustomItem(
        title: 'Dumbbells',
        image: 'assets/product_details/img_dumble.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: true),
    CustomItem(
        title: 'Big Power Nutrition',
        image: 'assets/product_details/img_power_bottle.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: false),
    CustomItem(
        title: 'Protien Shake',
        image: 'assets/product_details/img_protienshake.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Nutrition',
        isChecked: false),
    CustomItem(
        title: 'Kettlebells',
        image: 'assets/product_details/img_kettle_bells.png',
        price: 25.00,
        originalPrice: 30.00,
        category: 'Gym Equpment',
        isChecked: false),

    // Add more items here as needed
  ];

  List<String> categoryItems = ['All', 'Gym Equpment', 'Nutrition', 'Body'];
  List<CustomItem> filteredItems =
      []; // Items to be displayed based on the selected category
  int selectedIndex = 0; // Add this line

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    filteredItems = items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        "assets/cart/icon_left_arrow.png",
                        scale: 2,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.2),
                    Text(
                      'WishList',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontFamily: 'Kanit-Medium',
                        fontWeight: FontWeight.w500,
                        height: 0.07,

                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15),
              child: SizedBox(
                height: 50.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    final labelText = categoryItems[index];
                    final textWidth = labelText.length * 12.0; //
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          // Filter items based on the selected category
                          if (selectedIndex == 0) {
                            // All category selected, show all items
                            filteredItems = items;
                          } else {
                            // Filter items based on the selected category
                            filteredItems = items
                                .where((item) =>
                                    item.category == categoryItems[index])
                                .toList();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // width: labelText == 'All' ? 48 :  textWidth + 30,
                          height: 36,
                          alignment: Alignment.center,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: index == selectedIndex
                                    ? Color(0xFFFFA142)
                                    : Color(0xFFD1D5DB),
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),

                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    labelText,
                                    style: TextStyle(
                                      color: index == selectedIndex
                                          ? Color(0xFFE88E32)
                                          : Color(0xFF334155),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Regular',
                                      fontWeight: FontWeight.w400,
                                      height: 0.10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 22.0,right: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,

                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredItems.length,
                        // Replace 6 with your actual item count
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];

                          return Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 110,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 91,
                                            padding: const EdgeInsets.only(
                                                top: 7, right: 1, bottom: 5),
                                            clipBehavior: Clip.antiAlias,
                                            decoration: ShapeDecoration(
                                              color: Color(0xFFE5E7EB),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(8)),
                                            ),
                                            child: Center(
                                              child: Image.asset(
                                                item.image,
                                              ),
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0,top: 5,right: 3),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 200,
                                                  child: Text(
                                                    item.title,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Color(0xFF334155),
                                                      fontSize: 14,
                                                      fontFamily: 'Archivo-SemiBold',
                                                      fontWeight: FontWeight.w600,
                                                      height: 0.09,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 18),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                          'CHF ${item.price.toStringAsFixed(2)}',
                                                          style: TextStyle(
                                                            color: Color(0xFF334155),
                                                            fontSize: 12,
                                                            fontFamily: 'Archivo-Medium',
                                                            fontWeight: FontWeight.w500,
                                                            height: 0.12,
                                                          )),
                                                      SizedBox(width: 3,),
                                                      Text(
                                                        'CHF ${item.originalPrice.toStringAsFixed(2)}',
                                                        style: TextStyle(
                                                          color: Color(0xFF66758C),
                                                          fontSize: 10,
                                                          fontFamily: 'Archivo-Regular',
                                                          fontWeight: FontWeight.w400,
                                                          decoration:
                                                          TextDecoration.lineThrough,
                                                          height: 0.14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 25),
                                                Container(
                                                  width: 98,
                                                  height: 32,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFF4343),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(8)),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Add to cart',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontFamily: 'Archivo-SemiBold',
                                                        fontWeight: FontWeight.w600,
                                                        height: 0.14,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),

                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child:Padding(
                                          padding: const EdgeInsets.only(top: 50.0,right: 10),
                                          child: GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                // Remove the payment item at the current index
                                                showModalBottomSheet(
                                                  barrierColor: Color(0xFF111827).withOpacity(0.7),
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return Container(
                                                      height: 215, // Adjust the height as necessary
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
                                                              fontFamily: 'Archivo-Medium',
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
                                                                          fontFamily: 'Archivo-SemiBold',
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
                                                                      items.removeAt(index);
                                                                      Navigator.pop(
                                                                          context);
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
                                                borderRadius:
                                                BorderRadius.circular(4),
                                              ),
                                              child: Image.asset("assets/product_details/icon_delete.png"),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Color(0xFFE5E7EB),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 52,
            decoration: ShapeDecoration(
              color: Color(0xFFFF4343),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
             child:Center(
               child: Text(
                 'All Add to Cart',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 16,
                   fontFamily: 'Archivo-SemiBold',
                   fontWeight: FontWeight.w600,
                   height: 0.09,
                 ),
               ),
             ) ,
          ),
        )
          ],
        ),
      ),
    );
  }
}
