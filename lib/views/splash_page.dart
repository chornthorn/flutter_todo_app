import 'package:flutter/material.dart';
import 'package:todo_app/views/dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();
    _registerService();
  }

  var _isLogged = false;

  void _registerService() async {
    await Future.delayed(const Duration(seconds: 0),(){
      if (_isLogged){
        Navigator.of(context).pushReplacementNamed(DashboardPage.routeName,result: (route)=> false);
      }else{
        Navigator.of(context).pushNamed('/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
