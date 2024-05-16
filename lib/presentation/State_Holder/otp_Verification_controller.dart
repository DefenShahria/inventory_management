import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory_management/data/Network/networkCaller.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/data/urls.dart';
import 'package:inventory_management/presentation/State_Holder/auth_controller.dart';

class VerifyOtpController extends GetxController{
  bool _otpVerificationInprogress = false;
  bool _signInOTPInprogress = false;
  String _message = '';

  bool get otpVerificationInprogress => _otpVerificationInprogress;
  bool get signInOTPInprogress => _signInOTPInprogress;

  String get message =>_message;

  Future<bool> verifyotp(String identifireId, String otp ) async {
    _otpVerificationInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.signupOTP,
        {
          "identifier_id": identifireId,
          "otp_code": otp,

        });
    _otpVerificationInprogress = false;
    update();
    if (response.issuccess) {
      _message =  'Otp verification Done';
      return true;
    } else {
      _message =  'Otp verification Failed';
      return false;
    }
  }

  Future<bool> signInverify(String email, String otp ) async {
    _signInOTPInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.signinOTP,
        {
          "otp_code": otp,
          "identifier": email
        });
    _signInOTPInprogress = false;
    update();
    if (response.issuccess) {
      print(response.responseJson);
      await AuthController.setAccessToken(response.responseJson?['data']['user']['api_token']);
      await AuthController.setuserid(response.responseJson?['data']['original']['user']['id']);
      _message =  'Otp verification Done';
      return true;
    } else {
      print(response.responseJson);
      _message =  'Otp verification Failed';
      return false;
    }
  }
}