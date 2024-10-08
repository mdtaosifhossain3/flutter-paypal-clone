import 'package:ewallet/globals/custom_button.dart';
import 'package:ewallet/globals/custom_field.dart';
import 'package:ewallet/services/login_service.dart';
import 'package:ewallet/views/authView/sign_up_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final emailCotroller = TextEditingController();
  final passwordController = TextEditingController();

  final LoginService service = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 70.00,
              ),
              //-----------------Input Fields---------------------
              Column(
                children: [
                  // ------------------------Logo---------------------
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/logo.png",
                          width: 76,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          "UpayApp",
                          style: TextStyle(fontSize: 24),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.00,
                  ),
                  CustomField(
                    title: "Enter your Email Address",
                    controller: emailCotroller,
                  ),
                  const SizedBox(
                    height: 20.00,
                  ),
                  CustomField(
                    title: "Enter your Password",
                    secure: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 20.00,
                  ),
                ],
              ),

              const SizedBox(
                height: 25,
              ),

              //------------------Login Button----------------------
              Column(
                children: [
                  CustomButton(
                    title: "Login",
                    ontap: () async {
                      if (emailCotroller.text == "" ||
                          passwordController.text == "") {
                        Get.snackbar("Error", "Fields cant be empty.");
                        return;
                      } else {
                        service.login(
                            email: emailCotroller.text,
                            password: passwordController.text);
                      }
                    },
                  ),

                  const SizedBox(
                    height: 24,
                  ),
                  //---------------Others -------------------------

                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return SignUpView();
                        }));
                      },
                      child: const Text(
                        "Having Trouble Logging In?",
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
