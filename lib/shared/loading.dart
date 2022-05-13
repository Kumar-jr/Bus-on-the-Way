import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);
  static const spinkit = SpinKitThreeBounce(
  color: Colors.white,
  size: 50.0,
);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[500],
      child: Center(
        child: spinkit,
      ),
    );
  }
}