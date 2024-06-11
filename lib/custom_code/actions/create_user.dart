// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentReference> createUser(
  String email,
  String password,
  String role,
  String createdOn,
  String displayname,
  String fname,
  String lname,
) async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    // Create a new user
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? newUser = userCredential.user;

    // Update the user display name
    await newUser?.updateDisplayName(displayname);

    // Create a user document in Firestore using the User Id
    DocumentReference userDoc =
        _firestore.collection('users').doc(newUser?.uid);

    await userDoc.set({
      'display_name': displayname,
      'created_time': createdOn,
      'fname': fname,
      'lname': lname,
      'role': role,
    });

    return userDoc;
  } catch (e) {
    // Handle errors here
    print("Error creating user: $e");
    throw e;
  }
}
