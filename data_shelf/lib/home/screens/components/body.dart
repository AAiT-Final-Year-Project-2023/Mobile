import 'dart:math';

import 'package:data_shelf/home/bloc/user_info_bloc.dart';
import 'package:data_shelf/home/bloc/user_info_state.dart';
import 'package:data_shelf/home/data_provider/user_info_data_provider.dart';
import 'package:data_shelf/home/repository/user_info_repository.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/home/screens/components/dataset_custom_card.dart';
import 'package:data_shelf/home/screens/components/recent_activity_card.dart';
import 'package:data_shelf/home/screens/components/request_list_item.dart';
import 'package:data_shelf/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../bloc/user_info_event.dart';

List<RecentActivity> recentActivities = [
  RecentActivity(
    image: 'https://picsum.photos/id/1018/400',
    name: 'German Trafic sign ',
  ),
  RecentActivity(
    image: 'https://picsum.photos/id/1015/400',
    name: 'Fake news dataset',
  ),
  RecentActivity(
    image: 'https://picsum.photos/id/1016/400',
    name: 'Beach Day',
  ),
  RecentActivity(
    image: 'https://picsum.photos/id/1019/400',
    name: 'City Tour',
  ),
  RecentActivity(
    image: 'https://picsum.photos/id/1020/400',
    name: 'Camping Trip',
  ),
];

List<DatasetCustom> datasetsForDisplay = [
  DatasetCustom(
    iconData: Icons.audio_file,
    title: 'Listen to music',
    onUpvote: () {
      // Handle upvote action
    },
    onDownvote: () {},
    date: "Dec, 2020",
    isDownvoted: false,
    isUpvoted: true,
    voteCount: 100,
  ),
  DatasetCustom(
    iconData: Icons.video_collection_rounded,
    title: 'Book a flight',
    onUpvote: () {
      // Handle upvote action
    },
    onDownvote: () {},
    date: "Dec, 2020",
    isDownvoted: true,
    isUpvoted: false,
    voteCount: 10,
  ),
  DatasetCustom(
    iconData: Icons.text_snippet_outlined,
    title: 'Book a flight',
    onUpvote: () {
      // Handle upvote action
    },
    onDownvote: () {},
    date: "Dec, 2020",
    isDownvoted: true,
    isUpvoted: false,
    voteCount: 90,
  ),
  DatasetCustom(
    iconData: Icons.image,
    title: 'Take a photo',
    onUpvote: () {
      // Handle upvote action
    },
    onDownvote: () {},
    date: "Dec, 2020",
    isDownvoted: false,
    isUpvoted: false,
    voteCount: 100,
  )
];

