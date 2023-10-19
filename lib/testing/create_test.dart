import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateTest extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  CreateTest(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'full_name': fullName, // John Doe
        'company': company, // Stokes and Sons
        'age' :[
          age.toString(),  // with comma different names samajhega
          '78'
        ] ,
        'no':'54',
        'wife':{
          'Salim':'Suzanne',  // no comma to ye dona naam same lega

        }
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children:[

      TextButton(
        onPressed:(){
        addUser();
        },
        child: Text(
          "Add User",
        ),
      ),
      TextButton(
        onPressed:(){
         Navigator.pop(context);
        },
        child: Text(
          "Press me to go back",
        ),
      ),
    ]
    );
  }
}