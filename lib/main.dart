import 'package:ar_furniture_app/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  try{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    print("Initialized successfully!");
  }
  catch(errorMsg){
    print("Error : " + errorMsg.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martin IKEA app',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
