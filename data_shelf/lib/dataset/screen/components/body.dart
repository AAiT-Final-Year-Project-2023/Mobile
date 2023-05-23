import 'package:data_shelf/constants.dart';
import 'package:data_shelf/contribution/screen/components/body.dart';
import 'package:data_shelf/dataset/screen/components/page_title_text.dart';
import 'package:flutter/material.dart';

import '../../../auth/screens/welcome/components/rounded_button.dart';

enum VoteStatus { none, upvoted, downvoted }

class DataItem {
  final String imageURL;
  final String title;
  final String author;
  final String time;
  final String fileType;
  final String fileSize;
  final int voteCount;
  VoteStatus voteStatus;

  DataItem({
    required this.imageURL,
    required this.title,
    required this.author,
    required this.time,
    required this.fileType,
    required this.fileSize,
    required this.voteCount,
    this.voteStatus = VoteStatus.none,
  });
}

final List<DataItem> _dataList = [
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    imageURL: 'https://picsum.photos/id/1018/400',
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  // Add more data items as needed
];

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
            child: PageTitleText(text: "Datasets"),
          ),
          FilterBar(),
          Container(
            alignment: Alignment.center,
            child: RoundedButton(
                size: size, widthRatio: 0.9, text: "+ Upload", press: () {}),
          ),
          Container(
            child: datasetListView(size),
          ),
        ],
      ),
    );
  }

  Expanded datasetListView(Size s) {
    return Expanded(
        child: ListView.builder(
            itemCount: _dataList.length,
            itemBuilder: (context, index) {
              final item = _dataList[index];
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                child: ListTile(
                  leading: Image.network(
                    item.imageURL,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Row(
                    children: [
                      SizedBox(
                        width: s.width * 0.5,
                        child: Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Icon(Icons.download_sharp)
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(3),
                              child: Text(
                                "Audio",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ),
                          Text('${item.author}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item.time}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.filter_drama_outlined,
                                size: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('${item.fileSize}'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.grey[200], // Background color
                          borderRadius:
                              BorderRadius.circular(29), // Border radius
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_upward),
                              onPressed: () {
                                // TODO: Handle upvote button tap
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              item.voteCount.toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(width: 8),
                            IconButton(
                              icon: Icon(Icons.arrow_downward),
                              onPressed: () {
                                // TODO: Handle downvote button tap
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  trailing: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.download,
                          ),
                          onPressed: () {
                            // TODO: Handle upvote
                          },
                        ),
                        // Text('${item.fileSize}'),

                        // IconButton(
                        //   icon: Icon(Icons.thumb_down),
                        //   onPressed: () {
                        //     // TODO: Handle downvote
                        //   },
                        // ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
