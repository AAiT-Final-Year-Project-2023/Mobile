import 'dart:io';

import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/contribution/data_provider/contribute_image_data_provider.dart';
import 'package:data_shelf/contribution/repository/contribute_image_repository.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:data_shelf/contribution/screen/components/collapsible_text.dart';
import 'package:data_shelf/contribution/screen/components/image_contribution_listview.dart';
import 'package:data_shelf/dataset/screens/components/page_title_text.dart';
import 'package:data_shelf/home/screens/components/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:http/http.dart' as http;

import '../bloc/bloc/contribute_image_bloc.dart';

class ContributionDetailsScreen extends StatefulWidget {
  final String contributionDate;
  final int numberOfContributions;
  final String amountEarned;
  final String contributionType;
  final String requestTitle;
  final String requestBy;
  final String detail;

  ContributionDetailsScreen({
    required this.contributionDate,
    required this.numberOfContributions,
    required this.amountEarned,
    required this.contributionType,
    required this.requestTitle,
    required this.requestBy,
    required this.detail,
  });

  @override
  _ContributionDetailsScreenState createState() =>
      _ContributionDetailsScreenState();
}

class _ContributionDetailsScreenState extends State<ContributionDetailsScreen> {
  late ImagePicker _imagePicker;
  XFile? _selectedImage;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => ContributeImageBloc(
          contributionRepository: ContributionRepository(
              contributionDataProvider:
                  ContributionDataProvider(httpClient: http.Client()))),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Contribution Details',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primaryColor, primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageTitleText(
                    text: '${widget.requestTitle}',
                    verticalPadding: 8,
                  ),
                  Text(
                    'By ${widget.requestBy}',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 10),
                  SubTitleText(text: 'Details'),

                  CollapsibleText(
                    content: '${widget.detail}',
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 3, color: primaryColorLight))),
                    width: size.width * 0.4,
                    child: Card(
                      elevation: 0.0,
                      // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Data Type: ${widget.contributionType}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                                'Last Contribution: ${widget.contributionDate}',
                                style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 8.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                width: 3, color: primaryColorLight))),
                    width: size.width * 0.4,
                    child: Card(
                      elevation: 0.0,
                      // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Contributions: ${widget.numberOfContributions}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 8.0),
                            Text('Earned: ${widget.amountEarned}',
                                style: TextStyle(fontSize: 16.0)),
                            SizedBox(height: 8.0),
                            Text('In Progress: 3',
                                style: TextStyle(fontSize: 16.0)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: size.width * 0.4,
                  //   child: Card(
                  //     elevation: 2.0,
                  //     // margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //         crossAxisAlignment: CrossAxisAlignment.stretch,
                  //         children: [
                  //           // Text(
                  //           //   'Contribution Type: ${widget.contributionType}',
                  //           //   style: TextStyle(fontSize: 16.0),
                  //           // ),
                  //           // SizedBox(height: 8.0),
                  //           // Text(
                  //           //     'Last Contribution Date: ${widget.contributionDate}'),
                  //           // SizedBox(height: 8.0),
                  //           Text('Contributions: ${widget.numberOfContributions}',
                  //               style: TextStyle(fontSize: 16.0)),
                  //           SizedBox(height: 8.0),
                  //           Text('Earned: ${widget.amountEarned}',
                  //               style: TextStyle(fontSize: 16.0)),
                  //           SizedBox(height: 8.0),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 16.0),
              RoundedButton(
                size: size,
                widthRatio: 0.9,
                color: primaryColorLight,
                // textColor: primaryColor,
                press: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Wrap(
                          children: [
                            ListTile(
                              leading: Icon(Icons.photo_library),
                              title: Text('Upload from Gallery'),
                              onTap: () {
                                _pickImage(ImageSource.gallery);
                                Navigator.of(context).pop();
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.camera_alt),
                              title: Text('Take a Photo'),
                              onTap: () {
                                _pickImage(ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  // if (_selectedImagePath != "") {
                  //   context.read<ContributeImageBloc>().add(
                  //       UploadImageClickedEvent("", "", "",
                  //           filePath: _selectedImagePath));
                  //   print("image found");
                  // }
                },
                text: 'Conribute',
              ),
              SizedBox(height: 16.0),
              (_selectedImage) != null
                  ? Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.file(
                            File(_selectedImage!.path),
                            height: 200,
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                _selectedImage!.path.toString(),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedImage = null;
                                  });
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedImage = null;
                                  });
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text:
                                        'Thank you for your contribution! Your Image data is in review.',
                                  );
                                },
                                icon: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ))
                          ],
                        )
                      ],
                    )
                  : Container(),

              // Expanded(child: ImageContributionListView()),
            ],
          ),
        ),
      ),
    );
  }
}
