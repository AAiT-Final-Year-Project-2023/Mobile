import 'dart:math';

import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/home/screens/components/dataset_custom_card.dart';
import 'package:data_shelf/home/screens/components/recent_activity_card.dart';
import 'package:data_shelf/home/screens/components/request_list_item.dart';
import 'package:flutter/material.dart';

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

class Body extends StatelessWidget {
  const Body({super.key});
  final String _requests = '0';
  final String _contributions = '0';
  final String _totalEarnings = '0';
  final String _currentBalance = '0';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWithIcon(Icon(Icons.speaker_notes_outlined), "Your Info"),
          // Container(height: 180, child: listViewRecent()),
          // Section 1: Card with Bullet Points
          Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint('$_requests Requests'),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        _buildBulletPoint('$_contributions Contributions'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBulletPoint('$_totalEarnings Total Earnings'),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        _buildBulletPoint('$_currentBalance Current Balance'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          titleWithIcon(Icon(Icons.dataset), "Datasets"),
          Container(height: 115, child: listViewDataset()),
          titleWithIcon(Icon(Icons.query_stats_outlined), "Requests"),
          // listViewRequest()
          new Expanded(child: listViewRequest()),
        ],
      ),
    );
    ;
  }

  Widget _buildBulletPoint(String text) {
    final List<Color> bulletColors = [
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.red
    ];
    final random = Random();
    final color = bulletColors[random.nextInt(bulletColors.length)];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8.0),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(text, style: titleStyleSmallDark),
        ),
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
