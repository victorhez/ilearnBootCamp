import 'package:flutter/material.dart';
import 'package:ilearn/CoursePage.dart';
import 'package:ilearn/Login.dart';
import 'package:ilearn/mainActivity.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpClass();
  }
}

class SignUpClass extends StatefulWidget {
  @override
  _SignUpClassState createState() => _SignUpClassState();
}

class _SignUpClassState extends State<SignUpClass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.orange),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "Create Account",
              style: TextStyle(color: Colors.orange, fontSize: 30),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 50,
                child: Icon(Icons.person_add),
                //backgroundImage: AssetImage("assets/image/profilePic.png"),
              ),
            ),
            Text("Upload Profile Picture"),
            SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Field can't be empty";
                          }
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.blue),
                            labelText: "First Name",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Last name can't be empty";
                          }
                        },
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Colors.blue),
                            labelText: "Last Name",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Email can't be empty";
                          }
                          if (!value.contains("@")) {
                            return "Invalid Email";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.blue,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80)),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Empty password";
                          }
                          if (value.length <= 6) {
                            return "Must be up to 6digits";
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.blue,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoursePage()));
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
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: RichText(
                            text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: "Already have an account! ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                              text: "Sign In",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16))
                        ])))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
