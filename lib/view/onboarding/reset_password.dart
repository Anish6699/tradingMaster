import 'package:flutter/material.dart';
import 'package:optional_master/utils/colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: ListView(
        children: [
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
                      validator: (value) => value!.isEmpty
                          ? 'Please enter old password'
                          : null,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      obscureText: true,
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Old password',
                        labelStyle: const TextStyle(
                            color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          passwordController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: TextFormField(
                      readOnly: true,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction,
                      controller: newPasswordController,
                      obscureText: true,
                      validator: (value) => value!.isEmpty
                          ? 'Please enter new password'
                          : null,
                      // keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: primaryBlackTextColor),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'New password',
                        labelStyle: const TextStyle(
                            color: primaryBlackTextColor),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                              color: primaryBlackBorderColor),
                        ),
                      ),
                      onSaved: (newValue) {
                        setState(() {
                          newPasswordController.text = newValue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height:
                    MediaQuery.of(context).size.height * 0.025,
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
                          // if (_formKey.currentState!.validate()) {
                          //   userData
                          //       .updateUserData(
                          //           adhar: adharController.text,
                          //           pan: panController.text)
                          //       .then(
                          //           (value) => value['response'] == 1
                          //               ? Get.snackbar(
                          //                   "Notification",
                          //                   "Updated Successfully.",
                          //                   colorText: Colors.white,
                          //                   icon: const Icon(
                          //                       Icons.add_alert),
                          //                 )
                          //               : null);
                          // }
                        },
                        child: const Text(
                          "Reset Password",
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
      ),
    );
  }
}
