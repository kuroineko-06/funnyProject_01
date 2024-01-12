import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
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
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://th.bing.com/th/id/OIP.W8moc3fm3nvLSO90Dc_VkgHaO0?rs=1&pid=ImgDetMain'))),
          child: Column(
            children: <Widget>[
              Indexer(
                children: <Widget>[
                  Indexed(
                    index: 1000,
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
                                        email = value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          value.contains('@')) {
                                        return "Invalid Email!!!";
                                      }
                                      ;
                                    },
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: TextFormField(
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
                                SizedBox(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: 20, left: 10),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.teal,
                                          fixedSize: Size.fromWidth(100),
                                          padding: EdgeInsets.all(10),
                                        ),
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: _submit,
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
