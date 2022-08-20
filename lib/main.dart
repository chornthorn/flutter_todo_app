import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/views/login_page.dart';

import 'views/dashboard_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  print(getApplicationDocumentsDirectory());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(),
    );
  }
}
