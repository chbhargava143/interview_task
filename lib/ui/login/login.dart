import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task/controllers/home_controller.dart';
import 'package:task/helpers/validations.dart';
import 'package:task/ui/home/home_list.dart';

import '../../components/custom_snack_bar.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);
  final userName = 'Fininfocom';
  final password = 'Fin@123';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HomeController homeController = HomeController.to;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: const [],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),

                        /// here char limit is 5
                      ],
                      controller: homeController.userNameController,
                      decoration: const InputDecoration(
                          labelText: 'User name ...',
                          prefixIcon: Icon(Icons.person)),
                      validator: Validations().userName,
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: homeController.PasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Password  ...',
                          prefixIcon: Icon(Icons.lock)),
                      validator: Validations().password,
                      onChanged: (value) {},
                      keyboardType: TextInputType.text,
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                        width: size.width,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (homeController.userNameController.text ==
                                        userName &&
                                    homeController.PasswordController.text ==
                                        password) {
                                  Get.offAll(() => const HomeList());
                                } else {
                                  customSnackbar(
                                      context,
                                      'Username and password not matched..',
                                      Colors.black,
                                      Colors.white);
                                }
                              }
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            )))
                  ],
                ),
              )),
        ));
  }
}
