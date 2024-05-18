
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/data/color_plate.dart';
import 'package:inventory_management/presentation/State_Holder/otp_Verification_controller.dart';
import 'package:inventory_management/presentation/UI/Home_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Sign_verification extends StatefulWidget {
  const Sign_verification({super.key, required this.email, });
  final String email;

  @override
  State<Sign_verification> createState() => _PinCode_verificationState();
}


class _PinCode_verificationState extends State<Sign_verification> {

   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
   final TextEditingController _otpTEC = TextEditingController();
   @override

  @override
  Widget build(BuildContext context) {
    String? routeName = ModalRoute.of(context)?.settings.name;
    return PopScope(
      onPopInvoked: (didPop) async {
          Get.back();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: IconButton(onPressed: () {
                            Get.back();
                          }, icon:const Icon(Icons.chevron_left_outlined),),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const SizedBox(height: 16,),
                          Text(
                            'Enter the 6 digit code that we just sent to ${widget.email}',
                          ),

                          const SizedBox(height: 30,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PinCodeTextField(
                              controller: _otpTEC,
                              length: 6,
                              // obscureText: false,
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(10),
                                  fieldHeight: 65,
                                  fieldWidth: 50,
                                  activeFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  selectedFillColor: Colors.white,
                                  activeColor: Appcolor.primarycolor,
                                  inactiveColor: Colors.blueAccent.shade100,
                                  selectedColor: Colors.grey
                              ),
                              animationDuration: const Duration(milliseconds: 300),
                              enableActiveFill: true,


                              onCompleted: (v) {

                              },
                              onChanged: (value) {
                              },
                              beforeTextPaste: (text) {
                                return true;
                              }, appContext: context,
                            ),
                          ),
                          const SizedBox(height: 10,)
                        ],
                      ),
                    ),
                    GetBuilder<VerifyOtpController>(
                      builder: (verifyOtpController) {
                        return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {

                                      signInverify(verifyOtpController,widget.email);

                                }, child: const Text('Next')));
                      }
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


Future<void>signInverify(VerifyOtpController controller,String email) async {

  final response = await controller.signInverify(
      _otpTEC.text.trim(),
     email.trim()
  );
  if (response) {
    Get.offAll(()=>const HomePage());
  }else{
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Wrong Otp !')));
    }
  }
}
}
