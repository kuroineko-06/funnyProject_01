import 'package:demo_app_1/featured/pages/account.dart';
import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String email = "test@gmail.com";
  String password = "test123";

  void _submit() {
    if (email == emailController.text && password == passwordController.text) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Account()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid data')),
      );
      passwordController.text = "";
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
                              controller: emailController,
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
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                setState(() {
                                  email = value;
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
                              controller: emailController,
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
                                  email = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty || value.contains('@')) {
                                  return "Invalid Email!!!";
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
                              controller: passwordController,
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
                                if (value!.isEmpty && value.length < 8) {
                                  return 'Invalid Password!';
                                }
                                ;
                              },
                              onFieldSubmitted: (value) {
                                setState(() {
                                  value = password;
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
                              onPressed: _submit,
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
