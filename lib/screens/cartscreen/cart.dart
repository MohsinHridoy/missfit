import 'package:flutter/material.dart';

// Container(
// width: MediaQuery.of(context).size.width,
// height: 97,
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(16),
// bottomRight: Radius.circular(16),
// ),
// border: Border(
// left: BorderSide(
// color: Colors.white.withOpacity(0.11),
// ),
// top: BorderSide(
// color: Colors.white.withOpacity(0.11),
// ),
// right: BorderSide(
// color: Colors.white.withOpacity(0.11),
// ),
// bottom: BorderSide(
// width: 1,
// color: Colors.white.withOpacity(0.11),
// ),
// ),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Align(
// alignment: Alignment.centerRight,
// child: Image.asset(
// "assets/cart/icon_left_arrow.png",
// scale: 2.23,
// ),
// ),
// SizedBox(
// width: MediaQuery.of(context).size.width / 2.8,
// ),
// Text(
// 'Cart',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Color(0xFF1E293B),
// fontSize: 18,
// fontFamily: 'Kanit',
// fontWeight: FontWeight.w500,
// height: 0.07,
// ),
// ),
// Spacer()
// ],
// ),
// ),
// SizedBox(
// height: 20,
// ),

class CartItem {
  final String title;
  int quantity;
  final String image;
  final double weight;
  bool isChecked; // Added isChecked property

  CartItem({
    required this.title,
    required this.quantity,
    required this.image,
    required this.weight,
    this.isChecked = false, // Initialized isChecked to false
  });
}

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<CartItem> cartItems = [
    CartItem(
        title: 'Item 1', quantity: 1, image: 'assets/item1.jpg', weight: 0.5),
    CartItem(
        title: 'Item 2', quantity: 1, image: 'assets/item2.jpg', weight: 0.7),
    CartItem(
        title: 'Item 3', quantity: 1, image: 'assets/item3.jpg', weight: 0.6),
  ];

  List<CartItem> removedItems = []; // List to store removed items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          // Checkbox to select all items
          Container(
            width: 320,
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Checkbox(
                  value: cartItems.isNotEmpty &&
                      cartItems.every((item) => item.isChecked),
                  onChanged: (value) {
                    setState(() {
                      for (var item in cartItems) {
                        item.isChecked = value!;
                      }
                    });
                  },
                ),
                Text(
                  'Select All (${cartItems.length} items)',
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 14,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                ),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Remove selected items
                      removedItems.addAll(cartItems.where((item) => item.isChecked));
                      cartItems.removeWhere((item) => item.isChecked);
                    });
                  },
                  child: Text(
                    'Remove',
                    style: TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 14,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w400,
                      height: 0.11,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // List of cart items
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (BuildContext context, int index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Checkbox(
                    value: item.isChecked,
                    onChanged: (value) {
                      setState(() {
                        item.isChecked = value!;
                      });
                    },
                  ),
                  title: Text(item.title),
                  subtitle: Row(
                    children: [
                      Text('Quantity: ${item.quantity}'),
                      SizedBox(width: 10),
                      Text('Weight: ${item.weight}'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Increment item count
                            item.quantity++;
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                      Text('${item.quantity}'),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            // Decrement item count if greater than 1
                            if (item.quantity > 1) item.quantity--;
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // List of removed items
          Text(
            'Removed Items:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: removedItems.length,
              itemBuilder: (BuildContext context, int index) {
                final removedItem = removedItems[index];
                return Container(
                  child: Row(
                    children: [
                      Text(removedItem.title),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            // Restore the removed item
                            cartItems.add(removedItem);
                            removedItems.remove(removedItem); // Remove by reference
                          });
                        },
                        child: Text(
                          'Undo',
                          style: TextStyle(
                            color: Color(0xFFEF4444),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            height: 0.11,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}