import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/home_page/model/home_model.dart';
import 'dart:core';

import 'package:kanban_board_app/global_variables.dart';
import 'package:kanban_board_app/todo/model/todo_model.dart';

class CreateBoardController extends GetxController {
  final bool isCreateBoard;
  final int? index;
  final HomeModel? model;
  final bool? isTodo;
  final bool? isProgress;

  CreateBoardController(
      {required this.isCreateBoard,
      this.index,
      this.model,
      this.isTodo,
      this.isProgress,
      });

  RxInt nameCount = 0.obs;
  RxInt descCount = 0.obs;

  TextEditingController txtBoardName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  void addData({required String name, required String desc}) {
    if (txtBoardName.text.isEmpty) {
      Get.snackbar("Alert", "Please Enter the Name.");
    } else if (txtDescription.text.isEmpty) {
      Get.snackbar("Alert", "Please Enter the description.");
    } else if (isCreateBoard) {
      createdBoardList.add(HomeModel(
          name: name,
          description: desc,
          todoList: RxList([]),
          inProgressList: RxList([]),
          doneList: RxList([])));
    } else if (index == null) {
      model?.todoList.add(TodoModel(
          name: name,
          description: desc,
          dateTime: DateTime.now(),
          comment: RxList([])));
    } else {
      if (isTodo ?? false) {
        model?.todoList[index ?? 0] = TodoModel(
          name: name,
          description: desc,
          dateTime: model?.todoList[index ?? 0].dateTime ?? DateTime.now(),
          comment: RxList(model?.todoList[index ?? 0].comment ?? []),
        );
      }
      else if (isProgress ?? false) {
        model?.inProgressList[index ?? 0] = TodoModel(
          name: name,
          description: desc,
          dateTime: model?.inProgressList[index ?? 0].dateTime ??
              DateTime.now(),
          comment: RxList(
              model?.inProgressList[index ?? 0].comment ?? []),
        );
      }
      else {
        model?.doneList[index ?? 0] = TodoModel(
          name: name,
          description: desc,
          dateTime:
          model?.doneList[index ?? 0].dateTime ?? DateTime.now(),
          comment:
          RxList(model?.doneList[index ?? 0].comment ?? []),
        );
      }

    }
    Get.back();
  }
}