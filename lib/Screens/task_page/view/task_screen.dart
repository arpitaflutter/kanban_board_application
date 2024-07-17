import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanban_board_app/Screens/create_board/view/create_board_screen.dart';
import 'package:kanban_board_app/Screens/home_page/model/home_model.dart';
import 'package:kanban_board_app/Screens/task_page/controller/task_controller.dart';
import 'package:kanban_board_app/global_variables.dart';
import 'package:kanban_board_app/l10n/app_localizations.dart';

class TaskScreen extends StatefulWidget {
  final HomeModel homeModel;
  final int index;
  final bool? isTodo;
  final bool? isProgress;
  final bool? isDone;

  const TaskScreen(
      {Key? key,
      required this.homeModel,
      required this.index,
      this.isTodo,
      this.isProgress,
      this.isDone})
      : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      init: TaskController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: defaultColor.value,
            title: Text(
              AppLocalizations.of(context)!.task,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: defaultColor.value.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.title,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: FloatingActionButton(
                              backgroundColor: defaultColor.value,
                              onPressed: () {
                                Get.to(
                                  () => CreateBoardScreen(
                                    isBoard: false,
                                    homeModel: widget.homeModel,
                                    index: widget.index,
                                    // isInTodo: isInTodo,
                                    // isInProgress: isInProgress,
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.edit,
                                size: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Obx(
                        () => Text(
                          // "vhiuvidufvudf",
                          widget.isTodo ?? false
                              ? widget.homeModel.todoList[widget.index].name
                              : widget.isProgress ?? false
                                  ? widget.homeModel
                                      .inProgressList[widget.index].name
                                  : widget
                                      .homeModel.doneList[widget.index].name,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        AppLocalizations.of(context)!.createdAt,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Text(
                              widget.isTodo ?? false
                                  ? DateFormat('jm').format(widget.homeModel
                                      .todoList[widget.index].dateTime)
                                  : widget.isProgress ?? false
                                      ? DateFormat('jm').format(widget
                                          .homeModel
                                          .inProgressList[widget.index]
                                          .dateTime)
                                      : DateFormat('jm').format(widget.homeModel
                                          .doneList[widget.index].dateTime),
                              // "hjhuhuj",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            widget.isTodo ?? false
                                ? DateFormat(', d-MM-yyyy').format(widget
                                    .homeModel.todoList[widget.index].dateTime)
                                : widget.isProgress ?? false
                                    ? DateFormat(', d-MM-yyyy').format(widget
                                        .homeModel
                                        .inProgressList[widget.index]
                                        .dateTime)
                                    : DateFormat(', d-MM-yyyy').format(widget
                                        .homeModel
                                        .doneList[widget.index]
                                        .dateTime),
                            // "jkjh",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        ),
                      ),
                      Obx(
                        () => Text(
                          widget.isTodo ?? false
                              ? widget
                                  .homeModel.todoList[widget.index].description
                              : widget.isProgress ?? false
                                  ? widget.homeModel
                                      .inProgressList[widget.index].description
                                  : widget.homeModel.doneList[widget.index]
                                      .description,
                          // "hjv",
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.isProgress ?? false,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                      ),
                      Visibility(
                        visible: widget.isProgress ?? false,
                        child: Text(
                          AppLocalizations.of(context)!.timeLog,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: widget.isProgress ?? false,
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01),
                      ),
                      Visibility(
                        visible: widget.isProgress ?? false,
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Obx(
                                () => Visibility(
                                  visible: controller.time.value.inSeconds != 0,
                                  child: Text(
                                    controller.time.value
                                        .toString()
                                        .substring(0, 4),
                                    style: TextStyle(fontSize: 25),
                                  ).marginOnly(right: 10),
                                ),
                              ),
                              FloatingActionButton.extended(
                                heroTag: 'btn5',
                                backgroundColor: defaultColor.value,
                                onPressed: () {
                                  Get.dialog(
                                    Dialog(
                                      insetPadding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05),
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 120,
                                            height: 200,
                                            child: CupertinoTimerPicker(
                                              mode: CupertinoTimerPickerMode.hm,
                                              onTimerDurationChanged: (value) {
                                                controller.duration = value;
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 120,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    controller.time.value =
                                                        controller.duration;
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .ok,
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(
                                                            context)!
                                                        .cancel,
                                                    style: const TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.watch_later),
                                label: Obx(() => Text(controller
                                            .time.value.inSeconds !=
                                        0
                                    ? AppLocalizations.of(context)!.updateTime
                                    : AppLocalizations.of(context)!.addTime)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: widget.isTodo ?? false
                          ? widget
                              .homeModel.todoList[widget.index].comment.length
                          : widget.isProgress ?? false
                              ? widget.homeModel.inProgressList[widget.index]
                                  .comment.length
                              : widget.homeModel.doneList[widget.index].comment
                                  .length,
                      itemBuilder: (context, indexs) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                    color: defaultColor.value.withOpacity(0.10),
                                  ),
                                  child: Text(
                                    widget.isTodo ?? false
                                        ? widget
                                            .homeModel
                                            .todoList[widget.index]
                                            .comment[indexs]
                                            .message
                                        : widget.isProgress ?? false
                                            ? widget
                                                .homeModel
                                                .inProgressList[widget.index]
                                                .comment[indexs]
                                                .message
                                            : widget
                                                .homeModel
                                                .doneList[widget.index]
                                                .comment[indexs]
                                                .message,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      widget.isTodo ?? false
                                          ? DateFormat('jm').format(widget
                                              .homeModel
                                              .todoList[widget.index]
                                              .comment[indexs]
                                              .time)
                                          : widget.isProgress ?? false
                                              ? DateFormat('jm').format(widget
                                                  .homeModel
                                                  .inProgressList[widget.index]
                                                  .comment[indexs]
                                                  .time)
                                              : DateFormat('jm').format(widget
                                                  .homeModel
                                                  .doneList[widget.index]
                                                  .comment[indexs]
                                                  .time),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      widget.isTodo ?? false
                                          ? DateFormat(', d-MM-yyyy').format(
                                              widget
                                                  .homeModel
                                                  .todoList[widget.index]
                                                  .dateTime)
                                          : widget.isProgress ?? false
                                              ? DateFormat(', d-MM-yyyy')
                                                  .format(widget
                                                      .homeModel
                                                      .inProgressList[
                                                          widget.index]
                                                      .dateTime)
                                              : DateFormat(', d-MM-yyyy')
                                                  .format(widget
                                                      .homeModel
                                                      .doneList[widget.index]
                                                      .dateTime),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextField(
                        onChanged: (value) {
                          controller.count.value = value.length;
                        },
                        controller: controller.txtComment,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          hintText: AppLocalizations.of(context)!.writeHere,
                        ),
                      ),
                    ),
                    Obx(
                      () => FloatingActionButton(
                        heroTag: 'btn3',
                        elevation: 0,
                        backgroundColor: controller.count.value == 0
                            ? Colors.black12
                            : defaultColor.value,
                        onPressed: () {
                          controller.addCommentData(
                            message: controller.txtComment.text,
                            homeModel: widget.homeModel,
                            index: widget.index,
                            isInDone: widget.isDone ?? false,
                            isInProgress: widget.isProgress ?? false,
                            isInToDo: widget.isTodo ?? false,
                          );
                        },
                        child: Icon(Icons.send,
                            color: controller.count.value == 0
                                ? Colors.black54
                                : null),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
