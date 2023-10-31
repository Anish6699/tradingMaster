import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/utils/colors.dart';
import 'package:optional_master/view/service_details.dart';
import 'package:optional_master/widget/drawerWidget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BuyService extends StatefulWidget {
  final String serviceid;
  final List data;
  final bool trailEnded;

  const BuyService(
      {Key? key,
      required this.serviceid,
      required this.data,
      required this.trailEnded})
      : super(key: key);

  @override
  State<BuyService> createState() => _ServicePageState();
}

class _ServicePageState extends State<BuyService> {
  late Razorpay _razorpay;
  @override
  void initState() {
    _razorpay = Razorpay();

    // Replace 'YOUR_API_KEY' with your actual Razorpay API key
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    print(widget.serviceid);
    print(widget.data);
    super.initState();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment success: ${response.paymentId}");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    print("Payment error: ${response.code.toString()} - ${response.message}");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    print("External wallet selected: ${response.walletName}");
  }

  void startPayment() {
    var options = {
      'key': 'rzp_live_ugzy7jQenOQFN6',
      'amount': 10, 
      'name': 'Package',
      'description': 'Test Payment',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      },
      'external': {
        'wallets': ['paytm'],
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryGreenColor,
        title: const Text(
          'Buy Service',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    widget.trailEnded == true
                        ? null
                        : Get.to(() => ServicesDetails(
                              servicedetail_id: widget.serviceid.toString(),
                            ));
                  },
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
                                              widget.serviceid == '1'
                                                  ? 'Basic'
                                                  : widget.serviceid == '2'
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
                                              widget.data[index]
                                                  ['package_name'],
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
                                            'Price  :  ',
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
                                              widget.data[index]['price'],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
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
                                  startPayment();
                                },
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      )),
    );
  }
}
