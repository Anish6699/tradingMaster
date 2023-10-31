import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/controllers/service_performance_controller.dart';
import 'package:optional_master/utils/colors.dart';
import 'package:optional_master/view/performance.dart';
import 'package:optional_master/view/service_details.dart';
import 'package:optional_master/widget/drawerWidget.dart';

class PerformanceServices extends StatefulWidget {
  PerformanceServices({Key? key}) : super(key: key);

  @override
  State<PerformanceServices> createState() => _ServicesState();
}

class _ServicesState extends State<PerformanceServices> {
  ServicePerformanceControllers spcontroller = ServicePerformanceControllers();
  @override
  List myserviceList = [];
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    myserviceList = await spcontroller.getUserPurchasedServices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryGreenColor,
        title: const Text(
          'My PerformanceServices',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView.builder(
            itemCount: myserviceList.length,
            itemBuilder: (context, index) {
              return Padding(
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Service Type  :  ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                            myserviceList[index]['service_id']
                                                        .toString() ==
                                                    '1'
                                                ? 'Basic'
                                                : myserviceList[index]
                                                                ['service_id']
                                                            .toString() ==
                                                        '2'
                                                    ? 'HNI'
                                                    : 'Special',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Package Name  :  ',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Text(
                                            myserviceList[index]['package_id']
                                                        .toString() ==
                                                    '1'
                                                ? 'Silver'
                                                : myserviceList[index]
                                                                ['package_id']
                                                            .toString() ==
                                                        '2'
                                                    ? 'Gold'
                                                    : 'Platinum',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54),
                                          ),
                                        ),
                                      ],
                                    ),
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
                              onPressed: () {
                                Get.to(() => Performance(
                                      servicedetail_id: myserviceList[index]
                                              ['service_id']
                                          .toString(),
                                    ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: const [
                                    Text(
                                      "Performance",
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
                      ],
                    ),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
