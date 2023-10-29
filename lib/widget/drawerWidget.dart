import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/controllers/get_user_data_controller.dart';
import 'package:optional_master/view/home_screen.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
import 'package:optional_master/view/onboarding/profile.dart';
import 'package:optional_master/view/performance.dart';
import 'package:optional_master/view/my_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  UserDataController userData = UserDataController();
  List data = [];

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    data = await userData.getUserData();
    print('data');
    print(data);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ), //BoxDecoration
            child: data.isNotEmpty
                ? UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(data[0]['fname'][0])

                        // Icon(
                        //   Icons.person,
                        //   size: 20,
                        // ),
                        ),
                    decoration: const BoxDecoration(color: Colors.green),
                    accountName: Text(
                      '${data[0]['fname']} ${data[0]['lname']}',
                      // "Mangesh Ghodke",
                      style: const TextStyle(fontSize: 20),
                    ),
                    accountEmail: Text(data[0]['email']),
                    currentAccountPictureSize:
                        const Size.square(50), //circleAvatar
                  )
                : const Center(
                    child:
                        CircularProgressIndicator()), //UserAccountDrawerHeader
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
          // ListTile(
          //   leading: const Icon(Icons.workspace_premium),
          //   title: const Text(
          //     ' Offers ',
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
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
            onTap: () async {
              Get.back();
              showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Get.offAll(() => const LoginScreen());
              },
            ),
          ],
        );
      },
    );
  }
}
