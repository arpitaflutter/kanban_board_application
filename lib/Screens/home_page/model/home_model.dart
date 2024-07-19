import 'package:get/get.dart';
import 'package:kanban_board_app/todo/model/todo_model.dart';

class HomeModel {
  final String name;
  final String description;
  late final RxList<TodoModel> todoList;
  final RxList<TodoModel> inProgressList;
  final RxList<TodoModel> doneList;

  HomeModel(
      {required this.name,
      required this.description,
      required this.todoList,
      required this.inProgressList,
      required this.doneList});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        name: json["name"],
        description: json["desc"],
        todoList: json['todoList'],
        inProgressList: json['progressList'],
        doneList: json['doneList'],
      );

  Map<String, dynamic> toJson() => {
        "desc": description,
        "name": name,
        "todoList": todoList,
        "progressList": inProgressList,
        "doneList": doneList
      };
}
