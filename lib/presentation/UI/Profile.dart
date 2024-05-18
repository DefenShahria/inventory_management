import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/presentation/State_Holder/userInfo_controller.dart';
import 'package:inventory_management/presentation/UI/endDrawer.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final TextEditingController _firstnameTEC = TextEditingController();
  final TextEditingController _businessTypeEC = TextEditingController();
  final TextEditingController _imgTEC = TextEditingController();

  int userID = 0 ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade100,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          const Icon(Icons.notifications_none),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.segment_rounded),
            ),
          ),
        ],
      ),
      endDrawer: const CustomEndDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(Duration.zero, () {
                Get.find<UserInfoController>().getUserinfo();
              });
            },
            child: SingleChildScrollView(
              child: GetBuilder<UserInfoController>(
                builder: (userInfoController) {
                  return Column(
                    children: [
                      TextFormField(
                        controller: _firstnameTEC,
                        decoration: InputDecoration(
                          labelText: '${userInfoController.userinfoModel.responseUser?.name}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        controller: _businessTypeEC,
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.businessTypeId}'
                        ),
                      ),
                      const SizedBox(height: 8,),

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.email}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.phone}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.businessName}'
                        ),
                      ),

                      const SizedBox(height: 8,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.businessType}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.companyId}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: '${userInfoController.userinfoModel.responseUser?.branchId}'
                        ),
                      ),
                      const SizedBox(height: 8,),
                      GetBuilder<UserInfoController>(
                        builder: (userInfoController) {
                          return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(onPressed: (){
                                UserinfoUpdate(userInfoController);
                              }, child: const Text('Update')));
                        }
                      )

                    ],
                  );
                }
              )
            ),
          ),
        ),
      ),
    );
  }

  Future<void> UserinfoUpdate(UserInfoController controller) async {
    final response = await controller.UserinfoUpdate(

        _firstnameTEC.text.trim(),
        _businessTypeEC.text.trim(),
      _imgTEC.text.trim()


    );

    if (response) {
      if (mounted) {
        _firstnameTEC.clear();
        _businessTypeEC.clear();
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile Update Successful!')));
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong Information! Try Again')));
      }

    }
  }
}