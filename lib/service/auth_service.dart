import 'package:budget_tracker/screen/dashboard.dart';
import 'package:budget_tracker/service/db.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  var db = Db();
  Future<void> createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: data['email'], password: data['password']);
      await db.addUser(data, context);
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Sign up Failed'),
              content: Text(e.toString()),
            );
          });
    }
  }

  Future<void> login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: data['email'], password: data['password']);
      if (context.mounted) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Login Error'),
              content: Text(e.toString()),
            );
          });
    }
  }
}
