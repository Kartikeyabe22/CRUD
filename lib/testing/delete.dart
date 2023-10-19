import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';


class Delete extends StatelessWidget {

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
          .doc('3')
          .set({
        'wife':{
          '1':'ishita',
          '2':'shalini',
          '3':'kriti',
        }
      },
        SetOptions(merge: true),//this will basically replace the previous text and put new one
      )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    // Future<void> deleteUser() {
    //   return users
    //       .doc('ABC123')
    //       .delete()
    //       .then((value) => print("User Deleted"))
    //       .catchError((error) => print("Failed to delete user: $error"));
    // }


    Future<void> deleteField() {
      return users
          .doc('3') // Replace 'your_document_id' with the actual document ID
          .update({
        'wife.1': FieldValue.delete()
      })
          .then((value) => print("User's Property Deleted"))
          .catchError((error) => print("Failed to delete user's property: $error"));
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
          onPressed: deleteField,
          child: Text(
            "update deleted",
          ),
        ),
      ],
    );
  }
}