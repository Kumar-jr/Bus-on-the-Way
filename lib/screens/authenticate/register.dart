import 'package:bus_on_the_way/services/auth.dart';
import 'package:bus_on_the_way/shared/constants.dart';
import 'package:bus_on_the_way/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
final Function toogleView;
  Register({required this.toogleView});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //text field state
  String email= '';
  String password= '';
  String error= '';
  bool loading= false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.purple,
          elevation: 0.0,
          title: Text('Sign up to Bus on the Way'),
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
              label: Text('Sign in',),
            ),
          ],
        ),
        
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey , //state of our form for form validation
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email or Username'),
                    validator: (value) => value!.isEmpty ? 'Enter an email' : null,
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
                    validator: (value) => value!.length < 6 ? 'Password must be atleast 6 characters' : null,
                    obscureText: true, 
                  onChanged: (val) {
                     setState(() {
                      password = val;
                    });
                  }),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    child: const Text('Register'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      onPrimary: Colors.white,
                      shadowColor: Colors.blueAccent,
                      elevation: 5,
                    ),
                    onPressed: () async{
                      if(_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                             error= 'Invalid email format. Please supply a valid email';
                             loading= false;
                          });
                        }
                      //print(email);
                      //print(password);
                      }
                    },
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