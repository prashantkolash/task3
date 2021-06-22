import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:flutter/painting.dart';

class loginScreen extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.tealAccent,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).size.height / 2 + 20),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15.0,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                            Icons.clear,
                            size: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.tealAccent,
                          minimumSize: Size.fromRadius(5.0),
                          shape: CircleBorder(),
                          shadowColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 80,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.tealAccent,
                    ),
                    child: Center(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            fontFamily: 'monto',
                            fontWeight: FontWeight.bold,
                            fontSize: 23.93,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _email = value;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail_outline_sharp,
                          color: Colors.tealAccent,
                        ),
                        //filled: true,
                        // fillColor: Colors.grey,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 2.0),
                        ),
                        hintText: 'Enter email id',
                      ),
                      validator:
                          ValidationBuilder().email().maxLength(50).build(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 4, 15, 20),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.tealAccent,
                        ),
                        //filled: true,
                        // fillColor: Colors.grey,
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 2.0),
                        ),
                        hintText: 'Enter Secure Password',
                      ),
                      validator: ValidationBuilder()
                          .minLength(6)
                          .maxLength(15)
                          .build(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 25.0, right: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((user) {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .pushReplacementNamed('fourth');
                          }).catchError((e) {
                            print(e);
                          });
                        },
                        child: Text('LOGIN'),
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            primary: Colors.tealAccent,
                            onPrimary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
