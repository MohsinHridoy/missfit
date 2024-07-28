import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Define the filter state
  String _selectedFilter = 'All';

  // Define all notifications with dates and status
  final List<Map<String, String>> allNotifications = [
    {"title": "Order Placed", "message": "Your order successfully placed. Your Order no #3432314", "status": "unseen", "date": "2024-07-27"},
    {"title": "Order Placed", "message": "Your order successfully placed. Your Order no #3432315", "status": "seen", "date": "2024-07-26"},
    {"title": "Order Out for Delivery", "message": "Your order is out for delivery. Your Order no #3432316", "status": "unseen", "date": "2024-07-26"},
  ];

  // Method to filter notifications based on the selected filter
  List<Map<String, String>> get filteredNotifications {
    if (_selectedFilter == 'Unseen') {
      return allNotifications
          .where((notification) => notification['status'] == 'unseen')
          .toList();
    }
    return allNotifications;
  }

  // Method to handle filter change
  void _setFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterRow(
              selectedFilter: _selectedFilter,
              onFilterChanged: _setFilter,
            ),
            SizedBox(height: 16),
            Expanded(
              child: NotificationsList(
                notifications: filteredNotifications,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterRow extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  FilterRow({required this.selectedFilter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onFilterChanged('Unseen'),
          child: Container(
            width: 150, // Adjusted width to fit screen
            height: 32,
            decoration: ShapeDecoration(
              color: selectedFilter == 'Unseen' ? Colors.blue : Color(0xFFE5E7EB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                'Unseen',
                style: TextStyle(
                  color: selectedFilter == 'Unseen' ? Colors.white : Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w500,
                  height: 1.2, // Adjusted for better text alignment
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.84),
        GestureDetector(
          onTap: () => onFilterChanged('All'),
          child: Container(
            width: 150, // Adjusted width to fit screen
            height: 32,
            decoration: ShapeDecoration(
              color: selectedFilter == 'All' ? Colors.blue : Color(0xFFE5E7EB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                'All',
                style: TextStyle(
                  color: selectedFilter == 'All' ? Colors.white : Color(0xFF334155),
                  fontSize: 14,
                  fontFamily: 'Archivo',
                  fontWeight: FontWeight.w500,
                  height: 1.2, // Adjusted for better text alignment
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationsList extends StatelessWidget {
  final List<Map<String, String>> notifications;

  NotificationsList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    final todayDate = DateTime.now().toLocal().toString().split(' ')[0];
    final yesterdayDate = DateTime.now().subtract(Duration(days: 1)).toLocal().toString().split(' ')[0];

    // Group notifications by date
    final Map<String, List<Map<String, String>>> groupedNotifications = {};
    for (var notification in notifications) {
      final date = notification['date']!;
      if (!groupedNotifications.containsKey(date)) {
        groupedNotifications[date] = [];
      }
      groupedNotifications[date]!.add(notification);
    }

    // Prepare sorted dates and their labels
    final sortedDates = groupedNotifications.keys.toList();
    sortedDates.sort((a, b) => a.compareTo(b));

    return ListView.builder(
      itemCount: sortedDates.length,
      itemBuilder: (context, index) {
        final date = sortedDates[index];
        final notificationsForDate = groupedNotifications[date]!;

        // Determine the section label based on the date
        final sectionLabel = date == todayDate
            ? 'Today'
            : date == yesterdayDate
            ? 'Yesterday'
            : 'Earlier';

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            color: Colors.white, // Background color for each date group
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sectionLabel,
                  style: TextStyle(
                    color: Color(0xFF334155),
                    fontSize: 16,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                ...notificationsForDate.map((notification) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notification['title']!,
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          notification['message']!,
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 14,
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}