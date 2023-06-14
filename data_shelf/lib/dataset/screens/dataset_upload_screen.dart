import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/services.dart';

import '../../home/screens/components/container_with_border.dart';

class DatasetUploadScreen extends StatefulWidget {
  const DatasetUploadScreen({super.key});

  @override
  State<DatasetUploadScreen> createState() => _DatasetUploadScreenState();
}

class _DatasetUploadScreenState extends State<DatasetUploadScreen> {
  String _selectedFilePath = '';
  String _title = '';
  String _description = '';
  String _selectedDataType = 'Image';
  List<String> _dataTypes = ['Image', 'Audio', 'Video', 'Text'];

  Future<void> _openFileExplorer() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        setState(() {
          _selectedFilePath = result.files.single.path!;
        });
      }
    } on PlatformException catch (e) {
      print("Error while picking the file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Upload Dataset',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: _openFileExplorer,
              child: containerWithBorder(
                  width: 200,
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload_rounded, color: primaryColor),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Click to upload"),
                      ])),
            ),
            // ElevatedButton(
            //   onPressed: _openFileExplorer,
            //   child: Text('Upload'),
            // ),
            SizedBox(height: 16.0),
            Text(
              'Selected File: $_selectedFilePath',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                // Handle labels
              },
              decoration: InputDecoration(
                labelText: 'Labels',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Data type",
                  style: TextStyle(color: Colors.grey[700], fontSize: 15),
                ),
                DropdownButton<String>(
                  value: _selectedDataType,
                  onChanged: (value) {
                    setState(() {
                      _selectedDataType = value!;
                    });
                  },
                  items: _dataTypes.map((String dataType) {
                    return DropdownMenuItem<String>(
                      value: dataType,
                      child: Text(dataType),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            RoundedButton(
              text: "Submit",
              size: size,
              press: () {
                // Handle the file upload with the additional information
                // _selectedFilePath, _title, _description, _selectedDataType
              },
            ),
          ],
        ),
      ),
    );
  }
}
