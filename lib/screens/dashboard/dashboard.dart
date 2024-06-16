import 'package:flutter/material.dart';
import 'package:miss_fit/screens/cartscreen/cart001.dart';
import 'package:miss_fit/screens/home/home001.dart';
import 'package:miss_fit/screens/profile/profile.dart';
import 'package:miss_fit/screens/shophomepage/shop_home_page.dart';
import 'package:miss_fit/screens/subscription/subscription.dart';


class DashBoard extends StatefulWidget {
 final int? number;
  const DashBoard({Key? key, this.number}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    ShopPage(),
    // Cart001(),
    // Cart001(),
    // Subscription(),
    Profile(),
  ];


  void initState() {
    super.initState();
    // if(widget)

    int? index;
    if(widget.number == 2)
      index = widget.number;
    _selectedIndex = index ?? 0; // Revised line
    _isSelected[_selectedIndex] = true;

  }

  final List<bool> _isSelected = [false, false, false, ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _updateSelectedIndex(index);
    });
  }

  void _updateSelectedIndex(int index) {
    for (int i = 0; i < _isSelected.length; i++) {
      _isSelected[i] = (i == index);
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Stack(
        children: [
          _widgetOptions.elementAt(_selectedIndex), // Removed Expanded widget here
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 64,
                width: MediaQuery.of(context).size.width,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.10999999940395355),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x2B171717),
                      blurRadius: 15,
                      offset: Offset(0, 4),
                      spreadRadius: -6,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      _widgetOptions.length,
                          (index) =>_buildNavBarItem(index),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavBarItem(int index) {
    return GestureDetector(
      onTap: () {
        _onItemTapped(index);
      },
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: Column(


            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 30),
                  child: Container(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 20),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: _getIconData(index),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 12,
                          left: 7,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: _isSelected[index] ? Colors.red : Colors.transparent, // Change color to red if selected
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getIconData(int index) {
    bool isSelected = _isSelected[index];
    Color iconColor = isSelected ? Colors.red : Colors.grey; // Change color to green if selected

    switch (index) {
      case 0:
        return _buildIcon(isSelected ?'assets/dashboard/img_1.png':'assets/dashboard/img.png', iconColor);
      case 1:
        return _buildIcon(isSelected ?'assets/dashboard/icon_bag1.png':'assets/dashboard/icon_bag.png', iconColor);
        // return Expanded(child: _buildIcon(isSelected ?'assets/dashboard/icon_bag1.png':'assets/dashboard/icon_bag.png', iconColor));

      // case 2:
      //   return _buildIcon('assets/dashboard/icon.png', iconColor);
      // case 2:
      //   return _buildIcon('assets/dashboard/icon_shop.png', iconColor);

      case 2:
        return _buildIcon('assets/dashboard/icon_profile.png', iconColor);
      default:
        return Container(); // Return a placeholder if index is out of bounds
    }
  }

  Widget _buildIcon(String imagePath, Color iconColor) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
      child: Image.asset(imagePath),
    );
  }

}
