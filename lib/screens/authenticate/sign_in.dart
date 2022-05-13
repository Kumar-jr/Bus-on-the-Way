
import 'package:bus_on_the_way/services/auth.dart';
import 'package:bus_on_the_way/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';

class SignIn extends StatefulWidget {
  _SignInState createState() => _SignInState();

  final Function toogleView;
  SignIn({required this.toogleView});
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();
  //text field state
  String email = '';
  String password = '';
  String error= '';
  bool loading= false;
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0.0,
          title: Text('Sign in to Bus on the Way'),
          actions: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.brown[500]),
                backgroundColor: Colors.purple,
              ),
              onPressed: () => {
                widget.toogleView()
              },
              icon: Icon(Icons.person,),
              label: Text('Register',),
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            /*child: ElevatedButton(
              child: Text('Sign in Anon'),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('Error while Signing in!');
                } else {
                  print('Signed in!');
                  print('Anon User id: ' + result.uid);
                }
              })),
    );
    */
            key: _formKey, //state of our form for form validation
            child: Form(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email or Username'),
                    onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  }), //TextFormField
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      }),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 5,
                    ),
                    onPressed: () async{
                      if((_formKey.currentState?.validate()) == null) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() { 
                            error= 'Could not sign in with those credentials! ';
                            loading= false;
                          });
                        }
                      }
                    }
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red[500], fontSize: 15.0)
                  ),
                ],
              ),
            )));
  }
}
