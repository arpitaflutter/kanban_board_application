import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/task_page/model/comment_model.dart';

class TodoModel
{
  final String name;
  final String description;
  final DateTime dateTime;
  final RxList<CommentModel> comment;

  TodoModel({required this.name,required this.description,required this.dateTime,required this.comment});


}