import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanban_board_app/Screens/create_board/view/create_board_screen.dart';
import 'package:kanban_board_app/Screens/home_page/model/home_model.dart';
import 'package:kanban_board_app/Screens/task_page/view/task_screen.dart';
import 'package:kanban_board_app/global_variables.dart';
import 'package:kanban_board_app/images.dart';
import 'package:kanban_board_app/todo/controller/todo_controller.dart';
import 'package:kanban_board_app/todo/model/todo_model.dart';

class TodoScreen extends StatefulWidget {
  final HomeModel modelData;

  const TodoScreen({Key? key, required this.modelData}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
      init: TodoController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor.value,
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(
              widget.modelData.name,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: defaultColor.value.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 60,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            color: defaultColor.value.withOpacity(0.25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'To - Do',
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Obx(
                                () => Text(
                                  widget.modelData.todoList.length.toString(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Obx(
                          () => ListView.builder(
                            itemCount: widget.modelData.todoList.length,
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(
                                    () => TaskScreen(
                                      isTodo: true,
                                      homeModel: widget.modelData,
                                      index: index,
                                    ),
                                  );
                                },
                                child: Draggable(
                                  data: widget.modelData.todoList[index],
                                  childWhenDragging: Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.modelData.todoList[index]
                                                  .name,
                                              maxLines: 2,
                                              // data.toDoList[index].title,
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  DateFormat('jm').format(widget
                                                      .modelData
                                                      .todoList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(widget
                                                          .modelData
                                                          .todoList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 67,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    ],
                                  ),
                                  feedback: Container(
                                    width: 212,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "ijhj",
                                          widget.modelData.todoList[index].name,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        const Text(
                                          'Created At',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              // "uhjhoj",
                                              DateFormat('jm').format(widget
                                                  .modelData
                                                  .todoList[index]
                                                  .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              // "jhkj",
                                              DateFormat(', d-MM-yyyy').format(
                                                  widget
                                                      .modelData
                                                      .todoList[index]
                                                      .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 4),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // "kjhjkk",
                                          widget.modelData.todoList[index].name,
                                          maxLines: 2,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01),
                                        const Text(
                                          'Created At',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              // "gihiu",
                                              DateFormat('jm').format(widget
                                                  .modelData
                                                  .todoList[index]
                                                  .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Text(
                                              // "hhjkjh",
                                              DateFormat(', d-MM-yyyy').format(
                                                  widget
                                                      .modelData
                                                      .todoList[index]
                                                      .dateTime),
                                              style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => CreateBoardScreen(
                              isBoard: false,
                              homeModel: widget.modelData,
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: 220,
                          height: 50,
                          child: const Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 10),
                              Text(
                                "New",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                      color: defaultColor.value.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(15)),
                  child: DragTarget<TodoModel>(
                    onAcceptWithDetails: (details) {
                      int index = widget.modelData.todoList.indexWhere(
                          (element) => element.name == details.data.name);
                      widget.modelData.inProgressList
                          .add(widget.modelData.todoList[index]);
                      widget.modelData.todoList.removeAt(index);
                    },
                    builder: (BuildContext context, List<Object?> candidateData,
                        List<dynamic> rejectedData) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: defaultColor.value.withOpacity(0.25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'In - Progress',
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    widget.modelData.inProgressList.length.toString(),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount:
                                    widget.modelData.inProgressList.length,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => TaskScreen(
                                          isProgress: true,
                                          homeModel: widget.modelData,
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Draggable(
                                      data: widget
                                          .modelData.inProgressList[index],
                                      childWhenDragging: Stack(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget
                                                      .modelData
                                                      .inProgressList[index]
                                                      .name,
                                                  maxLines: 2,
                                                  // data.toDoList[index].title,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.01),
                                                const Text(
                                                  'Created At',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      DateFormat('jm').format(
                                                          widget
                                                              .modelData
                                                              .inProgressList[
                                                                  index]
                                                              .dateTime),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat(', d-MM-yyyy')
                                                          .format(widget
                                                              .modelData
                                                              .inProgressList[
                                                                  index]
                                                              .dateTime),
                                                      style: const TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 67,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2, horizontal: 4),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 8),
                                            decoration: BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                            ),
                                          ),
                                        ],
                                      ),
                                      feedback: Container(
                                        width: 212,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "ijhj",
                                              widget.modelData
                                                  .inProgressList[index].name,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  // "uhjhoj",
                                                  DateFormat('jm').format(widget
                                                      .modelData
                                                      .inProgressList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  // "jhkj",
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(widget
                                                          .modelData
                                                          .inProgressList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 4),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 8),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "kjhjkk",
                                              widget.modelData
                                                  .inProgressList[index].name,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01),
                                            const Text(
                                              'Created At',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black54,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  // "gihiu",
                                                  DateFormat('jm').format(widget
                                                      .modelData
                                                      .inProgressList[index]
                                                      .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  // "hhjkjh",
                                                  DateFormat(', d-MM-yyyy')
                                                      .format(widget
                                                          .modelData
                                                          .inProgressList[index]
                                                          .dateTime),
                                                  style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(
                                () => const CreateBoardScreen(
                                  isBoard: false,
                                ),
                              );
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 220,
                              height: 50,
                              child: const Row(
                                children: [
                                  Icon(Icons.add),
                                  SizedBox(width: 10),
                                  Text(
                                    "New",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                      color: defaultColor.value.withOpacity(0.10),
                      borderRadius: BorderRadius.circular(20)),
                  child: DragTarget<TodoModel>(
                    onAcceptWithDetails: (details) {
                      if (widget.modelData.inProgressList.indexWhere(
                              (element) => element.name == details.data.name) >
                          -1) {
                        int index = widget.modelData.inProgressList.indexWhere(
                            (element) => element.name == details.data.name);
                        widget.modelData.doneList
                            .add(widget.modelData.inProgressList[index]);
                        widget.modelData.inProgressList.removeAt(index);
                      } else {
                        Get.dialog(
                          // barrierDismissible: false,
                          AlertDialog(backgroundColor: Colors.white,
                            content: Container(
                              width: 300,
                              height: 210,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    Images.alertIcon,
                                    width: 80,
                                    height: 80,
                                  ),
                                  const Text(
                                    "A task's status cannot be changed to Done until the time is logged.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                  FloatingActionButton.extended(
                                    backgroundColor: defaultColor.value,
                                    onPressed: () {
                                      Get.back();
                                    },
                                    label: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text("Close",style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    builder: (context, candidateData, rejectedData) {
                      return Column(
                        children: [
                          Container(
                            height: 60,
                            // width: 220,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                color: defaultColor.value.withOpacity(0.25)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Done',
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Obx(
                                        () => Text(
                                      widget.modelData.doneList.length.toString(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                itemCount: widget.modelData.doneList.length,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(
                                        () => TaskScreen(
                                          isDone: true,
                                          homeModel: widget.modelData,
                                          index: index,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 4),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget
                                                .modelData.doneList[index].name,
                                            maxLines: 2,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01),
                                          const Text(
                                            'Created At',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                DateFormat('jm').format(widget
                                                    .modelData
                                                    .doneList[index]
                                                    .dateTime),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              Text(
                                                DateFormat(', d-MM-yyyy')
                                                    .format(widget
                                                        .modelData
                                                        .doneList[index]
                                                        .dateTime),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
