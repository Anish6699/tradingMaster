import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:optional_master/controllers/onboarding_controllers.dart';
import 'package:optional_master/view/home_screen.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
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
  OnboardingControllers onboardingControllers = OnboardingControllers();
  final RegExp _validCharacters = RegExp(r'^[a-zA-Z ]*$');

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter email';
    }

    // Define a regular expression pattern for a valid email.
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null; // Return null for no validation errors.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            // color: Colors.amberAccent,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(_validCharacters),
                      ],
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter first name' : null,
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
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter last name' : null,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(_validCharacters),
                      ],
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
                      validator: (value) => value!.isEmpty
                          ? 'Please enter phone number'
                          // : !value.contains(RegExp(r'(^[0-9]{10}$)'))
                          : !value.contains(RegExp(r'^[6-9]\d{9}$'))
                              ? 'Enter valid phone number'
                              : null,
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
                      validator: (value) => _validateEmail(value!),
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
                      obscureText: true,
                      validator: (value) =>
                          value!.isEmpty ? 'Please enter password' : null,
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
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return FutureBuilder(
                                  builder: (
                                    BuildContext context,
                                    AsyncSnapshot<Map> snapshot,
                                  ) {
                                    List<Widget> children;
                                    if (snapshot.hasData) {
                                      var data = snapshot.data;
                                      print('dataaaaaaaaaaaaaaa');
                                      print(data);
                                      if (data!['message'].toString() ==
                                          "success") {
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          Get.offAll(() => const HomeScreen());
                                        });

                                        children = <Widget>[
                                          const Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.green,
                                            size: 60,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text(
                                              'Signup Successfully',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ];
                                      } else {
                                        Future.delayed(
                                            const Duration(seconds: 2), () {
                                          Get.back();
                                        });
                                        children = <Widget>[
                                          const Icon(
                                            Icons.error_outline,
                                            color: Colors.red,
                                            size: 60,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(top: 16),
                                            child: Text(
                                              'Failed to SignUp',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ];
                                      }
                                    } else {
                                      print('snapshot.data');
                                      print(snapshot.data);
                                      Future.delayed(const Duration(seconds: 5),
                                          () {
                                        Get.back();
                                        // Get.offAll(() => const LoginScreen());
                                      });

                                      children = const <Widget>[
                                        SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: CircularProgressIndicator(),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 16),
                                          child: Text(
                                            'Signing Up',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        )
                                      ];
                                    }
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 150,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: children,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  future: onboardingControllers.registerApi(
                                      firstNameController.text,
                                      lastNameController.text,
                                      emailController.text,
                                      numberController.text,
                                      passwordController.text),
                                );
                              },
                            );
                          }
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
