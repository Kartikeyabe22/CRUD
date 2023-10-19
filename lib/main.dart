import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud_operations/create.dart';
import 'package:firebase_crud_operations/testing/create_test.dart';
import 'package:firebase_crud_operations/testing/read_data_once.dart';
import 'package:firebase_crud_operations/testing/read_test.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: ReadTest(),
      //home:CreateTest('Vipin', 'Dreams',20),
      // home:ReadDataOnce('id97GlZMm0TkRjCoV2Mc')
    );
  }
}
