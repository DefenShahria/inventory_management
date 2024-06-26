import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/presentation/State_Holder/auth_controller.dart';

class Networkcall {

  Future<Networkresponse> getRequest(String url) async {
    try {
      Response response = await get(
          Uri.parse(url),
          headers: {
            'Authorization': 'Bearer ${AuthController().accessToken.toString()}',
          }
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return Networkresponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {

      } else {
        return Networkresponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return Networkresponse(false, -1, null);
  }

  Future<Networkresponse> postRequest(String url, Map<String, dynamic> body,
      {bool islogin = false}) async {

    try {
      print(body);
      Response response = await post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AuthController().accessToken.toString()}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(body),

      );
      print(response.statusCode);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        try{
          print(jsonDecode(response.body));

          return Networkresponse(
              true, response.statusCode, jsonDecode(response.body));
        }catch(e){
          print(e.toString());
        }
      } else if (response.statusCode == 401) {
        if (islogin == false) {
          gotoLogin();
        }
      } else {
        return Networkresponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return Networkresponse(false, -1, null);
  }

  Future<void> gotoLogin() async {}


  Future<Networkresponse> deleteRequest(String url) async {
    try {
      Response response = await delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${AuthController().accessToken.toString()}',
          'Content-Type': 'application/json'
        },
      );
      print(response.statusCode);
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        try {
          print(jsonDecode(response.body));
          return Networkresponse(
            true,
            response.statusCode,
            jsonDecode(response.body),
          );
        } catch (e) {
          print(e.toString());
        }
      } else if (response.statusCode == 401) {
      } else {
        return Networkresponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return Networkresponse(false, -1, null);
  }


}