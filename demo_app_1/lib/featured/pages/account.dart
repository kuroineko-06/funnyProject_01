import 'dart:convert';

import 'package:demo_app_1/featured/pages/home_pages.dart';
import 'package:demo_app_1/service/local_auth_service.dart';
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
  final email = TextEditingController();
  final password = TextEditingController();

  void Login(email, password) async {
    if (_formKey.currentState!.validate()) {
      Map data = {
        "email": email,
        "password": password,
      };
      print(data);
      var url = 'https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/user-manager';
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login complete!!")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
        print('success');
      } else {
        print('error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Account'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                                          'Login Here',
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
                                        labelText: 'Email',
                                        isDense: true,
                                        hintText: 'Enter Your Email...',
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
                                      hintText: "Enter password",
                                      labelText: 'Password',
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
                                                padding: EdgeInsets.all(15),
                                              ),
                                              child: Text(
                                                "Sign In",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              onPressed: () {
                                                Login(
                                                    email.text, password.text);
                                              }),
                                          ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                                fixedSize: Size.fromWidth(150),
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
                                              size: 30,
                                            ),
                                            label: Text(
                                              'FingerPrint',
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
                                    "Another way??",
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
                                        onPressed: () {
                                          //Code Here
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              'https://img.favpng.com/7/1/24/google-logo-google-search-icon-png-favpng-DLXaPGArrFH6yJjYE8USnMuvX.jpg',
                                            ),
                                          )),
                                        ),
                                      ),
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            )),
                                        onPressed: () {
                                          //Code Here
                                        },
                                        child: Container(
                                          height: 33,
                                          width: 33,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              'https://img.favpng.com/5/1/2/computer-icons-email-facebook-login-bluetie-inc-png-favpng-Ax0PsRCK2i6r1W39L14bmbsC3.jpg',
                                            ),
                                          )),
                                        ),
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
