import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//in this we will have to pass the document id of firebase documents
class ReadDataOnce extends StatelessWidget {
  final String documentId;

  ReadDataOnce(this.documentId);



  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    //this querry snapshot is there is inspect data inside any user id
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        // if(doc['company'] =='Rehman')
        //   print(doc['company']);
      });
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc('id97GlZMm0TkRjCoV2Mc')
        .get()
        .then((DocumentSnapshot documentSnapshot){
      if (documentSnapshot.exists) {
       // print('Document data: ${documentSnapshot.data()}');
      } else {
        print('Document does not exist on the database');
      }
      try {
        dynamic nested = documentSnapshot.get(FieldPath(['wife']));
       // print(nested);
      } on StateError catch(e) {
        print('No nested field exists!');
      }
    });

    FirebaseFirestore.instance
        .collection('users')
        .where('full_name', isGreaterThanOrEqualTo: 'Su')
        .where('full_name', isLessThan: 'Sv')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
    //    print(doc['full_name']);
      });
    });

    FirebaseFirestore.instance
        .collection('users')
        .orderBy('no')
        .limitToLast(2)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc['full_name']);
      });
    });



    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {


        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            children: [
              Text( data['full_name'] ),
              Text( data['company'] ),
              Text( data['age'][0] ),
              Text( data['wife'][0] ),
            ],
          );
        }

        return Text("loading");
      },
    );
  }
}