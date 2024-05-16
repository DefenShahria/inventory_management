import 'package:get/get.dart';
import 'package:inventory_management/presentation/State_Holder/otp_Verification_controller.dart';
import 'package:inventory_management/presentation/State_Holder/sign_in_Controller.dart';
import 'package:inventory_management/presentation/State_Holder/sign_up_Controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignupController());
    Get.put(SigninController());
    Get.put(VerifyOtpController());
  }
}