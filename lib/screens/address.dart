import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task3/userManagement.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  UserManagement user = new UserManagement();
  String _address;
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              maxLines: 5,
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
                ),
                hintText: 'Enter Your Address',
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('/users')
                          .doc(args)
                          .update({'address': _address});
                      Toast.show(
                          'Address has been updated to Firestore', context,
                          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                      Navigator.pop(context);
                    },
                    child: Text('ADD ADDRESS'))),
          ],
        ),
      ),
    );
  }
}
