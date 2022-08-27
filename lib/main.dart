import 'package:flutter/material.dart';
import 'package:todo_app/views/add_todo_page.dart';
import 'package:todo_app/views/home_page.dart';
import 'package:todo_app/views/login_page.dart';
import 'package:todo_app/views/my_account_page.dart';
import 'package:todo_app/views/register_page.dart';
import 'package:todo_app/views/splash_page.dart';
import 'package:todo_app/views/todo_detail_page.dart';
import 'package:todo_app/views/todo_list_page.dart';

import 'views/dashboard_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: LoginPage(),
      // routes: {
      //   "/": (context) {
      //     return MaterialPageRoute(builder: (context) => LoginPage());
      //   },
      // },
      // routes: {
      //   "/" : (context) => LoginPage(),
      //   RegisterPage.routeName: (context) => RegisterPage(),
      // },
      // initialRoute: '/todo_detail',
      onGenerateRoute: (settings) {
        var argument = settings.arguments;
        switch (settings.name) {
          case SplashPage.routeName:
            return MaterialPageRoute(builder: (context) => TodoListPage());
          case LoginPage.routeName:
            return MaterialPageRoute(builder: (context) => LoginPage());
          case '/register':
            return MaterialPageRoute(
              builder: (context) => RegisterPage(
                argument: argument as RegisterArgumentPage,
              ),
            );
          case DashboardPage.routeName: // '/main/
            return MaterialPageRoute(builder: (context) => DashboardPage());
          case '/home':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/my_account':
            return MaterialPageRoute(builder: (context) => MyAccountPage());
          case '/add_todo':
            return MaterialPageRoute(builder: (context) => AddTodoPage());
          case '/todo_list':
            return MaterialPageRoute(builder: (context) => TodoListPage());
          case '/todo_detail':
            return MaterialPageRoute(builder: (context) => TodoDetail());
          default:
            return MaterialPageRoute(builder: (context) => Scaffold());
        }
      },
    );
  }
}
