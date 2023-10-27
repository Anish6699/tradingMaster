import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/utils/colors.dart';
import 'package:optional_master/view/onboarding/login_screen.dart';
import 'package:optional_master/view/service_page.dart';
import 'package:optional_master/widget/drawerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        backgroundColor: Colors.grey[400],
        title:  Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        )
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ServicePage());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  tileColor: Colors.grey[300],
                  leading: const Icon(Icons.home_repair_service_rounded),
                  title: const Text('Basic'),
                  trailing: ElevatedButton(
                      onPressed: () {}, child: const Text('Buy')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ServicePage());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  tileColor: Colors.grey[300],
                  leading: const Icon(Icons.home_repair_service_rounded),
                  title: const Text('HNI'),
                  trailing: ElevatedButton(
                      onPressed: () {}, child: const Text('Buy')),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ServicePage());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  tileColor: Colors.grey[300],
                  leading: const Icon(Icons.home_repair_service_rounded),
                  title: const Text('Special'),
                  trailing: ElevatedButton(
                      onPressed: () {}, child: const Text('Buy')),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: DropdownButtonFormField(
              //     decoration: const InputDecoration(
              //         labelText: "Company",
              //         enabledBorder: OutlineInputBorder(
              //           //<-- SEE HERE
              //           borderSide: BorderSide(color: Colors.green, width: 1),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           //<-- SEE HERE
              //           borderSide: BorderSide(color: Colors.green, width: 1),
              //         ),
              //         contentPadding: EdgeInsets.all(8)),
              //     dropdownColor: Colors.white,
              //     value: company,
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         company = newValue!;
              //       });
              //     },
              //     items: <String>[
              //       'Rainbow',
              //       'Option Master',
              //     ].map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(
              //           value,
              //           style: const TextStyle(fontSize: 14),
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: DropdownButtonFormField(
              //     decoration: const InputDecoration(
              //         labelText: "Service Type",
              //         enabledBorder: OutlineInputBorder(
              //           //<-- SEE HERE
              //           borderSide: BorderSide(color: Colors.green, width: 1),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           //<-- SEE HERE
              //           borderSide: BorderSide(color: Colors.green, width: 1),
              //         ),
              //         contentPadding: EdgeInsets.all(8)),
              //     dropdownColor: Colors.white,
              //     value: service,
              //     onChanged: (String? newValue) {
              //       setState(() {
              //         service = newValue!;
              //       });
              //     },
              //     items: <String>['Basic', 'HNI', 'Special']
              //         .map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(
              //           value,
              //           style: const TextStyle(fontSize: 14),
              //         ),
              //       );
              //     }).toList(),
              //   ),
              // ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 1,
              // ),
              // GestureDetector(
              //   onTap: () {
              //     Get.to(() => const ServicePage());
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Card(
              //       elevation: 2,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       child: Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: Column(
              //           children: [
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.start,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: const [
              //                       Text(
              //                         'PEL Above 2022',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                       Text(
              //                         '25-Aug-2022 09:25 am',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 OutlinedButton(
              //                   style: const ButtonStyle(
              //                     shape: MaterialStatePropertyAll(
              //                       RoundedRectangleBorder(
              //                         borderRadius: BorderRadius.all(
              //                           Radius.circular(10),
              //                         ),
              //                       ),
              //                     ),
              //                     foregroundColor:
              //                         MaterialStatePropertyAll(Colors.white),
              //                     backgroundColor: MaterialStatePropertyAll(
              //                       primaryGreenColor,
              //                     ),
              //                     padding: MaterialStatePropertyAll(
              //                       EdgeInsets.symmetric(
              //                           vertical: 5, horizontal: 5),
              //                     ),
              //                   ),
              //                   onPressed: () {
              //                     Get.offAll(() => const HomeScreen());
              //                   },
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       children: const [
              //                         Text(
              //                           "Intraday",
              //                           style: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                         Text(
              //                           "Buy",
              //                           style: TextStyle(
              //                             fontWeight: FontWeight.w500,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(
              //               height: 10,
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(15.0),
              //                   ),
              //                   color: Colors.grey[200],
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       children: const [
              //                         Text('Target'),
              //                         Text(
              //                           '2037',
              //                           style: TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(15.0),
              //                   ),
              //                   color: Colors.grey[200],
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       children: const [
              //                         Text('Target'),
              //                         Text(
              //                           '2037',
              //                           style: TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //                 Card(
              //                   shape: RoundedRectangleBorder(
              //                     borderRadius: BorderRadius.circular(15.0),
              //                   ),
              //                   color: Colors.grey[200],
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Column(
              //                       children: const [
              //                         Text('Target'),
              //                         Text(
              //                           '2037',
              //                           style: TextStyle(fontSize: 12),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Card(
              //     elevation: 2,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Text(
              //                       'PEL Above 2022',
              //                       style: TextStyle(fontSize: 12),
              //                     ),
              //                     Text(
              //                       '25-Aug-2022 09:25 am',
              //                       style: TextStyle(fontSize: 12),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               OutlinedButton(
              //                 style: const ButtonStyle(
              //                   shape: MaterialStatePropertyAll(
              //                     RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.all(
              //                         Radius.circular(10),
              //                       ),
              //                     ),
              //                   ),
              //                   foregroundColor:
              //                       MaterialStatePropertyAll(Colors.white),
              //                   backgroundColor: MaterialStatePropertyAll(
              //                     primaryGreenColor,
              //                   ),
              //                   padding: MaterialStatePropertyAll(
              //                     EdgeInsets.symmetric(
              //                         vertical: 5, horizontal: 5),
              //                   ),
              //                 ),
              //                 onPressed: () {
              //                   Get.offAll(() => const HomeScreen());
              //                 },
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text(
              //                         "Intraday",
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       Text(
              //                         "Buy",
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             height: 10,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Card(
              //     elevation: 2,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(12.0),
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Text(
              //                       'PEL Above 2022',
              //                       style: TextStyle(fontSize: 12),
              //                     ),
              //                     Text(
              //                       '25-Aug-2022 09:25 am',
              //                       style: TextStyle(fontSize: 12),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //               OutlinedButton(
              //                 style: const ButtonStyle(
              //                   shape: MaterialStatePropertyAll(
              //                     RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.all(
              //                         Radius.circular(10),
              //                       ),
              //                     ),
              //                   ),
              //                   foregroundColor:
              //                       MaterialStatePropertyAll(Colors.white),
              //                   backgroundColor: MaterialStatePropertyAll(
              //                     primaryGreenColor,
              //                   ),
              //                   padding: MaterialStatePropertyAll(
              //                     EdgeInsets.symmetric(
              //                         vertical: 5, horizontal: 5),
              //                   ),
              //                 ),
              //                 onPressed: () {
              //                   Get.offAll(() => const HomeScreen());
              //                 },
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text(
              //                         "Intraday",
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       Text(
              //                         "Buy",
              //                         style: TextStyle(
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             height: 10,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               Card(
              //                 shape: RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 color: Colors.grey[200],
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: const [
              //                       Text('Target'),
              //                       Text(
              //                         '2037',
              //                         style: TextStyle(fontSize: 12),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
