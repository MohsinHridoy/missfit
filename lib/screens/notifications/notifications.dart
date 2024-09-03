import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> notifications = [
    {
      'date': DateTime.now(),
      'message': 'Your order successfully placed. Your Order no #3432314',
      'time': '4:12 PM',
      'seen': false,
    },
    {
      'date': DateTime.now(),
      'message': 'Your payment was received.',
      'time': '3:50 PM',
      'seen': false,
    },
    {
      'date': DateTime.now().subtract(Duration(days: 1)),
      'message': 'Your order has been shipped.',
      'time': '3:00 PM',
      'seen': false,
    },
    {
      'date': DateTime.now().subtract(Duration(days: 1)),
      'message': 'Your order is out for delivery.',
      'time': '2:15 PM',
      'seen': true,
    },
    {
      'date': DateTime.now().subtract(Duration(days: 2)),
      'message': 'Your package was delivered.',
      'time': '1:15 PM',
      'seen': true,
    },
    {
      'date': DateTime.now().subtract(Duration(days: 3)),
      'message': 'Your package was delivered.',
      'time': '1:15 PM',
      'seen': true,
    },
  ];

  List<Map<String, dynamic>> getFilteredNotifications() {
    if (_selectedIndex == 0) {
      // Filter unseen notifications
      return notifications.where((notif) => !notif['seen']).toList();
    } else {
      // Return all notifications
      return notifications;
    }
  }

  String formatDate(DateTime date) {
    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final filteredNotifications = getFilteredNotifications();

    // Group notifications by date
    final Map<String, List<Map<String, dynamic>>> groupedNotifications = {};
    for (var notification in filteredNotifications) {
      final dateKey = formatDate(notification['date']);
      if (!groupedNotifications.containsKey(dateKey)) {
        groupedNotifications[dateKey] = [];
      }
      groupedNotifications[dateKey]!.add(notification);
    }

    return Scaffold(
      body: Container(
        color: const Color(0xFFF6F6F6), // Background color of the body
        width: screenWidth, // Set width to cover the entire screen width
        child: Column(
          children: [
            CustomAppBar(
              title:  'Notification',
              onBackTap: () {
                Navigator.pop(context);
              },
              iconSpacing: 3.5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to start
                children: [
              
                  Padding(
                    padding: const EdgeInsets.only(top: 25, left: 20), // Add left padding to align to start
                    child: Container(
                      width: screenWidth - 40, // Adjust width based on screen width
                      height: 32,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFE5E7EB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                width: (screenWidth - 40) / 2, // Half of the adjusted width
                                height: 32,
                                decoration: ShapeDecoration(
                                  color: _selectedIndex == 0 ? Colors.white : Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Unseen',
                                    style: TextStyle(
                                      color: _selectedIndex == 0 ? const Color(0xFF334155) :  Color(0xFF334155),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.09, // Adjust height to fit better
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                              child: Container(
                                width: (screenWidth - 40) / 2, // Half of the adjusted width
                                height: 32,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                decoration: ShapeDecoration(
                                  color: _selectedIndex == 1 ? Colors.white : Colors.transparent,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    'All',
                                    style: TextStyle(
                                      color: _selectedIndex == 1 ? const Color(0xFF334155) : Color(0xFF334155),
                                      fontSize: 14,
                                      fontFamily: 'Archivo-Medium',
                                      fontWeight: FontWeight.w500,
                                      height: 1.09, // Adjust height to fit better
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 100), //Increase this as per your requirment
                      itemCount: groupedNotifications.length,
                      itemBuilder: (context, index) {
                        final dateKey = groupedNotifications.keys.elementAt(index);
                        final notificationsForDate = groupedNotifications[dateKey]!;
              
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40, left: 20), // Align text to start
                              child: Text(
                                dateKey,
                                style: TextStyle(
                                  color: Color(0xFF334155),
                                  fontSize: 18,
                                  fontFamily: 'Kanit-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0.07,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20,),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: notificationsForDate.map((notification) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: ShapeDecoration(
                                              color: notification['seen']
                                                  ? Colors.transparent
                                                  : const Color(0xFF22C55E),
                                              shape: const OvalBorder(),
                                            ),
                                          ),
                                        ),

                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: screenWidth - 111,
                                              child: Text(
                                              notification['message'],

                                                style: const TextStyle(
                                                  color: Color(0xFF334155),
                                                  fontSize: 14,
                                                  fontFamily: 'Archivo-Medium',
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.6,

                                                ),
                                              ),
                                            ),

                                            Text(
                                              '\nToday at ${notification['time']}',
                                              style: const TextStyle(
                                                color: Color(0xFF66758C),
                                                fontSize: 12,
                                                fontFamily: 'Archivo-Regular',
                                                fontWeight: FontWeight.w400,
                                                height: 1.00,
                                              ),
                                            )
                                          ],
                                        ),



                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}