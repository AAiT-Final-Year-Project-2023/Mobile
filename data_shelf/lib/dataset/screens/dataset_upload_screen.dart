import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../home/screens/components/container_with_border.dart';

class DatasetUploadScreen extends StatefulWidget {
  const DatasetUploadScreen({super.key});

  @override
  State<DatasetUploadScreen> createState() => _DatasetUploadScreenState();
}

class _DatasetUploadScreenState extends State<DatasetUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedFilePath = '';
  var _title_controller = TextEditingController();
  var _description_controller = TextEditingController();
  var _labels = [];
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
        child: uploadFrom(size, context),
      ),
    );
  }

  Form uploadFrom(Size size, BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
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
            SizedBox(height: 16.0),
            Text(
                _selectedFilePath != ''
                    ? 'Selected File: $_selectedFilePath'
                    : "Selected File: No selected file",
                style: TextStyle(
                  fontSize: 16.0,
                  color: _selectedFilePath != ''
                      ? Colors.green.shade400
                      : Colors.red.shade400,
                )),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _title_controller,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title cannot be empty.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _description_controller,
              onChanged: (value) {},
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description cannot be empty.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {},
              onSaved: (value) => _labels =
                  value!.split(',').map((label) => label.trim()).toList(),
              decoration: InputDecoration(
                labelText: 'Labels',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Labels cannot be empty.';
                }
                return null;
              },
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
                  if (_formKey.currentState!.validate()) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text:
                          'Thank you for your contribution! Your dataset is in review.',
                    );
                    // Handle the file upload with the additional information
                    // _selectedFilePath, _title, _description, _selectedDataType
                  }
                }),
          ],
        ),
      ),
    );
  }
}
