import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatasetCustom {
  final IconData iconData;
  final String title;
  final Function() onUpvote;
  final Function() onDownvote;
  bool isDownvoted;
  int voteCount;
  bool isUpvoted;
  final String date;

  DatasetCustom({
    required this.iconData,
    required this.title,
    required this.onUpvote,
    this.isDownvoted = false,
    this.voteCount = 100,
    this.isUpvoted = false,
    required this.onDownvote,
    required this.date,
  });
}

class DatasetCustomCard extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function() onUpvote;
  final Function() onDownvote;
  bool isDownvoted;
  int voteCount;
  bool isUpvoted;
  final String date;
  DatasetCustomCard({
    required this.iconData,
    required this.title,
    required this.onUpvote,
    required this.onDownvote,
    required this.date,
    this.isDownvoted = false,
    this.voteCount = 100,
    this.isUpvoted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              iconData,
              color: Colors.blue,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(
                  isUpvoted
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_upward_outlined,
                  color: isUpvoted ? Colors.green : Colors.grey,
                ),
                onPressed: onUpvote(),
              ),
              Text(
                voteCount.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              IconButton(
                  icon: Icon(
                    isDownvoted
                        ? Icons.arrow_downward_rounded
                        : Icons.arrow_downward_outlined,
                    color: isDownvoted ? Colors.red : Colors.grey,
                  ),
                  onPressed: onDownvote()),
            ],
          ),
        ],
      ),
    );
  }
}
