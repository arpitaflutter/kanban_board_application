import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/home_page/model/home_model.dart';
import 'package:kanban_board_app/Screens/task_page/model/comment_model.dart';

class TaskController extends GetxController {
  RxInt count = 0.obs;
  TextEditingController txtComment = TextEditingController();
  Rx<Duration> time = const Duration().obs;
  Duration duration = const Duration();

  void addCommentData({
    required String message,
    required HomeModel homeModel,
    required int index,
    required bool isInToDo,
    required bool isInProgress,
    required bool isInDone,
  }) {
    if (isInToDo) {
      print(homeModel.todoList[index].name);

      homeModel.todoList[index].comment
          .add(CommentModel(message: message, time: DateTime.now()));
    } else if (isInProgress) {
      homeModel.inProgressList[index].comment
          .add(CommentModel(message: message, time: DateTime.now()));
    } else if (isInDone) {
      homeModel.doneList[index].comment
          .add(CommentModel(message: message, time: DateTime.now()));
    }
    txtComment.clear();
    count.value = 0;
  }
}
