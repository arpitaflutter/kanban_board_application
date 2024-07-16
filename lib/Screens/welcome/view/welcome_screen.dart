import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/home_page/view/home_screen.dart';
import 'package:kanban_board_app/Screens/welcome/controller/welcome_controller.dart';
import 'package:kanban_board_app/global_variables.dart';
import 'package:kanban_board_app/images.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (value) {
                        controller.index.value = value;
                      },
                      itemCount: controller.welcomeList.length,
                      controller: controller.pageController,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              controller.welcomeList[index].image,
                              width: MediaQuery.of(context).size.width * 0.9,
                            ),
                            Text(
                              controller.welcomeList[index].name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              controller.welcomeList[index].data,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => Visibility(
                            visible: controller.index.value != 0,
                            child: FloatingActionButton(backgroundColor: defaultColor.value,
                              heroTag: "button1",
                              onPressed: () {
                                controller.pageController.animateToPage(
                                    --controller.index.value,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease);
                              },
                              child: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                            ),
                          ),
                        ),
                        FloatingActionButton(backgroundColor: defaultColor.value,
                          heroTag: "button2",
                          onPressed: () {
                            if (controller.index != 2) {
                              controller.pageController.animateToPage(
                                  ++controller.index.value,
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.ease);
                            } else {
                              Get.offAll(() => const HomeScreen());
                            }
                          },
                          child: const Icon(Icons.arrow_forward_ios,color: Colors.white,),
                        ),
                      ],
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
