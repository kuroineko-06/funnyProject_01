import 'package:demo_app_1/featured/pages/account.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();

  void register(String name, email, password) async {
    if (_formKey.currentState!.validate()) {
      Map data = {
        "name": name,
        "email": email,
        "password": password,
      };
      print(data);
      var url = 'https://65a4e6d952f07a8b4a3de5b9.mockapi.io/api/user-manager';
      var response = await http.post(
        Uri.parse(url),
        body: data,
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Register complete!!")));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Account()));
        print('success');
      } else {
        print('error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          Indexer(
            children: <Widget>[
              Indexed(
                index: 10,
                child: SizedBox(
                  height: 500,
                  width: 350,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                        child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            // margin: EdgeInsets.only(top: 50),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  labelText: 'Name',
                                  isDense: true,
                                  hintText: 'Enter Your Name...',
                                  icon: Icon(
                                    Icons.account_box,
                                    color: Colors.amberAccent,
                                    size: 30,
                                  )),
                              keyboardType: TextInputType.name,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  name.text = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Invalid Name!!!";
                                }
                                ;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.only(top: 20),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                if (value!.isEmpty || !value.contains('@')) {
                                  return "Email need @";
                                }
                                ;
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            child: TextFormField(
                              controller: password,
                              // onChanged: () {},
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                  return 'Invalid Password!!!';
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
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(''),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                fixedSize: Size.fromWidth(100),
                                padding: EdgeInsets.all(15),
                              ),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                register(name.text, email.text, password.text);
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
