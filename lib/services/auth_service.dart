// import 'package:bt/screens/dashboard.dart';
// import 'package:bt/services/db.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthService {
//   var db = Db();
//   createUser(data, context) async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: data['email'],
//         password: data['password'],
//       );
//       await db.addUser(data, context);
//       Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder: (context) => Dashboard()));
//     } catch (e) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Sign up Failed"),
//               content: Text(e.toString()),
//             );
//           });
//     }
//   }

//   login(data, context) async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: data['email'],
//         password: data['password'],
//       );
//       // Navigator.push(
//       //     context, MaterialPageRoute(builder: (context) => Dashboard()));
//     } catch (e) {
//       showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text("Login Error"),
//               content: Text(e.toString()),
//             );
//           });
//     }
//   }
// }

import 'package:bt/screens/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Db {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(Map<String, dynamic> data, BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser.uid;
    return _firestore.collection('users').doc(userId).set(data);
  }
}

class AuthService {
  var db = Db();
  createUser(data, context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      await db.addUser(data, context);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Sign up Failed"),
              content: Text(e.toString()),
            );
          });
    }
  }

  login(data, context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: data['email'],
        password: data['password'],
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Login Error"),
              content: Text(e.toString()),
            );
          });
    }
  }
}
