import 'package:data_shelf/constants.dart';
import 'package:data_shelf/home/screens/components/app_bar_with_search.dart';
import 'package:flutter/material.dart';

class DatasetScreen extends StatelessWidget {
  const DatasetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Dataset',
        style: titleStyle,
      ),
    );
  }
}