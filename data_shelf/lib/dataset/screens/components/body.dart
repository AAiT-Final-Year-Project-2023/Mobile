import 'package:data_shelf/dataset/bloc/load_dataset/dataset_bloc.dart';
import 'package:data_shelf/dataset/bloc/load_dataset/dataset_event.dart';
import 'package:data_shelf/dataset/data_provider/dataset_data_provider.dart';
import 'package:data_shelf/dataset/models/dataset_model.dart';
import 'package:data_shelf/dataset/repository/dataset_repository.dart';
import 'package:data_shelf/dataset/screens/dataset_upload_screen.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/contribution/screen/components/body.dart';
import 'package:data_shelf/dataset/screens/components/page_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../auth/screens/welcome/components/rounded_button.dart';
import '../../bloc/load_dataset/dataset_state.dart';

enum VoteStatus { none, upvoted, downvoted }

class DataItem {
  final String title;
  final String author;
  final String time;
  final String fileType;
  final String fileSize;
  final int voteCount;
  VoteStatus voteStatus;

  DataItem({
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
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
    title: 'Title 2',
    author: 'Author 2',
    time: '5 hr ago',
    fileType: 'Text',
    fileSize: '1 KB',
    voteCount: 5,
    voteStatus: VoteStatus.upvoted,
  ),
  DataItem(
    title: 'Goodreads data for Recommendation Systems',
    author: 'John Doe',
    time: '11 hr ago',
    fileType: 'Image',
    fileSize: '4 MB',
    voteCount: 10,
    voteStatus: VoteStatus.none,
  ),
  DataItem(
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

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final DatasetBloc datasetBloc = DatasetBloc(DatasetRepository(
      datasetDataProvider: DatasetDataProvider(httpClient: http.Client())));

  @override
  void initState() {
    datasetBloc.add(LoadDatasetEvent());
    debugPrint("[UI] Dataset Loading");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => datasetBloc,
      child: Padding(
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
                  size: size,
                  widthRatio: 0.9,
                  text: "+ Upload ",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DatasetUploadScreen(),
                      ),
                    );
                  }),
            ),
            BlocBuilder<DatasetBloc, DatasetState>(
              builder: (context, state) {
                if (state is LoadDatasetInitial) {
                  print("[Dataset UI]Initial");
                  return Center(child: CircularProgressIndicator());
                } else if (state is DatasetLoaded) {
                  var datasets = state.datasetModel;
                  debugPrint("[UI Builder]");
                  print(datasets);
                  return Container(child: datasetListView2(size, datasets));
                } else if (state is LoadDatasetError) {
                  return Center(
                    child: Container(
                      child: Text(state.errorMessage),
                    ),
                  );
                }
                // return Container(
                //   child: datasetListView(size),
                // );
                return Container(
                  child: Text("Check your connection"),
                );
              },
            ),
          ],
        ),
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
                      color: Colors.blueGrey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                child: ListTile(
                  // leading: IconButton(
                  //   icon: Icon(
                  //     Icons.download,
                  //   ),
                  //   onPressed: () {
                  //     // TODO: Handle upvote
                  //   },
                  // ),

                  title: Row(
                    children: [
                      SizedBox(
                        width: s.width * 0.7,
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
                            SizedBox(width: s.width * 0.05),
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
                    child: IconButton(
                      icon: Icon(
                        Icons.download,
                      ),
                      onPressed: () {
                        // TODO: Handle upvote
                      },
                    ),
                  ),
                ),
              );
            }));
  }

  Expanded datasetListView2(Size s, List<DatasetModel> dataset) {
    return Expanded(
        child: ListView.builder(
            itemCount: dataset.length,
            itemBuilder: (context, index) {
              final item = dataset[index];
              return Container(
                padding: EdgeInsets.only(bottom: s.height * 0.025),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blueGrey, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                ),
                child: ListTile(
                  // leading: IconButton(
                  //   icon: Icon(
                  //     Icons.download,
                  //   ),
                  //   onPressed: () {
                  //     // TODO: Handle upvote
                  //   },
                  // ),
                  title: Row(
                    children: [
                      SizedBox(
                        width: s.width * 0.7,
                        child: Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: datasetTitle,
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
                            padding: EdgeInsets.all(1),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                                // color: Colors.blue,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: primaryColor)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 13,
                                  color: primaryColor,
                                ),
                                Container(
                                  margin: EdgeInsets.all(3),
                                  child: Text(
                                    item.datatype,
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text('${item.user.username}'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${item.createdAt}'),
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
                              Text(
                                  '${double.parse((item.size / 1000000).toStringAsFixed(2))} MB'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: s.height * 0.005),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            // color: primaryColorLight, // Background color
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(width: 1, color: primaryColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_up_outlined,
                                size: 40,
                              ),
                              onPressed: () {
                                // TODO: Handle upvote button tap
                              },
                            ),
                            // SizedBox(width: s.width * 0.05),
                            Text(
                              ((item.upvotedBy).length -
                                      (item.upvotedBy).length)
                                  .toString(),
                              style: TextStyle(fontSize: 15),
                            ),
                            // SizedBox(width: 8),
                            IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                size: 40,
                              ),
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
                    child: IconButton(
                      icon: Icon(
                        Icons.download,
                      ),
                      onPressed: () {
                        // TODO: Handle upvote
                      },
                    ),
                  ),
                ),
              );
            }));
  }
}
