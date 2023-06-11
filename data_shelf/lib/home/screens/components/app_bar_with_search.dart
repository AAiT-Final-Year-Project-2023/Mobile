import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class AppBarWithSearch extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWithSearch({
    super.key,
    required this.searchBarController,
    required this.firstName,
    required this.searchPress,
    required this.profilePress,
  });

  final TextEditingController searchBarController;
  final String firstName;
  final VoidCallback searchPress;
  final VoidCallback profilePress;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.0),
        child: Image.asset(
          "assets/images/logo.png",
          height: 60,
          width: 50,
        ),
      ),
      title: Container(
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            colors: [primaryColor, primaryColorLight],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              controller: searchBarController,
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 13.0),
              ),
            ),
          ),
          IconButton(
            onPressed: searchPress,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ]),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_active_outlined),
          color: primaryColor,
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            backgroundColor: primaryColor,
            child: Center(
              child: Text(
                firstName.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
