import 'package:data_shelf/auth/bloc/signup/verify_OTP_bloc.dart';
import 'package:data_shelf/auth/bloc/signup/verify_OTP_event.dart';
import 'package:data_shelf/auth/bloc/signup/verify_OTP_state.dart';
import 'package:data_shelf/auth/repository/auth_repository.dart';
import 'package:data_shelf/auth/screens/login/components/text_field_container.dart';
import 'package:data_shelf/auth/screens/login/login_screen.dart';
import 'package:data_shelf/auth/screens/welcome/components/rounded_button.dart';
import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quickalert/quickalert.dart';

class ConfirmationEmailScreen extends StatefulWidget {
  final String email;
  ConfirmationEmailScreen({required this.email});
  @override
  State<ConfirmationEmailScreen> createState() =>
      _ConfirmationEmailScreenState();
}

class _ConfirmationEmailScreenState extends State<ConfirmationEmailScreen> {
  final TextEditingController otpController = TextEditingController();
  bool showErrorText = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isInputValid = otpController.text.length == 6;
    var height = size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Confirm Email',
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
            child: BlocBuilder<OTPVerificationBloc, OTPVerificationState>(
                bloc: BlocProvider.of<OTPVerificationBloc>(context),
                builder: (context, state) {
                  if (state is OTPVerifyingState) {
                    // Show a loading indicator while verifying OTP
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16.0),
                        Text('Verifying OTP...'),
                      ],
                    );
                  } else if (state is OTPVerifiedState) {
                    // Handle OTP verification success
                    return Column(
                      children: [
                        Icon(Icons.check_circle,
                            color: Colors.green, size: 48.0),
                        SizedBox(height: 16.0),
                        Text('OTP Verified!', style: TextStyle(fontSize: 20.0)),
                      ],
                    );
                  } else if (state is OTPErrorState) {
                    // Handle OTP verification error
                    return Column(
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 48.0),
                        SizedBox(height: 16.0),
                        Text('Verification failed. ${state.errorMessage}',
                            style: TextStyle(fontSize: 20.0)),
                      ],
                    );
                  } else {
                    // Default state, show the OTP input field
                    return SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            emailIcon(size),
                            SizedBox(height: height * 0.05),
                            Text(
                              'Enter the OTP received in your email',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: height * 0.05),
                            TextFieldContainer(
                              child: TextField(
                                controller: otpController,
                                maxLength: 6,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                                decoration: InputDecoration(
                                  labelText: 'OTP',
                                  errorText: showErrorText
                                      ? 'OTP must be 6 digits'
                                      : null,
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(fontSize: 15.0),
                                onChanged: (value) {
                                  setState(() {
                                    showErrorText = value.length < 6;
                                  });
                                },
                              ),
                            ),
                            // OTPInputField(),
                            SizedBox(height: height * 0.02),
                            RoundedButton(
                              text: "Verify OTP",
                              size: size,
                              color: isInputValid ? primaryColor : Colors.grey,
                              press: isInputValid
                                  ? () {
                                      String enteredOTP = otpController.text;

                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.error,
                                          text: enteredOTP);

                                      String enteredOTPBloc =
                                          BlocProvider.of<OTPVerificationBloc>(
                                                  context)
                                              .code;
                                      BlocProvider.of<OTPVerificationBloc>(
                                              context)
                                          .add(OTPEnteredEvent(
                                              enteredOTPBloc, widget.email));
                                      // Perform the OTP verification logic
                                      // Validate and process the OTP as needed
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) {
                                      //       return LoginScreen(); // TODO : VERIFY
                                      //     },
                                      //   ),
                                      // );
                                    }
                                  : () {
                                      null;
                                    },
                            ),

                            RoundedButton(
                              text: "Resend",
                              // border: true, // not currently working
                              color: primaryColorLight,
                              size: size,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen(); // TODO: RESEND
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  ;
                })));
  }

  Widget emailIcon(Size size) {
    return Center(
      child: Container(
        width: 60,
        height: 60,
        margin: EdgeInsets.only(top: size.height * 0.2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            // shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            color: Colors.blue[100],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButton(
            icon: new Icon(
              Icons.email_outlined,
              color: primaryColor,
              size: 30,
            ),
            onPressed: null),
      ),
    );
  }
}

class OTPInputField extends StatefulWidget {
  @override
  _OTPInputFieldState createState() => _OTPInputFieldState();
}

class _OTPInputFieldState extends State<OTPInputField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  late List<String> _otpCode;
  final int _numberOfFields = 6;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(_numberOfFields, (index) => FocusNode());
    _controllers =
        List.generate(_numberOfFields, (index) => TextEditingController());
    _otpCode = List.generate(_numberOfFields, (index) => '');
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onDigitEntered(int index, String value) {
    if (value.isNotEmpty) {
      _otpCode[index] = value;
      if (index < _numberOfFields - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else {
      _otpCode[index] = '';
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _numberOfFields,
        (index) => Container(
          width: 40.0,
          height: 40.0,
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: _controllers[index],
            keyboardType: TextInputType.number,
            maxLength: 1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
            focusNode: _focusNodes[index],
            onChanged: (value) => _onDigitEntered(index, value),
            decoration: InputDecoration(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
























// class ConfirmEmailScreen extends StatelessWidget {
//   final bool reset;
//   const ConfirmEmailScreen({super.key, this.reset = false});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size; // screen size
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           '',
//           style: TextStyle(color: Colors.white),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [primaryColor, primaryColorLight],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     emailIcon(size),
//                   ],
//                 ),
//                 SizedBox(
//                   height: size.height * 0.025,
//                 ),
//                 Center(
//                   child: Text("Check your email",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.025,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     "We have sent email containing OTP to your email address",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.grey[400]),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 Column(
//                   children: [
//                     Center(
//                       child: OTPTextField(
//                         length: 4,
//                         width: size.width,
//                         fieldWidth: 80,
//                         style: TextStyle(fontSize: 17),
//                         textFieldAlignment: MainAxisAlignment.spaceAround,
//                         fieldStyle: FieldStyle.underline,
//                         onCompleted: (pin) {
//                           // print("Completed: " + pin)

//                           pin == '1212' // TODO: Implement code check
//                               ? QuickAlert.show(
//                                   context: context,
//                                   type: QuickAlertType.success,
//                                   text: "Verified!",
//                                   confirmBtnColor: alertBtnColor,
//                                   onConfirmBtnTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return !reset
//                                               ? LoginScreen()
//                                               : PasswordResetScreen();
//                                         },
//                                       ),
//                                     );
//                                   })
//                               : QuickAlert.show(
//                                   context: context,
//                                   type: QuickAlertType.error,
//                                   text: "Verification faild re-enter OTP!",
//                                   confirmBtnColor: alertBtnColor);
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.05,
//                     ),
//                     Center(
//                         child: RoundedButton(
//                       text: "Resend",
//                       size: size,
//                       press: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return LoginScreen(); // TODO: RESEND
//                             },
//                           ),
//                         );
//                       },
//                     )),
//                   ],
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }

//   Container emailIcon(Size size) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       margin: EdgeInsets.only(top: size.height * 0.25),
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//           // shape: BoxShape.circle,
//           border: Border.all(color: Colors.white),
//           color: Colors.blue[100],
//           borderRadius: BorderRadius.all(Radius.circular(10))),
//       child: new IconButton(
//           icon: new Icon(
//             Icons.email_outlined,
//             color: primaryColor,
//             size: 30,
//           ),
//           onPressed: null),
//     );
//   }
// }
