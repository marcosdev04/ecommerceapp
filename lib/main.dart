import 'package:ecommerce_app/pages/home.dart';
import 'package:ecommerce_app/pages/splash.dart';
import 'package:ecommerce_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// my own imports
import './pages/login.dart';

void main() =>
   runApp(ChangeNotifierProvider(
     create: (_) => UserProvider.initialize(),
    child:  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
      home: ScreensController(),
    ),
   ));

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return Home();
      default: return Login();
    }
    return Container();
  }
}



