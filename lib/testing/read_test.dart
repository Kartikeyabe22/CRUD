import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ReadTest extends StatefulWidget {
  @override
  _ReadTestState createState() => _ReadTestState();
}

class _ReadTestState extends State<ReadTest> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Column(
              children:[
                Column(
                children:[
                  Text(data['full_name']),
                  Text(data['company']),
                  Text(data['age'][0].toString()),
                ]
              ),
              ]
            );
          }).toList(),
        );
      },
    ),
    floatingActionButton:FloatingActionButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateTest('Sunita ', 'Rani', 26)));
    }),
    );
  }
}

