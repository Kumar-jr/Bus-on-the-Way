import 'package:bus_on_the_way/screens/authenticate/register.dart';
import 'package:bus_on_the_way/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
 
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toogleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(toogleView: toogleView);
    }
    else {
      return Register(toogleView: toogleView);
    }
  }
}