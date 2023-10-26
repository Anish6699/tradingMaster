import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
import 'package:optional_master/view/onboarding/otp_verification.dart';
import '../../utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            // color: Colors.amberAccent,
            child: const Center(
                child: Text(
              'Trading\nMaster',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
          ),
          const Center(
            child: Text(
              'Create New Account',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: firstNameController,
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'First Name',
                        labelStyle:
                            const TextStyle(color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          firstNameController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: lastNameController,
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Last Name',
                        labelStyle:
                            const TextStyle(color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          lastNameController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Number',
                        labelStyle:
                            const TextStyle(color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          numberController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Email',
                        labelStyle:
                            const TextStyle(color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          emailController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password',
                        labelStyle:
                            const TextStyle(color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide:
                              const BorderSide(color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          passwordController.text = newValue!;
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
                            EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                        onPressed: () {
                          Get.to(() => OtpVerification(
                                phoneNumber: numberController.text,
                              ));
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
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          // Center(
          //   child: SizedBox(
          //     width: MediaQuery.of(context).size.width * 0.8,
          //     child: OutlinedButton(
          //       style: const ButtonStyle(
          //         shape: MaterialStatePropertyAll(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.all(
          //               Radius.circular(100),
          //             ),
          //           ),
          //         ),
          //         foregroundColor: MaterialStatePropertyAll(Colors.white),
          //         backgroundColor: MaterialStatePropertyAll(
          //           primaryGreenColor,
          //         ),
          //         padding: MaterialStatePropertyAll(
          //           EdgeInsets.symmetric(vertical: 12),
          //         ),
          //       ),
          //       onPressed: () {
          //         Get.to(() => const LoginScreen());
          //       },
          //       child: const Text(
          //         "Sign In",
          //         style: TextStyle(
          //           fontSize: 16,
          //           fontWeight: FontWeight.w500,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
