import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';


class Updato extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  Updato(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Future<void> addUser() {
    //   // Call the user's CollectionReference to add a new user
    //   return users
    //       .add({
    //     'full_name': fullName, // John Doe
    //     'company': company, // Stokes and Sons
    //     'age': age // 42
    //   })
    //       .then((value) => print("User Added"))
    //       .catchError((error) => print("Failed to add user: $error"));
    // }

//this is when you wanna give a unique id to your document
    Future<void> addUser() {
      return users
          .doc('1')
          .set({
        'full_name': "shami ",
        'age': 21,
        'future affairs':{
          'Kartikeya':'Yes',
          'Nakul': 'No',
        }
      },
        SetOptions(merge: true),//this will basically replace the previous text and put new one
      )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    // Future<void> updateUser() {
    //   return users
    //       .doc('1')
    //       .update({'munna bhai':'watched'})
    //       .then((value) => print("User Updated"))
    //       .catchError((error) => print("Failed to update user: $error"));
    // }


    Future<void> updateUser() {
      return rootBundle
          .load('assets/images/sample.jpg')
          .then((bytes) => bytes.buffer.asUint8List())
          .then((avatar) {
        return users
            .doc('1')
            .update({'info.avatar': Blob(avatar)});
      })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: addUser,
          child: Text(
            "Add User",
          ),
        ),
        ElevatedButton(
          onPressed: updateUser,
          child: Text(
            "update User",
          ),
        ),
      ],
    );
  }
}