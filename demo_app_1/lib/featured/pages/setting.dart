import 'package:demo_app_1/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Setting',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DarkMode: ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ToggleSwitch(
                    minWidth: 40,
                    minHeight: 30,
                    initialLabelIndex: 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: [
                      Icons.light_mode,
                      Icons.dark_mode,
                    ],
                    iconSize: 30.0,
                    activeBgColors: [
                      [Colors.black45, Colors.black26],
                      [Colors.yellow, Colors.orange]
                    ],
                    animate:
                        true, // with just animate set to true, default curve = Curves.easeIn
                    curve: Curves
                        .easeInCirc, // animate must be set to true when using custom curve
                    onToggle: (index) {
                      if (index == 1) {
                        Get.changeTheme(ThemeData.dark());
                      } else {
                        Get.changeTheme(ThemeData.light());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
