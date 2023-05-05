import 'package:data_shelf/constants.dart';
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

List<RequestListItem> items = [
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWithIcon(Icon(Icons.timelapse_rounded), "Recents"),
          Container(height: 180, child: listViewRecent()),
          titleWithIcon(Icon(Icons.dataset), "Datasets"),
          Container(height: 115, child: listViewDataset()),
          titleWithIcon(Icon(Icons.query_stats_outlined), "Requests"),
          // listViewRequest()
          Container(height: 300, child: listViewRequest()),
        ],
      ),
    );
    ;
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
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
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
