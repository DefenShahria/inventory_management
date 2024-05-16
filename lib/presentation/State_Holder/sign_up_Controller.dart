import 'package:get/get.dart';
import 'package:inventory_management/data/Network/networkCaller.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/data/urls.dart';

class SignupController extends GetxController {
  bool _signupInProgress = false;
  String _message = '';
  int identifier_id = 0;

  bool get signupInProgress => _signupInProgress;

  String get message => _message;

  int get identifierId => identifier_id;

  Future<bool> verifySignup(String phone, String email, String name, String business_name, String business_type) async {
    _signupInProgress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
      Urls.signup,
      {
        "phone": phone,
        "email": email,
        "name": name,
        "business_name":business_name,
        "business_type_id":business_type
      },
    );
    _signupInProgress = false;
    update();
    if (response.issuccess) {
      print(response.responseJson);
      _message = response.responseJson?['data']['description'] ?? '';
      identifier_id = response.responseJson?['data']['identifier_id'] ?? 0;
      return true;
    } else {
      print(response.responseJson);
      _message = "Signup failed";
      return false;
    }
  }
}
