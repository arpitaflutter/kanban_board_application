import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/Screens/setting_page/controller/setting_controller.dart';
import 'package:kanban_board_app/global_variables.dart';
import 'package:kanban_board_app/l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor.value,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            AppLocalizations.of(context)!.helloWorld,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: GetBuilder<SettingController>(
          init: SettingController(),
          builder: (controller) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.appLanguage,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width * 1.0,
                      child: DropdownButton<String>(
                        value: controller.locale.value.languageCode,
                        items: <String>['en', 'es'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value == 'en' ? 'English' : 'Spanish'),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          controller.changeLocale(newValue.toString());
                        },
                        icon: const Icon(Icons.keyboard_arrow_down),
                        // padding: const EdgeInsets.all(4),
                        isExpanded: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.appTheme,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.14,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.colors.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            controller.changeIndex(index: index);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: MediaQuery.of(context).size.width * 0.1,
                            width: MediaQuery.of(context).size.width * 0.14,
                            color: controller.colors[index],
                            alignment: Alignment.center,
                            child: Visibility(
                              visible: controller.colors[index] ==
                                  defaultColor.value,
                              child:
                                  const Icon(Icons.done, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
