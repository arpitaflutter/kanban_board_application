import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/create_board/controller/create_board_controller.dart';
import 'package:kanban_board_app/Screens/create_board/view/create_board_screen.dart';
import 'package:kanban_board_app/Screens/home_page/controller/home_controller.dart';
import 'package:kanban_board_app/Screens/setting_page/view/setting_screen.dart';
import 'package:kanban_board_app/images.dart';
import 'package:kanban_board_app/l10n/app_localizations.dart';
import 'package:kanban_board_app/todo/view/todo_screen.dart';
import 'package:kanban_board_app/global_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CreateBoardController createBoardController = Get.put(CreateBoardController());
  @override
  void initState() {
    super.initState();
    createBoardController.readData();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Obx(
          () => Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: defaultColor.value,
              title: Text(
                AppLocalizations.of(context)!.kanbanBoard,
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(() => SettingScreen());
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: createdBoardList.isEmpty
                  ? Center(child: Image.asset(Images.noData))
                  : GridView.builder(
                      itemCount: createdBoardList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.7),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Get.to(
                              () => TodoScreen(
                                modelData: createdBoardList[index],
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            decoration: BoxDecoration(
                              color: defaultColor.value.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    createdBoardList[index]['name'],
                                    // "Kanban Board App app",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  height: 60,
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: defaultColor.value.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    createdBoardList[index]['desc'],
                                    // "Create the Kanban Board App",
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: defaultColor.value.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.toDo,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Obx(
                                        ()=> Text(
                                          // "0",
                                          "${createdBoardList[index]['todoList'].length}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: defaultColor.value.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.inProgress,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Obx(
                                        ()=> Text(
                                          // "0",
                                          "${createdBoardList[index]['progressList'].length}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: defaultColor.value.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.done,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Obx(
                                        ()=> Text(
                                          // "0",
                                          "${createdBoardList[index]['doneList'].length}",
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            floatingActionButton: Obx(
              ()=> FloatingActionButton(
                backgroundColor: defaultColor.value,
                onPressed: () {
                  Get.to(
                    () => CreateBoardScreen(
                      isBoard: true,
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
