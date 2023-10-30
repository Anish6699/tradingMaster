import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optional_master/controllers/get_user_data_controller.dart';
import 'package:optional_master/utils/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
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
    setData();
  }

  setData() {
    firstNameController.text = data[0]['fname'];
    lastNameController.text = data[0]['lname'];
    numberController.text = data[0]['mobile'];
    emailController.text = data[0]['email'];
    adharController.text = data[0]['adhar'] ?? '';
    panController.text = data[0]['pan'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? ListView(
            children: [
              // SizedBox(
              //   // height: MediaQuery.of(context).size.height * 0.15,
              //   // color: Colors.amberAccent,s
              //   child: Center(
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //       child: Image.asset(
              //         'assets/images/logo.png',
              //         fit: BoxFit.contain,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
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
                          readOnly: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: firstNameController,
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
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
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
                          readOnly: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: lastNameController,
                          // keyboardType: TextInputType.number,
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
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
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
                          readOnly: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: numberController,
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
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
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
                          readOnly: true,
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
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
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
                          controller: adharController,
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: primaryBlackTextColor),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Aadhar Card',
                            labelStyle:
                                const TextStyle(color: primaryBlackTextColor),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
                            ),
                          ),
                          onSaved: (newValue) {
                            setState(() {
                              adharController.text = newValue!;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: panController,
                          // keyboardType: TextInputType.number,
                          style: const TextStyle(color: primaryBlackTextColor),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Pancard',
                            labelStyle:
                                const TextStyle(color: primaryBlackTextColor),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide(
                                  color: primaryBlackBorderColor),
                            ),
                          ),
                          onSaved: (newValue) {
                            setState(() {
                              panController.text = newValue!;
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
                              userData
                                  .updateUserData(
                                      adhar: adharController.text,
                                      pan: panController.text)
                                  .then((value) => value['response'] == 1
                                      ? Get.snackbar(
                                          "Notification",
                                          "Updated Successfully.",
                                          colorText: Colors.white,
                                          icon: const Icon(Icons.add_alert),
                                        )
                                      : null);
                            },
                            child: const Text(
                              "Save",
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
            ],
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
