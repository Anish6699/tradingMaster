import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/view/home_screen.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
import 'package:optional_master/view/onboarding/profile.dart';
import 'package:optional_master/view/performance.dart';
import 'package:optional_master/view/services.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text(
                "Mangesh Ghodke",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text("mangesh@gmail.com"),
              currentAccountPictureSize: Size.square(50), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: const Icon(Icons.home_repair_service),
            title: const Text(
              ' Home',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.to(() => const HomeScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.home_repair_service),
            title: const Text(
              ' My Services',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.to(() => const Services());
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(
              ' Performance ',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.to(() => const Performance());
            },
          ),
          ListTile(
            leading: const Icon(Icons.workspace_premium),
            title: const Text(
              ' Offers ',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              ' Profile ',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.to(() => const ProfileScreen());
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              ' Logout ',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Get.to(() => const LoginScreen());
            },
          ),
        ],
      ),
    );
  }
}
