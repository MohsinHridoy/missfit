import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: Column(
        children: [
          Container(
            height: 97,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
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
                  SizedBox(width: MediaQuery.of(context).size.width / 3.4),
                  Text(
                    'Paramètres',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 18,
                      fontFamily: 'Kanit-Medium',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [

                _buildSettingItem(
                  iconPath: "assets/settings/icon_berbel.png",
                  title: "Paramètres d'entraînement" ,
                ),
                SizedBox(height: 20),
                _buildDivider(),
                SizedBox(height: 20),

                _buildSettingItem(
                  iconPath: "assets/settings/icon_scale.png",
                  title: 'Unités de mesure',
                ),
                SizedBox(height: 20),
                _buildDivider(),
                SizedBox(height: 20),

                _buildSettingItem(
                  iconPath: "assets/settings/icon_notifications.png",
                  title: 'Notification',
                ),
                SizedBox(height: 20),
                _buildDivider(),
                SizedBox(height: 20),

                _buildSettingItem(
                  iconPath: "assets/settings/icon_glove.png",
                  title: 'Langue',
                ),
                SizedBox(height: 20),
                _buildDivider(),

                SizedBox(height: 20),

                _buildSettingItem(
                  iconPath: "assets/settings/icons_sound.png",
                  title: 'Des sons',
                ),
                SizedBox(height: 20),
                _buildDivider(),
                // Add more setting items here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({required String iconPath, required String title}) {
    return InkWell(
      onTap: () {
        // Handle tap on setting item
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(iconPath, scale: 1.9),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF334155),
                  fontSize: 16,
                  fontFamily: 'Archivo-Regular',
                  fontWeight: FontWeight.w400,
                  height: 1.09,

                ),
              ),
            ],
          ),
          Image.asset("assets/subscription/icon_right_arrow.png", scale: 1.5),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Color(0xFFE5E7EB),
    );
  }
}
