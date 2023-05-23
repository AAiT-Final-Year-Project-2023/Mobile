import 'package:data_shelf/contribution/models/contribution.dart';
import 'package:flutter/material.dart';

class ContributionDetailCard extends StatelessWidget {
  final Contribution contribution;
  final VoidCallback onContributeTap;

  ContributionDetailCard({
    required this.contribution,
    required this.onContributeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [],
      ),
    );
  }
}
