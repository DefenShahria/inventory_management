import 'package:get/get.dart';
import 'package:inventory_management/data/Network/networkCaller.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/data/urls.dart';

class SigninController extends GetxController{
  bool _signinVerificationInprogress = false;
  String _message = '';
  int _userid = 0;

  bool get signinverificationInprogress => _signinVerificationInprogress;

  String get message =>_message;
  int get userid =>_userid;

  Future<bool> verifySignin(String email) async {
    print('444444444444444444444444444444444');
    _signinVerificationInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.signin,
        {
          "identifier": email
        });
    _signinVerificationInprogress = false;
    update();
    if (response.issuccess) {
      print('555555555555555555555555555');
      print(response.responseJson);
      return true;
    } else {
      print(response.responseJson);
      return false;
    }
  }

}