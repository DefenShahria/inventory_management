import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/presentation/State_Holder/sign_up_Controller.dart';
import 'Sign_in_Screen.dart';
import 'otp_Verification.dart';

class Sign_up_page extends StatefulWidget {
  const Sign_up_page({super.key,});

  @override
  State<Sign_up_page> createState() => _PinCode_verificationState();
}


class _PinCode_verificationState extends State<Sign_up_page> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _numberTEC = TextEditingController();
  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _businessNameTEC = TextEditingController();
  final TextEditingController _businessTypeTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formkey,
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
                    controller: _numberTEC,
                    decoration: const InputDecoration(hintText: 'Phone Number',),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your phone number';
                      } else if (!RegExp(r'^01[3-9]\d{8}$').hasMatch(text!)) {
                        return 'Enter a valid Bangladesh phone number';
                      }
                      return null;
                    },

                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailTEC,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your email address';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(text!)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  TextFormField(
                    controller: _nameTEC,
                    decoration: const InputDecoration(hintText: 'Name'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _businessNameTEC,
                    decoration: const InputDecoration(hintText: 'Business Name'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your business name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  TextFormField(
                    controller: _businessTypeTEC,
                    decoration: const InputDecoration(hintText: 'Business Type'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return 'Enter your business type';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  GetBuilder<SignupController>(
                    builder: (signupController) {
                      return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  SignUp(signupController,routeName!);
                                }
                              }, child: const Text('Next')));
                    }
                  ),
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
      ),
    );
  }

  Future<void> SignUp(SignupController signupcontroller,String routename) async {
    final response = await signupcontroller.verifySignup(
        _numberTEC.text.trim(),
        _emailTEC.text.trim(),
      _nameTEC.text,
      _businessNameTEC.text,
      _businessTypeTEC.text
    );
    if (response) {
      Get.to( OTP_verification(identifier_id: '${signupcontroller.identifier_id}', email: '${_emailTEC.text}',));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong Information! Try Again')));
      }
    }
  }

}
