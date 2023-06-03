import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/dataset/screen/components/page_title_text.dart';
import 'package:data_shelf/home/screens/components/request_list_item.dart';
import 'package:data_shelf/request/screen/request_create_screen.dart';
import 'package:flutter/material.dart';

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
            child: PageTitleText(text: "Requests"),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                  size: size,
                  widthRatio: 0.30,
                  text: "Create",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestCreateScreen(),
                      ),
                    );
                  },
                ),
                RoundedButton(
                    size: size,
                    widthRatio: 0.5,
                    text: "My Requests",
                    press: () {})
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(child: listViewRequest()),
        ],
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
