import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:data_shelf/dataset/screens/components/page_title_text.dart';
import 'package:data_shelf/home/screens/components/container_with_border.dart';
import 'package:data_shelf/home/screens/components/subtitle_text.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../contribution/screen/components/collapsible_text.dart';

class DatasetDetailsScreen extends StatelessWidget {
  final DatasetModel dataset;
  const DatasetDetailsScreen({super.key, required this.dataset});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Dataset Details',
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitleText(
                  text: '${dataset.title}',
                  verticalPadding: 8,
                ),
                Text(
                  '${dataset.user.username}',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10),
                SubTitleText(text: 'Details'),

                // CollapsibleText(
                //   content:
                //       'Image bounding box dataset to detect faces in images. Faces in images marked with bounding boxes. Have around 500 images with around 1100 faces manually tagged via bounding box.',
                // ),
                CollapsibleText(content: '${dataset.description}'),
              ],
            ),
            SizedBox(height: size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          left:
                              BorderSide(width: 3, color: primaryColorLight))),
                  width: size.width * 0.8,
                  child: Card(
                    elevation: 0.0,
                    // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Data Type: ${dataset.datatype}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Data Size: ${dataset.size / 1000000} MB',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                              dataset.createdAt != null
                                  ? 'Uploaded on: ${dataset.createdAt}'
                                  : "Uploaded on: Jun 14",
                              style: TextStyle(fontSize: 16.0)),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // RoundedButton(
            //   text: 'Download',
            //   press: () {},
            //   size: size,
            //   widthRatio: 0.9,
            // )
            // GestureDetector(
            //   onTap: () {},
            //   child: containerWithBorder(
            //     color: primaryColor,
            //     width: size.width * 0.9,
            //     height: 40,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           Icons.download,
            //           color: Colors.white,
            //         ),
            //         Text(
            //           'Download',
            //           style: TextStyle(color: Colors.white),
            //         )
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
