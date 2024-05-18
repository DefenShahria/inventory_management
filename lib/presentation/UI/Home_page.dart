import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/data/model_data/branch_data_model.dart';
import 'package:inventory_management/presentation/State_Holder/auth_controller.dart';
import 'package:inventory_management/presentation/State_Holder/branch_Controller.dart';
import 'package:inventory_management/presentation/State_Holder/userInfo_controller.dart';
import 'package:inventory_management/presentation/UI/endDrawer.dart';
import 'package:inventory_management/presentation/UI/widget/BranchCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _branchNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<UserInfoController>().getUserinfo();
      Get.find<BranchController>().getBranchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserInfoController>(builder: (userInfoController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent.shade100,
          title: Text(
            '${userInfoController.userinfoModel.responseUser?.name}',
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
          child: Column(
            children: [
              GetBuilder<BranchController>(builder: (branchController) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: branchController
                          .branchInfoModel.branches?.branches?.length ??
                          0,
                      itemBuilder: (context, index) {
                        Branch? branch = branchController
                            .branchInfoModel.branches?.branches?[index];
                        return branch != null
                            ? BranchCard(branchdata: branch)
                            : SizedBox();
                      }),
                );
              }),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent.shade100,
          onPressed: _showAddBranchDialog,
          child: Icon(Icons.add),
        ),
      );
    });
  }


  void _showAddBranchDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Branch'),
          content: TextFormField(
            controller: _branchNameController,
            decoration: InputDecoration(
              labelText: 'Branch Name',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            GetBuilder<BranchController>(
                builder: (branchController) {
                  return ElevatedButton(
                    onPressed: () {
                      CreatBranch(branchController);
                      Navigator.of(context).pop();
                    },
                    child: Text('Save'),
                  );
                }
            ),
          ],
        );
      },
    );
  }

  Future<void> CreatBranch(BranchController branchController) async {
    final response = await branchController.BranchCreat(
        _branchNameController.text.trim()
    );
    if (response) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Branch created successfully')));
        _branchNameController.clear();
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong Information! Try Again')));
      }
    }
  }


}