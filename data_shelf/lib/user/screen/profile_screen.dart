import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              child: Text(
                'B',
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bonnief',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Bontu.fufa@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Card(
              child: ListTile(
                leading: Icon(Icons.account_balance),
                title: Text('Bank Information'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Account Number: 3242342313423'),
                    Text('Bank Name: COOP Bank'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.5,
            ),
            RoundedButton(text: "Logout", press: () {}, size: size)
          ],
        ),
      ),
    );
  }
}
