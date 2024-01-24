//import 'dart:html';
import 'dart:convert';
import 'package:demo_app_1/classes/language.dart';
import 'package:demo_app_1/classes/language_constaits.dart';
import 'package:demo_app_1/data/sign_in_google.dart';
import 'package:demo_app_1/featured/pages/home_pages.dart';
import 'package:demo_app_1/main.dart';
import 'package:demo_app_1/service/local_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:indexed/indexed.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void Login() async {
    if (_formKey.currentState!.validate()) {
      try {
        var url =
            'https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/user-manager';
        var response = await http.get(
          Uri.parse(url),
        );
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200) {
          final List<dynamic> dataList = jsonDecode(response.body);
          for (var data in dataList) {
            String user_data = data['email'];
            String user_pass = data['password'];
            print('email: $user_data, pass: $user_pass');
            if (email.text == user_data && password.text == user_pass) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Login complete!!")));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
              break;
            } else if (email.text != user_data || password.text != user_pass) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Login faild!!")));
            }
          }
        } else {
          print('error');
        }
      } catch (e) {
        // Handle network or other errors
        print('Error: $e');
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(translation(context).accountPage),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: DropdownButton<Language>(
                padding: EdgeInsets.only(top: 1.5),
                // hint: Text(translation(context).language),
                underline: SizedBox(),
                icon: const Icon(
                  Icons.language,
                  color: Colors.red,
                  size: 25,
                ),
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                            value: e,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[Text(e.name)],
                            )))
                    .toList(),
                onChanged: (Language? language) async {
                  if (language != null) {
                    Locale _locale = await setLocale(language.languageCode);
                    MyApp.setLocale(context, _locale);
                  }
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.W8moc3fm3nvLSO90Dc_VkgHaO0?rs=1&pid=ImgDetMain'))),
          child: Column(
            children: <Widget>[
              Indexer(
                children: <Widget>[
                  Indexed(
                    index: 10,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey),
                            top: BorderSide(width: 1, color: Colors.grey),
                            right: BorderSide(width: 1, color: Colors.grey),
                            left: BorderSide(width: 1, color: Colors.grey),
                          )),
                      child: Center(
                        child: SizedBox(
                          height: 500,
                          width: 300,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 100,
                                    child: Container(
                                        margin: EdgeInsets.only(top: 50),
                                        child: Text(
                                          translation(context).login_lable,
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                Container(
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        labelText: translation(context).email,
                                        isDense: true,
                                        hintText:
                                            translation(context).emailHint,
                                        icon: Icon(
                                          Icons.email,
                                          color: Colors.amberAccent,
                                          size: 30,
                                        )),
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        email.text = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return "Invalid Email!!!";
                                      }
                                      ;
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: password,
                                    // onChanged: () {},
                                    obscuringCharacter: "*",
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      hintText:
                                          translation(context).passwordHint,
                                      labelText: translation(context).password,
                                      isDense: true,
                                      icon: Icon(
                                        Icons.lock,
                                        color: Colors.amberAccent,
                                        size: 30,
                                      ),
                                    ),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Invalid Password!';
                                      }
                                      if (value.length < 8) {
                                        return 'Password should have more 8 characters';
                                      }
                                      ;
                                    },
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        value = password.text;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 30, left: 30),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                                fixedSize: Size.fromWidth(100),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 15),
                                              ),
                                              child: Text(
                                                translation(context)
                                                    .sign_in_button,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Login();
                                              }),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                                fixedSize: Size.fromWidth(130),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10)),
                                            onPressed: () async {
                                              bool auth = await Auththentication
                                                  .authentication();
                                              if (auth == true) {
                                                print(
                                                    'Can authenticate: $auth');
                                                Get.to(() => Home());
                                              } else
                                                print("Can authenticated!");
                                            },
                                            icon: Icon(
                                              Icons.fingerprint_outlined,
                                              color: Colors.red,
                                              size: 25,
                                            ),
                                            label: Text(
                                              translation(context)
                                                  .finger_print_button,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 14),
                                  margin: EdgeInsets.only(top: 20),
                                  child: Text(
                                    translation(context).another_way,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            )),
                                        onPressed: () async {
                                          UserCredential? userCredential =
                                              await signInWithGoogle();
                                          if (userCredential != null) {
                                            print(
                                                "Google Sign-In Successful: ${userCredential.user?.displayName}");
                                            Get.to(() => Home());
                                          } else {
                                            print("Google Sign-In Failed");
                                          }
                                        },
                                        child: Container(
                                            height: 30,
                                            width: 30,
                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                "https://img.favpng.com/7/1/24/google-logo-google-search-icon-png-favpng-DLXaPGArrFH6yJjYE8USnMuvX.jpg",
                                              ),
                                            )),
                                      ),
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            )),
                                        onPressed: () async {},
                                        child: Container(
                                            height: 33,
                                            width: 33,
                                            // decoration: BoxDecoration(
                                            //     image: DecorationImage(
                                            //   fit: BoxFit.fill,
                                            //   image: NetworkImage(
                                            //     "https://img.favpng.com/5/1/2/computer-icons-email-facebook-login-bluetie-inc-png-favpng-Ax0PsRCK2i6r1W39L14bmbsC3.jpg",
                                            //   ),
                                            // )),

                                            child: Image(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                "https://img.favpng.com/5/1/2/computer-icons-email-facebook-login-bluetie-inc-png-favpng-Ax0PsRCK2i6r1W39L14bmbsC3.jpg",
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
