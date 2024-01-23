import 'package:demo_app_1/classes/language.dart';
import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:demo_app_1/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

Future<bool> signOutFromGoogle() async {
  try {
    await FirebaseAuth.instance.signOut();
    return true;
  } on Exception catch (_) {
    return false;
  }
}

class _SettingState extends State<Setting> {
  bool isDarkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          translation(context).settingPage,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            width: 300,
            height: 100,
          ),
          Center(
            child: SizedBox(
                height: 300,
                width: 300,
                child: ListView(
                  children: [
                    Container(
                      width: 300,
                      height: 30,
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              translation(context).darkMode,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                          ]),
                    ),
                    Container(
                      width: 300,
                      height: 30,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              translation(context).language,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            DropdownButton<Language>(
                                hint: Text("Language"),
                                items: Language.languageList()
                                    .map<DropdownMenuItem<Language>>(
                                        (e) => DropdownMenuItem<Language>(
                                            value: e,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[Text(e.name)],
                                            )))
                                    .toList(),
                                onChanged: (Language? language) async {
                                  if (language != null) {
                                    Locale _locale =
                                        await setLocale(language.languageCode);
                                    MyApp.setLocale(context, _locale);
                                  }
                                })
                          ]),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            fixedSize: Size.fromWidth(100),
                            padding: EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: Text(
                            "Log Out",
                            // translation(context).sign_in_button,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            await signOutFromGoogle();
                          }),
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
