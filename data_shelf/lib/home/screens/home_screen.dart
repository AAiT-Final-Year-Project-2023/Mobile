import 'package:data_shelf/constants.dart';
import 'package:data_shelf/contribution/screen/contribution_screen.dart';
import 'package:data_shelf/dataset/screen/dataset_screen.dart';
import 'package:data_shelf/home/screens/components/app_bar_with_search.dart';
import 'package:data_shelf/home/screens/components/body.dart';
import 'package:data_shelf/request/screen/request_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Body(),
    DatasetScreen(),
    RequestScreen(),
    ContributionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearch(
        searchPress: () {},
        searchBarController: TextEditingController(),
        profilePress: () {},
        firstName: "Bon",
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              // rippleColor: Colors.grey[300]!,
              rippleColor: primaryColorLight,
              // hoverColor: Colors.grey[100]!,
              hoverColor: Colors.blue[100]!,
              gap: 8,
              activeColor: primaryColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue[100]!,
              color: primaryColor,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.dataset,
                  text: 'Dataset',
                ),
                GButton(
                  icon: Icons.ballot_sharp,
                  text: 'Request',
                ),
                GButton(
                  icon: Icons.addchart,
                  text: 'Contribution',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
