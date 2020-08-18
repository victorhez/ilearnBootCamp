import 'package:flutter/material.dart';
import 'package:ilearn/CoursePage.dart';
import 'package:ilearn/SignUP.dart';
import 'package:ilearn/mainPage.dart';
import 'mainActivity.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Text("Sign In",
                  style: TextStyle(color: Colors.orange, fontSize: 30)),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/image/img1.png"),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 30),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Value can't be empty";
                          }
                          if (!value.contains("@")) {
                            return "invalid Email";
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Value can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.orange),
                        child: Center(
                          child: Text("Sign Up"),
                        ),
                      ),
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account! ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Sign Up",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16))
                        ])))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
