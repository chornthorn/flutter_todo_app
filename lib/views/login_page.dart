// create login page
import 'package:flutter/material.dart';
import 'package:todo_app/views/dashboard_page.dart';

import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // create form key
  late GlobalKey<FormState> _formKey;

  // email regex pattern
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 130),
                CircleAvatar(
                  radius: 50,
                  child: FlutterLogo(
                    size: 50,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Remember',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value != null) if (value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!_emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value != null) if (value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (value.length > 20) {
                        return 'Password must be less than 20 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 24.0),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showLoadingIndicator(context);
                        Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => DashboardPage(),
                              ),
                              (Route<dynamic> route) => false,
                            );
                          },
                        );
                      } else {
                        _showSnackBar(context, 'Please fill in the form');
                      }
                    },
                  ),
                ),
                // if don't have an account, go to register page
                const SizedBox(height: 24.0),
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: OutlinedButton(
                    child: const Text('Register'),
                    onPressed: () async{
                      // push to register page
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => RegisterPage(
                      //       deviceId: "ios001",
                      //     ),
                      //   ),
                      // );
                      final resultFromRegister = await Navigator.of(context).pushNamed(
                        RegisterPage.routeName,
                        arguments: RegisterArgumentPage(
                          deviceName: 'Nameddd',
                          deviceId: '0001',
                        ),
                      );
                      print("Result back: $resultFromRegister");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // show snackbar to show the login action failure
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  // show loading indicator when login action is in progress in alert dialog
  void _showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              const SizedBox(width: 24.0),
              Text('Logging in...'),
            ],
          ),
        );
      },
    );
  }
}
