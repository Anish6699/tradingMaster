import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import '../../utils/colors.dart';

class SignUpOtpVerification extends StatefulWidget {
  final phoneNumber;

  const SignUpOtpVerification({super.key, required this.phoneNumber});

  @override
  State<SignUpOtpVerification> createState() => _SignUpOtpVerificationState();
}

class _SignUpOtpVerificationState extends State<SignUpOtpVerification> {
  String otp = '';
  Timer? countdownTimer;
  var data;
  OtpFieldController otpController = OtpFieldController();

  // Duration myDuration = Duration(seconds: 30);
  int _start = 30;
  bool isTimerOver = false;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    countdownTimer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isTimerOver = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    countdownTimer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  Widget _body() {
    return ListView(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.015,
          ),
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.25,
          child: SvgPicture.asset(
            'assets/images/otp_illustration.svg',
            fit: BoxFit.contain,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'OTP Verification',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height * 0.035,
              color: primaryBlackTextColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Text(
            'SMS sent to ${widget.phoneNumber}',
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontWeight: FontWeight.w500,
              fontSize: MediaQuery.of(context).size.height * 0.018,
              color: primaryBlackTextColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.02,
            // bottom: MediaQuery.of(context).size.height * 0.01,
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04,
          ),
          child: OTPTextField(
            controller: otpController,
            otpFieldStyle: OtpFieldStyle(
              borderColor: primaryLightGreyColor,
              backgroundColor: primaryLightGreyColor,
              focusBorderColor: primaryBlackBorderColor,
            ),
            length: 6,
            width: MediaQuery.of(context).size.width,
            fieldWidth: MediaQuery.of(context).size.height * 0.06,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.box,
            keyboardType: TextInputType.number,
            onChanged: (pin) {
              otp = pin;
              setState(() {});
            },
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
          child: const Text(
            'Change Phone Number?',
            style: TextStyle(
              color: primaryBlueColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: TextButton(
                  onPressed: () {
                    // Get.offAll(() => const UploadDocumentsList());
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryLightGreyColor,
                    foregroundColor: primaryBlackTextColor,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: primaryLightGreyColor),
                    ),
                  ),
                  child: Text(
                    isTimerOver
                        ? 'Resend'
                        : '00:${_start.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                child: TextButton(
                  onPressed: otp.length != 6
                      ? null
                      : () async {
                    // Get.offAll(() => const Register());
                    {
                      // showDialog(
                      //   barrierDismissible: false,
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return FutureBuilder(
                      //       builder: (
                      //           BuildContext context,
                      //           AsyncSnapshot<Map<String, dynamic>>
                      //           snapshot,
                      //           ) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           data = snapshot.data;
                      //           if (data!['common']['status']
                      //               .toString() ==
                      //               "200" ||
                      //               data!['common']['status']
                      //                   .toString() ==
                      //                   "202") {
                      //             print(data);
                      //             print('data');
                      //             Future.delayed(
                      //                 const Duration(seconds: 2),
                      //                     () async {
                      //                   if (data['common']
                      //                   ['employee_exist'] ==
                      //                       true) {
                      //                     var prefs = await SharedPreferences
                      //                         .getInstance();
                      //                     prefs.setBool('isLoggedIn', true);
                      //                     prefs.setString('auth_key',
                      //                         data['employee']['auth_key']);
                      //                     prefs.setString('employee_id',
                      //                         data['employee']['id']);
                      //                     prefs.setString('employeeDetails',
                      //                         json.encode(data['employee']));
                      //
                      //                     print(prefs.getBool('isLoggedIn'));
                      //                     if (data['common']
                      //                     ['employee_verified'] ==
                      //                         true) {
                      //                       Get.offAll(
                      //                               () => const HomeScreen());
                      //                     } else {
                      //                       Get.offAll(() =>
                      //                       const VerificationPending());
                      //                     }
                      //                   } else {
                      //                     // List<Map<String, dynamic>>
                      //                     // availableVehicleTypeList = [];
                      //                     // for (Map<String, dynamic> type
                      //                     // in data['vehicle']) {
                      //                     //   availableVehicleTypeList
                      //                     //       .add(type);
                      //                     // }
                      //
                      //                     Get.offAll(() => Register(
                      //                       otp: otp,
                      //                       mobileNumber:
                      //                       widget.phonenumber,
                      //                     ));
                      //                   }
                      //                 });
                      //
                      //             children = <Widget>[
                      //               const Icon(
                      //                 Icons.check_circle_outline,
                      //                 color: Colors.green,
                      //                 size: 60,
                      //               ),
                      //               const Padding(
                      //                 padding: EdgeInsets.only(top: 16),
                      //                 child: Text(
                      //                   'Login Successfully',
                      //                   style: TextStyle(
                      //                       color: Colors.black),
                      //                 ),
                      //               ),
                      //             ];
                      //           } else {
                      //             Future.delayed(
                      //                 const Duration(seconds: 2), () {
                      //               print('error');
                      //               print(data);
                      //               Get.back();
                      //             });
                      //             children = <Widget>[
                      //               const Icon(
                      //                 Icons.error_outline,
                      //                 color: Colors.red,
                      //                 size: 60,
                      //               ),
                      //               const Padding(
                      //                 padding: EdgeInsets.only(top: 16),
                      //                 child: Text(
                      //                   'Failed to Login',
                      //                   style: TextStyle(
                      //                       color: Colors.black),
                      //                 ),
                      //               ),
                      //             ];
                      //           }
                      //         } else {
                      //           Future.delayed(const Duration(seconds: 5),
                      //                   () {
                      //                 print(data);
                      //                 print('other');
                      //                 // Get.back();
                      //               });
                      //
                      //           children = const <Widget>[
                      //             SizedBox(
                      //               width: 60,
                      //               height: 60,
                      //               child: CircularProgressIndicator(),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.only(top: 16),
                      //               child: Text(
                      //                 'Logging in',
                      //                 style:
                      //                 TextStyle(color: Colors.black),
                      //               ),
                      //             )
                      //           ];
                      //         }
                      //         return AlertDialog(
                      //           content: SizedBox(
                      //             height: 150,
                      //             child: Center(
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                 MainAxisAlignment.center,
                      //                 children: children,
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //       future: OnboardingController().login(
                      //           mobileNo: widget.phonenumber, otp: otp),
                      //     );
                      //   },
                      // );

                      // showDialog(
                      //   barrierDismissible: false,
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return FutureBuilder(
                      //       builder: (
                      //         BuildContext context,
                      //         AsyncSnapshot<Map<String, dynamic>>
                      //             snapshot,
                      //       ) {
                      //         List<Widget> children;
                      //         if (snapshot.hasData) {
                      //           var data = snapshot.data;
                      //           if (data!['common']['status']
                      //                   .toString() ==
                      //               "200") {
                      //             print(data);
                      //             print(data);
                      //             Future.delayed(
                      //                 const Duration(seconds: 2),
                      //                 () async {
                      //               if (data['common']['employee_exist'] ==
                      //                   true) {
                      //                 var prefs = await SharedPreferences
                      //                     .getInstance();
                      //                 prefs.setBool('isLoggedIn', true);
                      //                 prefs.setString('auth_key',
                      //                     data['employee']['auth_key']);
                      //                 prefs.setString('employee_id',
                      //                     data['employee']['id']);
                      //                 prefs.setString('employeeDetails',
                      //                     json.encode(data['employee']));
                      //                 print('data employee//////');
                      //                 print(data['employee']);
                      //                 Get.offAll(() => const Register());
                      //                 print(prefs.getBool('isLoggedIn'));
                      //                 if (data['common']
                      //                         ['employee_verified'] ==
                      //                     true) {
                      //                   Get.offAll(
                      //                       () => const HomeScreen());
                      //                 }
                      //                 else {
                      //                   Get.offAll(() =>
                      //                       const Register());
                      //                 }
                      //               }
                      //               // else {
                      //               //   List<Map<String, dynamic>>
                      //               //       availableVehicleTypeList = [];
                      //               //   for (Map<String, dynamic> type
                      //               //       in data['vehicle']) {
                      //               //     availableVehicleTypeList
                      //               //         .add(type);
                      //               //   }
                      //               else{
                      //
                      //               }
                      //                 Get.offAll(() => const Register(
                      //                       // mobileNumber:
                      //                       //     widget.phonenumber,
                      //                       // availableVehicleTypeList:
                      //                       //     availableVehicleTypeList,
                      //                     ));
                      //
                      //             });
                      //
                      //             children = <Widget>[
                      //               const Icon(
                      //                 Icons.check_circle_outline,
                      //                 color: Colors.green,
                      //                 size: 60,
                      //               ),
                      //               const Padding(
                      //                 padding: EdgeInsets.only(top: 16),
                      //                 child: Text(
                      //                   'Login Successfully',
                      //                   style: TextStyle(
                      //                       color: Colors.black),
                      //                 ),
                      //               ),
                      //             ];
                      //           } else {
                      //             Future.delayed(
                      //                 const Duration(seconds: 2), () {
                      //               Get.back();
                      //             });
                      //             children = <Widget>[
                      //               const Icon(
                      //                 Icons.error_outline,
                      //                 color: Colors.red,
                      //                 size: 60,
                      //               ),
                      //               const Padding(
                      //                 padding: EdgeInsets.only(top: 16),
                      //                 child: Text(
                      //                   'Failed to Login',
                      //                   style: TextStyle(
                      //                       color: Colors.black),
                      //                 ),
                      //               ),
                      //             ];
                      //           }
                      //         } else {
                      //           Future.delayed(const Duration(seconds: 2),
                      //               () {
                      //                 Get.offAll(() => const Register(
                      //                   // mobileNumber:
                      //                   //     widget.phonenumber,
                      //                   // availableVehicleTypeList:
                      //                   //     availableVehicleTypeList,
                      //                 ));                                      });
                      //
                      //           children = const <Widget>[
                      //             SizedBox(
                      //               width: 60,
                      //               height: 60,
                      //               child: CircularProgressIndicator(),
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.only(top: 16),
                      //               child: Text(
                      //                 'Logging in',
                      //                 style:
                      //                     TextStyle(color: Colors.black),
                      //               ),
                      //             )
                      //           ];
                      //         }
                      //         return AlertDialog(
                      //           content: SizedBox(
                      //             height: 150,
                      //             child: Center(
                      //               child: Column(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: children,
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //       future: OnboardingController().login(
                      //           mobileNo: widget.phonenumber, otp: otp),
                      //     );
                      //   },
                      // );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: primaryGreenColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade400,
                    disabledForegroundColor: Colors.grey.shade700,
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(
                          color: otp.length != 6
                              ? Colors.grey.shade400
                              : primaryOrangeColor),
                    ),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _body(),
      ),
    );
  }
}
