import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Movie extends StatefulWidget {

  final String title;
  final String genre;
  Movie({ required this.title,  required this.genre});

  Movie.fromJson(Map<String, Object?> json)
      : this(
    title: json['title']! as String,
    genre: json['genre']! as String,
  );



  Map<String, Object?> toJson() {
    return {
      'title': title,
      'genre': genre,
    };
  }



  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  final moviesRef = FirebaseFirestore.instance.collection('movies').withConverter<Movie>(
    fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
    toFirestore: (movie, _) => movie.toJson(),
  );

  Future<void> hello() async {
    // Obtain science-fiction movies
    List<QueryDocumentSnapshot<Movie>> movies = await moviesRef
        .where('genre', isEqualTo: 'Romance')
        .get()
        .then((snapshot) => snapshot.docs);

    // Add a movie
    await moviesRef.add(
      Movie(
          title: '',
          genre: 'Sci-fi'
      ),
    );

    // Get a movie with the id 42
    Movie movie42 = await moviesRef.doc('42').get().then((snapshot) => snapshot.data()!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(onPressed: (){
          hello();
        }, child: Text('Press me'))
        ],
      )
    );
  }
}


