import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {


  TextEditingController name =  TextEditingController();
  TextEditingController age =  TextEditingController();
  TextEditingController email =  TextEditingController();




  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name": name.text,
      "email": email.text,
      "Age": age.text,
    };


    await DatabaseMethods().addUserDetails(uploaddata);
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                )
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: age,
                decoration: InputDecoration(
                  hintText: 'Age',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                )
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'email',
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                )
            ),

            ElevatedButton(
              onPressed: () {
                uploadData();
              },
              child: Text('Submit'),
            ),

          ],
        ),
      );
    }
  }

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(userInfoMap);
  }
}