import 'package:ecommerce_app/commons/loading.dart';
import 'package:ecommerce_app/db/auth.dart';
import 'package:ecommerce_app/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../db/users.dart';
import 'home.dart';
import '../commons/common.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  UserServices userServices = new UserServices();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  Auth auth;


  bool loading = false;
  bool showPass = true;
  bool showPass2 = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height / 3;
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

//          Container(
//            color: Colors.black.withOpacity(0.8),
//            width: double.infinity,
//            height: double.infinity,
//          ),
//          Container(
//            alignment: Alignment.topCenter,
//            child: Image.asset("images/lg.png", width: 280.0, height: 240.0),
//          ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 120),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350],
                            blurRadius: 20.0
                        )
                      ]
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            child: Image.asset(
                              'images/cart.png',
                              fit: BoxFit.cover,
                              width: 120.0,
//              height: 240.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0,
                              8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Full name",
                                      icon: Icon(Icons.person_outline),
                                      border: InputBorder.none),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _name,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'The name field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0,
                              8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        icon: Icon(Icons.email),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _email,
                                    // ignore: missing_return
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex =
                                        RegExp(
                                            pattern); // ignore: missing_return
                                        if (!regex.hasMatch(pattern))
                                          // ignore: missing_return
                                          return 'Make sure your email address is valid';
                                        else
                                          return null;
                                      }
                                    }),
                              ),
                            ),
                          ),
                        ),
//                        Padding(
//                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                          child: Container(
//                            color: Colors.white.withOpacity(0.5),
//                            child: Row(
//                              children: <Widget>[
//                                Expanded(
//                                    child: ListTile(
//                                        title: Text("male",
//                                            style: TextStyle(color: Colors.black),
//                                            textAlign: TextAlign.end),
//                                        trailing: Radio(
//                                            value: "male",
//                                            groupValue: groupValue,
//                                            onChanged: (e) => valueChange(e)))),
//                                Expanded(
//                                    child: ListTile(
//                                        title: Text("female",
//                                            style: TextStyle(color: Colors.black),
//                                            textAlign: TextAlign.end),
//                                        trailing: Radio(
//                                            value: "female",
//                                            groupValue: groupValue,
//                                            onChanged: (e) => valueChange(e)))),
//                              ],
//                            ),
//                          ),
//                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0,
                              8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: showPass,
                                  controller: _password,
                                  // ignore: missing_return
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'The password field cannot be empty';
                                    } else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPass = showPass ? false : true;
                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye),
                                ),
                              ),
                            ),
                          ),
                        ),
//                    Padding(
//                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                      child: Material(
//                        borderRadius: BorderRadius.circular(10.0),
//                        color: Colors.grey.withOpacity(0.2),
//                        elevation: 0.0,
//                        child: Padding(
//                          padding: const EdgeInsets.only(left: 12.0),
//                          child: ListTile(
//                            title: TextFormField(
//                              decoration: InputDecoration(
//                                  hintText: "Confirm password",
//                                  icon: Icon(Icons.lock_outline),
//                                  border: InputBorder.none),
//                              keyboardType: TextInputType.visiblePassword,
//                              obscureText: showPass2,
//                              controller: _confirmPasswordController,
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return 'The password field cannot be empty';
//                                } else if (value.length < 6) {
//                                  return "The password has to be at least 6 characters long";
//                                } else if (_passwordTextController.text !=
//                                    value) {
//                                  return "The password do not match";
//                                }
//                                return null;
//                              },
//                            ),
//                            trailing: IconButton(
//                              icon: Icon(Icons.remove_red_eye),
//                              onPressed: () {
//                                setState(() {
//                                  showPass2 = showPass2 ? false : true;
//                                });
//                              },
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0,
                              8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.deepOrange,
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    if (!await user.signUp(
                                        _name.text, _email.text,
                                        _password.text)) {
                                      _key.currentState.showSnackBar(SnackBar(
                                          content: Text("Sign Up failed")));
                                    }
                                  }
                                },
                                minWidth: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                child: Text("Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "I already have an account",
                                style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 16.0),
                                textAlign: TextAlign.center,
                              ),
                            )),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    14.0, 8.0, 14.0, 8.0),
                                child: Text(
                                  "Or Sign up with",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.grey),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                child: MaterialButton(
                                  onPressed: () async {
                                    FirebaseUser user = await auth
                                        .googleSignIn();

                                    if (user != null) {
                                      userServices.createUser({
                                        "name": user.displayName,
                                        "photo": user.photoUrl,
                                        "email": user.email,
                                        "userId": user.uid
                                      });
                                      changeScreenReplacement(context, Home());
                                    }
                                  },
                                  child: Image.asset(
                                    "images/googleLg.png", width: 60.0,),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),

//              Visibility(
//                visible: loading ?? true,
//                child: Center(
//                  child: Container(
//                    alignment: Alignment.center,
//                    color: Colors.white.withOpacity(0.9),
//                    child: CircularProgressIndicator(
//                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                    ),
//                  ),
//                ),
//              )
            ],
          ),
        ),
      ),
    );
  }

//  valueChange(e) {
//    setState(() {
//      if (e == "male") {
//        groupValue = gender = "male";
//      } else if (e == "female") {
//        groupValue = gender = "female";
//      }
//    });
//  }

//  Future validateForm() async {
//    FormState formState = _formKey.currentState;
//    if (formState.validate()) {
//      FirebaseUser user = await firebaseAuth.currentUser();
//      if (user == null) {
//        firebaseAuth
//            .createUserWithEmailAndPassword(
//            email: _email.text,
//            password: _password.text)
//            .then((value) => {
//          userServices.createUser({
//            "username": _name.text,
//            "email": _email.text,
//            "userId": value.user.uid
//          })
//        })
//            .catchError((e) => print(e.toString()));
//        Navigator.pushReplacement(
//            context, MaterialPageRoute(builder: (context) => Home()));
//      }
//    }
//  }
//}
}