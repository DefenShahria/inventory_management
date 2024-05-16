import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventory_management/data/color_plate.dart';
import 'package:inventory_management/presentation/State_Holder/sign_in_Controller.dart';
import 'package:inventory_management/presentation/UI/auth/sign_up_screen.dart';

import 'otp_Verification.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailTEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
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
                const Text('Enter Your Email'),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _emailTEC,
                  decoration: const InputDecoration(
                      hintText: 'Email'
                  ),
                  validator: (String? text) {
                    if (text?.isEmpty ?? true) {
                      return 'Enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text!)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(
                  height: 16,
                ),

                GetBuilder<SigninController>(
                  builder: (signinController) {
                    return SizedBox(
                      width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()){
                              SignIn(signinController, '$routeName');
                            }
                          }, child: const Text('Next')));
                  }
                ),
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
      ),
    );
  }
  Future<void> SignIn(SigninController signinController, String routename) async {
    print('6666666666666666666666666666');
    final response = await signinController.verifySignin(
        _emailTEC.text.trim()
    );
    if (response) {
      Get.to( OTP_verification(identifier_id: '', email: '${_emailTEC.text}', routename: routename,));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong Information! Try Again')));
      }
    }
  }

}
