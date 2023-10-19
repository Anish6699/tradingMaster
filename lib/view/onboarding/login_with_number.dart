import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/view/onboarding/otp_verification.dart';
import 'package:optional_master/view/onboarding/sign_up_screen.dart';
import '../../utils/colors.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  TextEditingController numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            // color: Colors.amberAccent,
            child: const Center(
                child: Text(
              'Trading\nMaster',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
          ),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 40,
                  bottom: 30,
                ),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                  border: Border.all(
                    color: const Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => value!.isEmpty
                              ? 'Please enter phone number'
                              // : !value.contains(RegExp(r'(^[0-9]{10}$)'))
                              : !value.contains(RegExp(r'^[6-9]\d{9}$'))
                                  ? 'Enter valid phone number'
                                  : null,
                          controller: numberController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: primaryBlackTextColor),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Enter Phone Number',
                            labelStyle:
                                const TextStyle(color: primaryBlackTextColor),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
                            ),
                          ),
                          onSaved: (newValue) {
                            setState(() {
                              numberController.text = newValue!;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: OutlinedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor: MaterialStatePropertyAll(
                                primaryGreenColor,
                              ),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(vertical: 16),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => OtpVerification(
                                    phoneNumber: numberController.text,
                                  ));
                            },
                            child: const Text(
                              "Send OTP",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.4,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                    left: 10,
                  ),
                  color: Colors.white,
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(
                    primaryGreenColor,
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "Login With Email",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: OutlinedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(
                    primaryGreenColor,
                  ),
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
