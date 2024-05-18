

import 'dart:developer';

import 'package:get/get.dart';
import 'package:inventory_management/data/Network/networkCaller.dart';
import 'package:inventory_management/data/Network/networkResponse.dart';
import 'package:inventory_management/data/model_data/branch_data_model.dart';
import 'package:inventory_management/data/urls.dart';

class BranchController extends GetxController{

  bool _getBranchInfoInprogress = false;
  bool _branchUpdateInprogress = false;
  bool _branchCreatInprogress = false;
  bool _branchDeletInprogress = false;

  BranchModel _branchInfoModel = BranchModel();
  String _message = '';
  BranchModel get branchInfoModel => _branchInfoModel;


  bool get getBranchInfoInprogress => _getBranchInfoInprogress;
  bool get branchUpdateInprogress => _branchUpdateInprogress;
  bool get branchCreatInprogress => _branchCreatInprogress;
  bool get branchDeletInprogress => _branchDeletInprogress;

  String get message =>_message;


  Future<bool> getBranchData() async {
    _getBranchInfoInprogress = true;
    update();

    final Networkresponse response = await Networkcall().getRequest(Urls.branchInfo);
    _getBranchInfoInprogress = false;
    if (response.issuccess) {
      _branchInfoModel = BranchModel.fromJson(response.responseJson!);
      update();
      return true;
    } else {
      return false;
    }
  }


  Future<bool> BranchUpdate( String bID,String name) async {
    _branchUpdateInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.branchUpdate(bID),
        {
          "name":name,

        });

    _branchUpdateInprogress = false;

    print(response.statusCode);
    update();
    if (response.statusCode == 200) {
      await getBranchData();
      _message = '';
      return true;
    } else {
      _message = '';
      log(response.statusCode as String);
      return false;
    }
  }

  Future<bool> BranchCreat( String name,) async {
    _branchCreatInprogress = true;
    update();
    final Networkresponse response = await Networkcall().postRequest(
        Urls.branchCreat,
        {
          "name":name,
        });

    _branchCreatInprogress = false;

    print(response.statusCode);
    update();
    if (response.statusCode == 200) {
      await getBranchData(); // Refresh branch data
      return true;
    } else {

      log(response.statusCode as String);
      return false;
    }
  }

  Future<bool> BranchDelet(String bID,) async {
    _branchDeletInprogress = true;
    update();
    print('666666666666666666666666666666666');
    final Networkresponse response = await Networkcall().deleteRequest(Urls.branchDelet(bID));
    print(response);
    _branchDeletInprogress = false;
    print(response.statusCode);
    update();
    if (response.statusCode == 200) {
      await getBranchData();
      return true;
    } else {
      log(response.statusCode.toString());
      return false;
    }
  }



}