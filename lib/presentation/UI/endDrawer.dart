import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/presentation/State_Holder/userInfo_controller.dart';
import 'package:inventory_management/presentation/UI/Customer.dart';
import 'package:inventory_management/presentation/UI/Home_page.dart';
import 'package:inventory_management/presentation/UI/Profile.dart';

class CustomEndDrawer extends StatelessWidget {
  const CustomEndDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(
      builder: (userInfoController) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.indigoAccent.shade100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(''), // Update with actual image path
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${userInfoController.userinfoModel.responseUser?.name}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${userInfoController.userinfoModel.responseUser?.email}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8,left: 8),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    _buildDrawerItem('Profile', () {
                      Get.to(EditProfile());
                    }),
                    const SizedBox(height: 8),
                    _buildDrawerItem('Branch', () {
                      Get.to(const HomePage());
                    }),
                    const SizedBox(height: 8),
                    _buildDrawerItem('Customer', () {
                      Get.to(CustomerPage());
                    }),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }

  Widget _buildDrawerItem(String title, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: ListTile(
        title: Center(child: Text(title)),
        onTap: onTap,
      ),
    );
  }
}
