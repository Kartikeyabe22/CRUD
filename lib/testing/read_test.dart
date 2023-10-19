

import 'package:firebase_crud_operations/testing/add_user.dart';
import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:firebase_crud_operations/testing/delete.dart';
import 'package:firebase_crud_operations/testing/updato.dart';
import 'package:firebase_crud_operations/testing/write.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';



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
                  // Text(data['full_name']),
                  //  Text(data['future affairs'].toString()),
                  // Text(data['age'].toString()),
              //    Image(image: NetworkImage(data['info.avatar'].toString())),
             (data['future affairs'] != null && data['future affairs']['Kartikeya'] != null) ?
              Text(data['future affairs']['Kartikeya'].toString())

          :  Text("Data not found for Kartikeya")

            ],
              ),
                // (data['info']!=null && data['info']['avatar']!=null && data['info']['avatar']['_byteString']!=null)?
                //     Image(image: NetworkImage(data['info']['avatar']['_byteString'])):Text('null'),

              ],
            );
          }).toList(),
        );
      },
    ),
    floatingActionButton:FloatingActionButton(onPressed: (){
   //   Navigator.push(context, MaterialPageRoute(builder: (context)=> Movie(title: 'Bareli ki Barfi', genre: 'Romance')));
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateTest('Ishita', 'ernest and young', 27)));
     // Navigator.push(context, MaterialPageRoute(builder: (context)=> Updato('ishita', 'taneja nd sons', 29)));
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Delete()));
    }),
    );
  }
}

