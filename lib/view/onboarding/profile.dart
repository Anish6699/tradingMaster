import 'package:flutter/material.dart';
import 'package:optional_master/view/onboarding/edit_profile.dart';
import 'package:optional_master/view/onboarding/reset_password.dart';
import 'package:optional_master/widget/drawerWidget.dart';
import '../../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: const DrawerWidget(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: primaryGreenColor,
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 25),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Edit Profile'),
                Tab(text: 'Reset Password'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              EditProfile(),
              ResetPassword(),
            ],
          )),
    );
  }
}
