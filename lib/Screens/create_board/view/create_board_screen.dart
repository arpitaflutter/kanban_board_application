import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/create_board/controller/create_board_controller.dart';
import 'package:kanban_board_app/Screens/home_page/model/home_model.dart';
import 'package:kanban_board_app/global_variables.dart';

class CreateBoardScreen extends StatefulWidget {
  final bool isBoard;
  final int? index;
  final HomeModel? homeModel;
  final bool? isProgress;
  final bool? isTodo;

  const CreateBoardScreen(
      {Key? key,
      required this.isBoard,
      this.index,
      this.homeModel,
      this.isProgress,
      this.isTodo})
      : super(key: key);

  @override
  State<CreateBoardScreen> createState() => _CreateBoardScreenState();
}

class _CreateBoardScreenState extends State<CreateBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateBoardController>(
      init: CreateBoardController(
          isCreateBoard: widget.isBoard,
          index: widget.index,
          isProgress: widget.isProgress,
          isTodo: widget.isTodo,
          model: widget.homeModel),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor.value,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              widget.isBoard == true ? "Create Board" : "Create New Task",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.isBoard == true ? "Board Name: " : "Title",
                    style: const TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  TextField(
                    controller: controller.txtBoardName,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Description: ",
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  TextField(
                    controller: controller.txtDescription,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            width: 110,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: FloatingActionButton(
              onPressed: () {
                controller.addData(
                    name: controller.txtBoardName.text,
                    desc: controller.txtDescription.text);
                // Get.to(()=> TodoScreen());
              },
              backgroundColor: defaultColor.value,
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    widget.index == null ? "Create" : "Update",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
