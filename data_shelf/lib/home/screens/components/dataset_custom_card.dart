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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              iconData,
              color: Colors.blue,
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
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
  // Widget build(BuildContext context) {
  //   return Container(
  //       margin: EdgeInsets.symmetric(horizontal: 10.0),
  //       width: MediaQuery.of(context).size.width * 0.8,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(20.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 2,
  //             blurRadius: 5,
  //             offset: Offset(0, 3),
  //           ),
  //         ],
  //       ),
  //       child: Stack(
  //         children: [
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width: 5.0,
  //                 decoration: BoxDecoration(
  //                   color: Colors.blue,
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(20.0),
  //                     bottomLeft: Radius.circular(20.0),
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(width: 10.0),
  //               Expanded(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Text(
  //                           title,
  //                           style: TextStyle(
  //                             fontSize: 18.0,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                           overflow: TextOverflow.ellipsis,
  //                         ),
  //                         Text(
  //                           date,
  //                           style: TextStyle(
  //                             color: Colors.grey,
  //                             fontSize: 14.0,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     SizedBox(height: 10.0),
  //                     Text(
  //                       "text",
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 16.0,
  //                         height: 1.2,
  //                       ),
  //                       maxLines: 2,
  //                       overflow: TextOverflow.ellipsis,
  //                     ),
  //                     SizedBox(height: 10.0),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Icon(
  //                               Icons.new_releases,
  //                               color: Colors.orange,
  //                               size: 20.0,
  //                             ),
  //                             SizedBox(width: 5.0),
  //                             Text(
  //                               'New',
  //                               style: TextStyle(
  //                                 color: Colors.orange,
  //                                 fontSize: 14.0,
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                         Row(
  //                           children: [
  //                             IconButton(
  //                               icon: Icon(
  //                                 isUpvoted
  //                                     ? Icons.arrow_upward_rounded
  //                                     : Icons.arrow_upward_outlined,
  //                                 color: isUpvoted ? Colors.green : Colors.grey,
  //                               ),
  //                               onPressed: onUpvote(),
  //                             ),
  //                             Text(
  //                               voteCount.toString(),
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.bold,
  //                                 fontSize: 16.0,
  //                               ),
  //                             ),
  //                             IconButton(
  //                               icon: Icon(
  //                                 isDownvoted
  //                                     ? Icons.arrow_downward_rounded
  //                                     : Icons.arrow_downward_outlined,
  //                                 color: isDownvoted ? Colors.red : Colors.grey,
  //                               ),
  //                               onPressed: onDownvote(),
  //                             ),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //             top: -10,
  //             left: 0,
  //             child: Container(
  //               width: 20,
  //               height: 20,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: Colors.blue,
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             bottom: -10,
  //             left: 0,
  //             child: Container(
  //               width: 20,
  //               height: 20,
  //               decoration: BoxDecoration(
  //                 shape: BoxShape.circle,
  //                 color: Colors.blue,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ));
  // }
