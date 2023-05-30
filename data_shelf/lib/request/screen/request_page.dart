import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class LabelFormModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController detailController = TextEditingController();
}

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _labelCountController = TextEditingController();
  String _selectedDataType = 'Image';
  final TextEditingController _guidelinesController = TextEditingController();
  final TextEditingController _dataSizeController = TextEditingController();

  final List<LabelFormModel> _labelForms = [];

  String _selectedPaymentPlan = 'Free';
  final Map<String, String> paymentPlanDescriptions = {
    'Free': 'The Free plan provides basic features with limited usage.',
    'Basic':
        'The Basic plan offers additional features and higher usage limits.',
    'Premium':
        'The Premium plan provides advanced features and unlimited usage.',
  };
  void _createRequest() {
    if (_formKey.currentState!.validate()) {
      // Perform request creation logic here

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Request Created'),
            content: Text('Your request has been successfully created.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _labelCountController.dispose();
    for (var labelForm in _labelForms) {
      labelForm.nameController.dispose();
      labelForm.detailController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Create Request',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primaryColor, primaryColorLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedDataType,
                decoration: InputDecoration(labelText: 'Data Type'),
                items: ['Image', 'Text', 'Audio', 'Video'].map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedDataType = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _guidelinesController,
                decoration: InputDecoration(labelText: 'Guidelines'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter guidelines';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _dataSizeController,
                decoration: InputDecoration(labelText: 'Total Data Size'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter total data size';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _labelCountController,
                decoration: InputDecoration(labelText: 'Number of Labels'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of labels';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    final count = int.parse(value);
                    _labelForms.clear();
                    for (var i = 0; i < count; i++) {
                      _labelForms.add(LabelFormModel());
                    }
                  });
                },
              ),
              SizedBox(height: 16.0),
              ..._labelForms.map((labelForm) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: labelForm.nameController,
                      decoration: InputDecoration(labelText: 'Label Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a label name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 8.0),
                    TextFormField(
                      controller: labelForm.detailController,
                      decoration: InputDecoration(labelText: 'Label Detail'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a label detail';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                  ],
                );
              }).toList(),
              DropdownButtonFormField<String>(
                value: _selectedPaymentPlan,
                decoration: InputDecoration(labelText: 'Payment Plan'),
                items: paymentPlanDescriptions.keys.map((plan) {
                  return DropdownMenuItem<String>(
                    value: plan,
                    child: Row(
                      children: [
                        Text(plan),
                        SizedBox(width: 8.0),
                        Tooltip(
                          message: paymentPlanDescriptions[plan]!,
                          child: Icon(Icons.info),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentPlan = value!;
                  });
                },
              ),
              SizedBox(height: 16.0),
              RoundedButton(
                size: size,
                widthRatio: 0.9,
                color: primaryColorLight,
                // textColor: primaryColor,
                press: _createRequest,
                text: 'Submit',
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class RequestPage extends StatefulWidget {
//   @override
//   _RequestPageState createState() => _RequestPageState();
// }

// class _RequestPageState extends State<RequestPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _labelCountController = TextEditingController();
//   final TextEditingController _dataCountController = TextEditingController();
//   String _selectedDataType = 'Image';
//   final TextEditingController _guidelinesController = TextEditingController();
//   final TextEditingController _dataSizeController = TextEditingController();

//   String _selectedPaymentPlan = 'Free';

//   void _createRequest() {
//     if (_formKey.currentState!.validate()) {
//       // Perform request creation logic here

//       // Show confirmation dialog
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Request Created'),
//             content: Text('Your request has been successfully created.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Request'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               TextFormField(
//                 controller: _titleController,
//                 decoration: InputDecoration(labelText: 'Title'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a title';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _labelCountController,
//                 decoration: InputDecoration(labelText: 'Number of Labels'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the number of labels';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _dataCountController,
//                 decoration: InputDecoration(labelText: 'Number of Data'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the number of data';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               DropdownButtonFormField<String>(
//                 value: _selectedDataType,
//                 decoration: InputDecoration(labelText: 'Data Type'),
//                 items: ['Image', 'Text', 'Audio', 'Video'].map((type) {
//                   return DropdownMenuItem<String>(
//                     value: type,
//                     child: Text(type),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedDataType = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _guidelinesController,
//                 decoration: InputDecoration(labelText: 'Guidelines'),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter guidelines';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _dataSizeController,
//                 decoration: InputDecoration(labelText: 'Total Data Size'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter total data size';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               DropdownButtonFormField<String>(
//                 value: _selectedPaymentPlan,
//                 decoration: InputDecoration(labelText: 'Payment Plan'),
//                 items: ['Free', 'Basic', 'Pro'].map((plan) {
//                   return DropdownMenuItem<String>(
//                     value: plan,
//                     child: Text(plan),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     _selectedPaymentPlan = value!;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _createRequest,
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class LabelFormModel {
//   String name = '';
//   String detail = '';
// }

// class LabelForm extends StatelessWidget {
//   final LabelFormModel labelForm;

//   LabelForm(this.labelForm);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Label ${labelForm.name}'),
//         TextFormField(
//           decoration: InputDecoration(labelText: 'Name'),
//           onChanged: (value) {
//             labelForm.name = value;
//           },
//         ),
//         TextFormField(
//           decoration: InputDecoration(labelText: 'Detail'),
//           onChanged: (value) {
//             labelForm.detail = value;
//           },
//         ),
//         SizedBox(height: 16.0),
//       ],
//     );
//   }
// }
