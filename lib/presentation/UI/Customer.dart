import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/presentation/State_Holder/userInfo_controller.dart';
import 'package:inventory_management/presentation/UI/endDrawer.dart';

class CustomerPage extends StatefulWidget {
  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade100,
        title: const Text(
          'Customer',
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
            child: const SingleChildScrollView(
                child: Column(
                  children: [
                    Text('Ok')
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

}