import 'package:get/get.dart';
import 'package:kanban_board_app/todo/model/todo_model.dart';

class HomeModel {
  final String name;
  final String description;
  final RxList<TodoModel> todoList;
  final RxList<TodoModel> inProgressList;
  final RxList<TodoModel> doneList;

  HomeModel(
      {required this.name,
      required this.description,
      required this.todoList,
      required this.inProgressList,
      required this.doneList});
}
