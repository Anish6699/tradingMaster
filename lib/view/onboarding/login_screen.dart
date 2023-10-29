import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/controllers/onboarding_controllers.dart';
import 'package:optional_master/view/home_screen.dart';
import 'package:optional_master/view/onboarding/login_with_number.dart';
import 'package:optional_master/view/onboarding/sign_up_screen.dart';
import '../../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  OnboardingControllers onboardingControllers = OnboardingControllers();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            // color: Colors.amberAccent,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          const Center(
            child: Text(
              'Sign In',
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
                      controller: emailController,
                      // keyboardType: TextInputType.number,
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
                        labelText: 'password',
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
                          // onboardingControllers.loginApi();

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
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
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
                                            'Login Successfully',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ];
                                    } else {
                                      Future.delayed(const Duration(seconds: 2),
                                          () {
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
                                            'Failed to Login',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ];
                                    }
                                  } else {
                                    print('snapshot.data');
                                    print(snapshot.data);
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      Get.offAll(() => const LoginScreen());
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
                                          'Logging in',
                                          style: TextStyle(color: Colors.black),
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
                                future: onboardingControllers.loginApi(
                                    emailController.text,
                                    passwordController.text),
                              );
                            },
                          );
                          // Get.offAll(() => const HomeScreen());
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
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(() => const LoginScreen2());
              },
              child: const Text(
                "Login With Number",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(() => const LoginScreen2());
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
          //         Get.to(() => const SignUpScreen());
          //       },
          //       child: const Text(
          //         "Sign Up",
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
