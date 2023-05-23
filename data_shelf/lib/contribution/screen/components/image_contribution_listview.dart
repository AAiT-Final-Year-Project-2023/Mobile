import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class ImageContribution {
  final String fileName;
  final String fileSize;
  final String date;
  final String status;

  ImageContribution({
    required this.fileName,
    required this.fileSize,
    required this.date,
    required this.status,
  });
}

class ImageContributionListView extends StatelessWidget {
  final List<ImageContribution> contributions = [
    ImageContribution(
      fileName: 'image1.jpg',
      fileSize: '2.3 MB',
      date: 'May 18, 2023',
      status: 'Accepted',
    ),
    ImageContribution(
      fileName: 'image2.jpg',
      fileSize: '1.8 MB',
      date: 'May 20, 2023',
      status: 'Pending',
    ),
    ImageContribution(
      fileName: 'image3.jpg',
      fileSize: '3.1 MB',
      date: 'May 22, 2023',
      status: 'Declined',
    ),
    ImageContribution(
      fileName: 'image1.jpg',
      fileSize: '2.3 MB',
      date: 'May 18, 2023',
      status: 'Accepted',
    ),
    ImageContribution(
      fileName: 'image2.jpg',
      fileSize: '1.8 MB',
      date: 'May 20, 2023',
      status: 'Pending',
    ),
    ImageContribution(
      fileName: 'image3.jpg',
      fileSize: '3.1 MB',
      date: 'May 22, 2023',
      status: 'Declined',
    ),
    // Add more contributions here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contributions.length,
      itemBuilder: (context, index) {
        final contribution = contributions[index];
        return ListTile(
          title: Text(contribution.fileName),
          subtitle: Text(
            'File Size: ${contribution.fileSize}\nDate: ${contribution.date}',
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (contribution.status == 'Pending')
                IconButton(
                  icon: Icon(Icons.delete_forever_outlined),
                  color: Colors.red,
                  onPressed: () {
                    contributions.remove(contribution);
                  },
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _getStatusColor(contribution.status), // Border color
                    width: 1.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(30.0), // Border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    contribution.status,
                    style: TextStyle(
                        color: _getStatusColor(contribution.status),
                        fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    if (status == 'Accepted') {
      return Colors.teal;
    } else if (status == 'Pending') {
      return Colors.blueGrey;
    } else if (status == 'Declined') {
      return Colors.deepOrange;
    } else {
      return Colors.grey;
    }
  }
}
