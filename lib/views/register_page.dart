// create RegisterPage
import 'package:flutter/material.dart';

import 'home_page.dart';

class RegisterArgumentPage {
  final String deviceId;
  final String deviceName;

  RegisterArgumentPage({required this.deviceId, required this.deviceName});
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.argument}) : super(key: key);

  final RegisterArgumentPage argument;

  static const String routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameController;
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
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    print("Your device id is: ${widget.argument.deviceId}");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Register'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
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
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value != null) if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 24.0),
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
                    child: const Text('Register'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showLoadingIndicator(context);
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
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
                // if  have an account, go to login page
                const SizedBox(height: 24.0),
                Text(
                  'Do you already have an account?',
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
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.of(context).pop();
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
