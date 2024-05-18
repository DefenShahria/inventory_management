import 'dart:developer';

import 'package:get/get.dart';
import 'package:inventory_management/data/Network/networkCaller.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/data/model_data/user_profileModel.dart';
import 'package:inventory_management/data/urls.dart';


class UserInfoController extends GetxController{

  bool _getuserInfoInprogress = false;
  User_ProfileModel _userinfoModel = User_ProfileModel();
  String _message = '';
  User_ProfileModel get userinfoModel => _userinfoModel;
  bool _userInfoUpdateInprogress = false;
  bool get userInfoUpdateInprogress => _userInfoUpdateInprogress;


  bool get getuserInfoInprogress => _getuserInfoInprogress;

  String get message =>_message;


  Future<bool> getUserinfo() async {
    _getuserInfoInprogress = true;
    update();

    final Networkresponse response = await Networkcall().getRequest(Urls.userInfo);
    _getuserInfoInprogress = false;
    if (response.issuccess) {
      print('9999999999999999999999999999999999');
      _userinfoModel = User_ProfileModel.fromJson(response.responseJson!);
      print(response.responseJson);
      print('9999999999999999999999999999999999');
      update();
      return true;
    } else {
      return false;
    }
  }


  Future<bool> UserinfoUpdate( String name,String businessID,String img) async {
    _userInfoUpdateInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.userinfoUpdate,
        {
          "name":name,
          "business_type_id":businessID,
          "image":img,

        });

    _userInfoUpdateInprogress = false;

    print(response.statusCode);
    update();
    if (response.statusCode == 200) {
      _message = '';
      await getUserinfo();
      return true;
    } else {
      _message = '';
      log(response.statusCode as String);
      return false;
    }
  }


}