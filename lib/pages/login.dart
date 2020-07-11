import 'package:ecommerce_app/commons/loading.dart';
import 'package:ecommerce_app/pages/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 3;
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Column(
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
              Container(
                child: Padding(
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
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  'images/cart.png',
                                  fit: BoxFit.cover,
                                  width: 120.0,
//              height: 240.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.withOpacity(0.2),
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextFormField(
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
                                              RegExp(pattern); // ignore: missing_return
                                          if (!regex.hasMatch(value))
                                            // ignore: missing_return
                                            return 'Make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      }),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.withOpacity(0.2),
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        icon: Icon(Icons.lock_outline),
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                              child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.red.withOpacity(0.8),
                                elevation: 0.0,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if(_formKey.currentState.validate()){
                                        if(!await user.signIn(_email.text, _password.text)){
                                          _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                                        }
                                      }
                                    },
                                    minWidth: MediaQuery.of(context).size.width,
                                    child: Text("Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Forgot password",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => SignUp()));
                                        },
                                        child: Text("Create an account",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.black)),
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Or", style: TextStyle(fontSize: 20.0,color: Colors.grey)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Image.asset("images/fb.png", width: 60),
                                    ),
                                  ),
                                ),
                                Material(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Image.asset("images/googleLg.png", width: 60),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                  ),
                ),
              ),

//              Visibility(
//                visible: ,
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


}
