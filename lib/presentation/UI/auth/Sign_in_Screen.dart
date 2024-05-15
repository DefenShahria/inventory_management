import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_management/data/color_plate.dart';
import 'package:inventory_management/presentation/UI/auth/sign_up_screen.dart';

import 'otp_Verification.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                'Sign In Page',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Enter Your Phone Number'),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Number'
                ),
              ),
              const SizedBox(
                height: 16,
              ),

              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const OTP_verification(userNumber: '',));
                      }, child: const Text('Next'))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Dont have Account ?'),
                  TextButton(onPressed: (){
                    Get.to(const Sign_up_page());
                  }, child: const Text('Sign up '))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
