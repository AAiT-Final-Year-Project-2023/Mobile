import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CollapsibleText extends StatefulWidget {
  final String content;

  CollapsibleText({required this.content});

  @override
  _CollapsibleTextState createState() => _CollapsibleTextState();
}

class _CollapsibleTextState extends State<CollapsibleText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final words = widget.content.split(' ');
    final threeLines = words.take(30).join(' ');

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            !_isExpanded ? threeLines : widget.content,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.justify,
          ),
          if (!_isExpanded)
            InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = true;
                });
              },
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'More',
                  style: TextStyle(
                    color: primaryColorLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}




// class CollapsibleText extends StatefulWidget {
//   final String content;

//   CollapsibleText({required this.content});

//   @override
//   _CollapsibleTextState createState() => _CollapsibleTextState();
// }

// class _CollapsibleTextState extends State<CollapsibleText> {
//   bool _isExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionPanelList(
//       elevation: 1,
//       expandedHeaderPadding: EdgeInsets.all(0),
//       expansionCallback: (int index, bool isExpanded) {
//         setState(() {
//           _isExpanded = !isExpanded;
//         });
//       },
//       children: [
//         ExpansionPanel(
//           headerBuilder: (BuildContext context, bool isExpanded) => Container(),
//           body: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             child: Text(
//               widget.content,
//               style: TextStyle(fontSize: 14),
//             ),
//           ),
//           isExpanded: _isExpanded,
//         ),
//       ],
//     );
//   }
// }
