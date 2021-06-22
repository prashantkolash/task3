import 'package:flutter/material.dart';
import 'package:task3/userManagement.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task3/userManagement.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_validator/form_validator.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _email;
  String _password;
  String _displayName;
  UserManagement userManagement = UserManagement();
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Firebase.initializeApp();
  // }

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
                        'Register',
                        style: TextStyle(
                            fontFamily: 'monto',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
                          _displayName = value;
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_sharp,
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
                        hintText: 'Display name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4),
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
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 20),
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
                        child: Text('Register'),
                        onPressed: () {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password)
                              .then((signedInUser) {
                            userManagement.storeNewUser(
                                signedInUser.user, _displayName, context);
                          }).catchError((e) {
                            print(e);
                          });
                        },
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
