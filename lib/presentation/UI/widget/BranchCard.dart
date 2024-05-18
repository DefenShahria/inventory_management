import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:inventory_management/data/model_data/branch_data_model.dart';
import 'package:inventory_management/presentation/State_Holder/branch_Controller.dart';

class BranchCard extends StatefulWidget {
  const BranchCard({
    Key? key,
    required this.branchdata,
  }) : super(key: key);

  final Branch branchdata;

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  final TextEditingController _branchNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        color: Colors.blueAccent.shade100,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: GetBuilder<BranchController>(
          builder: (branchController) {
            return SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed:(){
                        _showUpdateBranchDialog(context);
                      }, icon:  Icon(Icons.edit_note_sharp)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Branch ID: ${widget.branchdata.id}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Branch Name: ${widget.branchdata.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        DeletBranch(branchController);
                      }, icon:  Icon(Icons.delete)),
                    ],
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void _showUpdateBranchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Branch'),
          content: TextFormField(
            controller: _branchNameController,
            decoration: InputDecoration(
              labelText: 'New Branch Name',
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
                    UpdateBranch(branchController);
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> UpdateBranch(BranchController branchController) async {
    final response = await branchController.BranchUpdate(
        widget.branchdata.id.toString(),
        _branchNameController.text.trim()
    );
    if (response) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Branch Update successfully')));
        _branchNameController.clear();
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Branch Update Failed')));
      }
    }
  }

  Future<void> DeletBranch(BranchController branchController) async {
    print('555555555555555555555555');
    final response = await branchController.BranchDelet(
        widget.branchdata.id.toString(),
    );
    print(response);
    if (response) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Branch Delete successfully')));
        _branchNameController.clear();
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Branch Delete Failed')));
      }
    }
  }



}
