import 'package:data_shelf/contribution/models/contribution.dart';
import 'package:flutter/material.dart';

class ContributionCard extends StatelessWidget {
  final Contribution contribution;
  final VoidCallback onTap;

  ContributionCard({
    required this.contribution,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        onTap: onTap,
        title: Text(
          'Request: ${contribution.requestTitle}',
          style: TextStyle(fontSize: 16.0),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text('Data Type: ${contribution.contributionType}'),
            SizedBox(height: 8.0),
            Text('Last Contribution Date: ${contribution.contributionDate}'),
            SizedBox(height: 4.0),
            Text(
                'Number of Contributions: ${contribution.numberOfContributions}'),
            SizedBox(height: 4.0),
            Text('Amount Earned: ${contribution.amountEarned}'),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
