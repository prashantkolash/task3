import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginRegister extends StatefulWidget {
  @override
  _loginRegisterState createState() => _loginRegisterState();
}

class _loginRegisterState extends State<loginRegister> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(320.0)),
          color: Colors.tealAccent,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 600,
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'GO',
                  style: TextStyle(
                      fontFamily: 'monto',
                      fontWeight: FontWeight.bold,
                      fontSize: 75.0,
                      color: Colors.tealAccent),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 + 40,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 + 25,
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'third');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.tealAccent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))
                      //    onSurface: Colors.tealAccent,
                      ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'second');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.tealAccent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0))
                      //    onSurface: Colors.tealAccent,
                      ),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
