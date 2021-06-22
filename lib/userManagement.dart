import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagement {
  String docId;
  storeNewUser(user, displayName, context) {
    FirebaseFirestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
      'display Name': displayName,
    }).then((value) {
      docId = value.id;
      FirebaseFirestore.instance
          .collection('/users')
          .doc(value.id)
          .update({'docId': value.id});
      Navigator.pop(context);
      Navigator.of(context).pushReplacementNamed('fourth', arguments: docId);
    }).catchError((e) {
      print(e);
    });
  }
}
