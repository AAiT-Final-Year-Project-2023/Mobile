import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onNotificationClicked(context, index);
            },
            child: _buildNotificationCard(
              title: 'Notification $index',
              message: 'This is notification message $index',
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 1.0,
            indent: 16.0,
            endIndent: 16.0,
          );
        },
        itemCount: 5,
      ),
    );
  }

  void _onNotificationClicked(BuildContext context, int index) {
    // Handle notification click here
    print('Clicked on notification $index');
    // You can navigate to another screen or perform any desired action
  }

  Widget _buildNotificationCard(
      {required String title, required String message}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(message),
        ],
      ),
    );
  }
}
