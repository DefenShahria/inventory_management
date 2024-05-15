
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../data/color_plate.dart';
import 'Sign_in_Screen.dart';

class OTP_verification extends StatefulWidget {
  const OTP_verification({super.key,required this.userNumber,});
  final String? userNumber;
  @override
  State<OTP_verification> createState() => _PinCode_verificationState();
}


class _PinCode_verificationState extends State<OTP_verification> {
  // bool ischecked = false;
  // final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  // final TextEditingController _otpTEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade200,
                      child: IconButton(onPressed: () {
                        Get.to(const SigninPage());
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

                      Text(
                        'Enter the code  ',
                      ),
                      const SizedBox(height: 16,),
                      Text(
                        'Enter the 6 digit code that we just sent to',
                      ),
                      const SizedBox(height: 4,),
                      Text('${widget.userNumber}',),
                      const SizedBox(height: 30,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PinCodeTextField(
                         // controller: _otpTEC,
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
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(const OTP_verification(userNumber: '',));
                        }, child: const Text('Next'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Didn’t receive the OTP?'),
                    TextButton(onPressed: (){}, child: const Text('Resend OTP'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

// Future<void>verifyOTP(VerifyOtpController controller) async {
//   final response = await controller.verifyotp(
//       _otpTEC.text.trim()
//   );
//   if (response) {
//     Get.offAll(()=>const SignUp_Screen());
//   }else{
//     if (mounted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//               content: Text('Wrong Otp !')));
//     }
//   }
// }
}
