import 'package:flutter/material.dart';
import 'package:optional_master/utils/colors.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  String? recommendations;
  String? range;
  String? duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryGreenColor,
        title: const Text(
          'Services',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: "Recommendations",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    contentPadding: EdgeInsets.all(8)),
                dropdownColor: Colors.white,
                value: recommendations,
                onChanged: (String? newValue) {
                  setState(() {
                    recommendations = newValue!;
                  });
                },
                items: <String>[
                  'Buy',
                  'Sell',
                  'Short',
                  'Long',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: "Range",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    contentPadding: EdgeInsets.all(8)),
                dropdownColor: Colors.white,
                value: range,
                onChanged: (String? newValue) {
                  setState(() {
                    range = newValue!;
                  });
                },
                items: <String>[
                  'Upper',
                  'Lower',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: "Duration",
                    enabledBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      //<-- SEE HERE
                      borderSide: BorderSide(color: Colors.green, width: 1),
                    ),
                    contentPadding: EdgeInsets.all(8)),
                dropdownColor: Colors.white,
                value: duration,
                onChanged: (String? newValue) {
                  setState(() {
                    duration = newValue!;
                  });
                },
                items: <String>[
                  'Intra Day',
                  'Intra BIST',
                  'Intra STBT',
                  '223 day',
                  'Intra Expiry',
                  'Expiry',
                  'Lower',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Bank Nifty : 12045 CE',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '25-Aug-2022 09:25 am',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor: MaterialStatePropertyAll(
                                primaryGreenColor,
                              ),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  Text(
                                    "Buy",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('SL'),
                                  Text(
                                    '200',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T1'),
                                  Text(
                                    '350',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T2'),
                                  Text(
                                    '400',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Bank Nifty : 12045 PE',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '25-Aug-2022 09:25 am',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.red,
                              ),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  Text(
                                    "SELL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('SL'),
                                  Text(
                                    '200',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T1'),
                                  Text(
                                    '350',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T2'),
                                  Text(
                                    '400',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Bank Nifty : 12045 CE',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '25-Aug-2022 09:25 am',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor: MaterialStatePropertyAll(
                                primaryGreenColor,
                              ),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  Text(
                                    "Buy",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('SL'),
                                  Text(
                                    '200',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T1'),
                                  Text(
                                    '350',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T2'),
                                  Text(
                                    '400',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Bank Nifty : 12045 PE',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  '25-Aug-2022 09:25 am',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.red,
                              ),
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 5),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: const [
                                  Text(
                                    "SELL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('SL'),
                                  Text(
                                    '200',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T1'),
                                  Text(
                                    '350',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.grey[200],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Column(
                                children: const [
                                  Text('T2'),
                                  Text(
                                    '400',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
