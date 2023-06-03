import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/request/screen/components/body.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body());
  }
}
