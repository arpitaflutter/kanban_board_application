import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:kanban_board_app/Screens/welcome/model/welcome_model.dart';
import 'package:kanban_board_app/images.dart';

class WelcomeController extends GetxController {
  List<WelcomeModel> welcomeList = <WelcomeModel>[
    WelcomeModel(
        name: "Welcome to Our Kanban app!",
        data:
            "Our app helps you manage your project with ease.\nUse our kanban board to stay on the top of your task and visualize your progress.",
        image: Images.welcome),
    WelcomeModel(
        name: "Add Board",
        data:
            "Create a board for your project.Add a title and description for your project.",
        image: Images.addBoard),
    WelcomeModel(
        name: "Drag And Drop",
        data:
            'Drag  and drop your cards to move theme between lists. Move cards from "To do" to "To Progress" When you are ready to start eorking on them.',
        image: Images.dragDrop),
  ];

  PageController pageController = PageController();
  RxInt index = 0.obs;
  RxBool indexIsNotZero = false.obs;
}
