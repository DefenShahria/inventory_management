
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/color_plate.dart';
import 'Sign_in_Screen.dart';
import 'otp_Verification.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key,});

  @override
  State<Sign_up_page> createState() => _PinCode_verificationState();
}


class _PinCode_verificationState extends State<Sign_up_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),

                const Text(
                  'Sign Up Page',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Business Name'),
                ),
                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  decoration: const InputDecoration(hintText: 'Business Type'),
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
                    const Text('Already Have account'),
                    TextButton(onPressed: (){
                      Get.to(const SigninPage());
                    }, child: const Text('Sign in'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
