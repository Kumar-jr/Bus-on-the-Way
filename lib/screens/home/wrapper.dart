
import 'package:bus_on_the_way/screens/authenticate/authenticate.dart';
import 'package:bus_on_the_way/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:bus_on_the_way/screens/home/home.dart';
import 'package:provider/provider.dart';
import 'package:bus_on_the_way/models/newUser.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<newUser?>(context);
    //print(user);
    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //return either Home or Authenticate widget
   
  }
}