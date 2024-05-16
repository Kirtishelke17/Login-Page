import 'package:flutter/material.dart';
import 'package:login_page/form.dart';
import 'package:login_page/chat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FormScreen(),
      routes: {
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}