List<RequestListItem> requestItems = [
  RequestListItem(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada aliquet odio ut malesuada. Aliquam sed gravida libero. Sed tempus velit nec est ultrices, ut tempor arcu convallis.',
    date: DateTime.now(),
    isNew: true,
    number: 42,
  ),
  RequestListItem(
    text: 'Short text',
    date: DateTime.now(),
    isNew: false,
    number: 99,
  ),
  RequestListItem(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada aliquet odio ut malesuada. Aliquam sed gravida libero. Sed tempus velit nec est ultrices, ut tempor arcu convallis.',
    date: DateTime.now(),
    isNew: true,
    number: 42,
  ),
  RequestListItem(
    text: 'Short text',
    date: DateTime.now(),
    isNew: false,
    number: 99,
  ),
  RequestListItem(
    text:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin malesuada aliquet odio ut malesuada. Aliquam sed gravida libero. Sed tempus velit nec est ultrices, ut tempor arcu convallis.',
    date: DateTime.now(),
    isNew: true,
    number: 42,
  ),
  RequestListItem(
    text: 'Short text',
    date: DateTime.now(),
    isNew: false,
    number: 99,
  ),
  // Add more items here
];

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final String _requests = '1';

  final String _contributions = '1';

  late String _totalEarnings = '1';

  late String _currentBalance = '1';

  final UserInfoBloc uib = UserInfoBloc(UserInfoRepository(
      userInfoDataProvider: UserInfoDataProvider(httpClient: http.Client())));

  @override
  void initState() {
    uib.add(FetchUserInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => uib,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titleWithIcon(Icon(Icons.speaker_notes_outlined), "Your Info"),
            // Container(height: 180, child: listViewRecent()),
            // Section 1: Card with Bullet Points
            BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, state) {
                if (state is UserInfoInitial) {
                  print("[HOME UI]Initial*******************");
                  return Center(child: CircularProgressIndicator());
                } else if (state is UserInfoLoaded) {
                  print("[HOME UI] loaded");

                  var usermodel = state.userModel;
                  print(usermodel);
                  _totalEarnings = usermodel.totalEarnings.toString();
                  _currentBalance = usermodel.currentBalance.toString();
                  return userInfoCard(size);
                } else if (state is UserInfoError) {
                  return Center(
                    child: Container(
                      child: Text(state.errorMessage),
                    ),
                  );
                } else {
                  return Container(
                    child: Text("Check your connection"),
                  );
                }
              },
            ),
            titleWithIcon(Icon(Icons.dataset), "Datasets"),
            Container(height: 115, child: listViewDataset()),
            titleWithIcon(Icon(Icons.query_stats_outlined), "Requests"),
            // listViewRequest()
            new Expanded(child: listViewRequest()),
          ],
        ),
      ),
    );
    ;
  }

  Widget userInfoCard(Size size) {
    final color_1 = Colors.blue;
    final color_2 = Colors.orange;
    return Card(
        child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint('$_requests Requests', color_2),
                SizedBox(
                  height: size.height * 0.02,
                ),
                _buildBulletPoint('$_contributions Contributions', color_1),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint('$_totalEarnings Total Earnings', color_1),
                SizedBox(
                  height: size.height * 0.03,
                ),
                _buildBulletPoint('$_currentBalance Current Balance', color_2),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildBulletPoint(String text, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8.0),
        Center(
          child: Container(
            width: 4.0,
            height: 20.0,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Center(
          child: Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(text, style: titleStyleSmallDark),
            ),
          ),
        ),
        // Expanded(
        //   child: Text(text, style: titleStyleSmallDark),
        // ),
      ],
    );
  }

  Row titleWithIcon(Icon icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            title,
            style: titleStyleMidium,
          ),
        ),
        icon
      ],
    );
  }

  Expanded listViewRecent() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recentActivities.length,
        itemBuilder: (BuildContext context, int index) {
          return RecentActivityCard(
            name: recentActivities[index].name,
            image: recentActivities[index].image,
          );
        },
      ),
    );
  }

  Expanded listViewDataset() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: datasetsForDisplay.length,
        itemBuilder: (BuildContext context, int ind) {
          return DatasetCustomCard(
            iconData: datasetsForDisplay[ind].iconData,
            title: datasetsForDisplay[ind].title,
            onUpvote: datasetsForDisplay[ind].onUpvote,
            onDownvote: datasetsForDisplay[ind].onDownvote,
            date: datasetsForDisplay[ind].date,
            isDownvoted: datasetsForDisplay[ind].isDownvoted,
            isUpvoted: datasetsForDisplay[ind].isUpvoted,
            voteCount: datasetsForDisplay[ind].voteCount,
          );
        },
      ),
    );
  }

  Container listViewRequest() {
    return Container(
      child: ListView.builder(
          itemCount: requestItems.length,
          itemBuilder: (context, index) {
            final item = requestItems[index];
            final shortenedText = item.text.length > 50
                ? item.text.substring(0, 50) + '...'
                : item.text;

            return ListTile(
                title: Text(shortenedText),
                subtitle: Text(item.date.toString()),
                trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (item.isNew)
                        Text('New', style: TextStyle(color: Colors.green)),
                      Text("+" + item.number.toString()),
                    ]));
          }),
    );
  }
}
