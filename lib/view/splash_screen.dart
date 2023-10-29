import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:optional_master/view/home_screen.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initial();
    super.initState();
  }

  initial() async {
    Timer(const Duration(seconds: 2), () async {
      var prefs = await SharedPreferences.getInstance();
      bool result = await InternetConnectionChecker().hasConnection;
      if (result == true) {
        var userId = prefs.getString('userId');
        userId == null ?
        Get.offAll(() => const LoginScreen()):
        Get.offAll(() => const HomeScreen());
      } else {
        // show an popup with option to refresh page
        // ignore: use_build_context_synchronously
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                'No Internet Connection',
                style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error_outline,
                      size: 60,
                      color: Colors.red,
                    ),
                    Text('Check your Internet Connection'),
                  ],
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => const SplashScreen());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Retry',
                          style:
                              TextStyle(letterSpacing: 1, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Image.asset(
        'assets/images/logo.png',
              fit: BoxFit.cover,
      ),
          )),
    );
  }
}
