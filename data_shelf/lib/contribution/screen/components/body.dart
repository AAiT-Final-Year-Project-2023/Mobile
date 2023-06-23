import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/contribution/models/contribution.dart';
import 'package:data_shelf/contribution/screen/components/contribution_card.dart';
import 'package:data_shelf/contribution/screen/contribution_detail_screen.dart';
import 'package:data_shelf/dataset/screens/components/page_title_text.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
          child: PageTitleText(text: "Contributions"),
        ),
        FilterBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 1, // Replace with the actual number of contributions
            itemBuilder: (context, index) {
              return ContributionCard(
                contribution: Contribution(
                    requestTitle: 'Amharic handwritten characters',
                    contributionDate:
                        'June 15, 2023', // Replace with actual contribution date
                    numberOfContributions:
                        5, // Replace with actual number of contributions
                    amountEarned: '00.00', // Replace with actual amount earned
                    contributionType: 'Image',
                    detail:
                        "We are seeking high-quality images of Amharic handwritten characters for our dataset. The images should clearly capture the intricate details of the characters and be of high resolution, allowing for accurate analysis and recognition. It is essential that the handwriting is legible and well-formed to ensure the reliability of the dataset. Please ensure that the images are well-lit and free from shadows or blurriness, as these factors can affect the quality and usability of the dataset."),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContributionDetailsScreen(
                        contributionDate: 'June 15, 2023',
                        numberOfContributions: 5,
                        amountEarned: '00.00',
                        contributionType: 'Image',
                        detail:
                            "We are seeking high-quality images of Alfalfa root crowns for our dataset. The pictures should be clear, well-detailed, and captured in high resolution, allowing for close examination of the root crowns. Please ensure consistent lighting conditions throughout the images to maintain uniformity in the dataset. In terms of types, we require a diverse collection that represents different qualities and stages of growth. Capture images of healthy root crowns displaying signs of vitality and robustness. Include a variety of growth stages, ranging from young and tender root crowns to mature and well-established ones. It is crucial to showcase Alfalfa root crowns from various soil conditions, such as sandy, loamy, and clayey soils. This will account for the variations in growth patterns that occur due to different soil types. By following these guidelines, we aim to create a comprehensive dataset that encompasses the range of qualities and types of Alfalfa root crowns, enabling further research and analysis in the field.",
                        requestTitle: 'Amharic handwritten characters',
                        requestBy: 'Adam Hassen',

                        // Pass additional details if needed
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ]),
    );
  }
}

// Just Incase needed Dropdown filters

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String selectedType = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      // color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterChip(
            label: Text('All'),
            selected: selectedType == 'All',
            onSelected: (bool selected) {
              setState(() {
                selectedType = 'All';
              });
            },
          ),
          SizedBox(width: 8.0),
          FilterChip(
            label: Text('Image'),
            selected: selectedType == 'Image',
            onSelected: (bool selected) {
              setState(() {
                selectedType = 'Image';
              });
            },
          ),
          SizedBox(width: 8.0),
          FilterChip(
            label: Text('Text'),
            selected: selectedType == 'Text',
            onSelected: (bool selected) {
              setState(() {
                selectedType = 'Text';
              });
            },
          ),
          SizedBox(width: 8.0),

          FilterChip(
            label: Text('Video'),
            selected: selectedType == 'Video',
            onSelected: (bool selected) {
              setState(() {
                selectedType = 'Video';
              });
            },
          ),
          SizedBox(width: 8.0),

          FilterChip(
            label: Text('Audio'),
            selected: selectedType == 'Audio',
            onSelected: (bool selected) {
              setState(() {
                selectedType = 'Audio';
              });
            },
          ),
          // SizedBox(height: 4.0),
          // // Text('Number of Contributions: $numberOfContributions'),
          // SizedBox(height: 4.0),
          // // Text('Amount Earned: $amountEarned'),
          // SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class MyFilterWidget extends StatefulWidget {
  @override
  _MyFilterWidgetState createState() => _MyFilterWidgetState();
}

class _MyFilterWidgetState extends State<MyFilterWidget> {
  String _selectedOption = 'All'; // Default selected option
  final filterItems = <String>[
    'All',
    'My Dataset',
    'My Data Contribution',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: filterDropDown(),
    );
  }

  Container filterDropDown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        // color: Colors.blue,
        border: Border.all(
          color: primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(35),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedOption,
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
            // TODO: Apply filter based on selected option
          },
          // underline:  ,
          icon: Icon(
            Icons.arrow_drop_down_circle,
            color: primaryColorLight,
          ),
          dropdownColor: Colors.blue[100],
          style: TextStyle(color: primaryColor, fontSize: 12),
          itemHeight: 48,
          items: filterItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
