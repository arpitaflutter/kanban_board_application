import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/welcome/view/welcome_screen.dart';
import 'package:kanban_board_app/images.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAll(
        () => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              Image.asset(
                Images.logo,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Kanban Board"),
              const SizedBox(
                height: 270,
              ),
              Lottie.asset(Images.loading)
            ],
          ),
        ),
      ),
    );
  }
}
