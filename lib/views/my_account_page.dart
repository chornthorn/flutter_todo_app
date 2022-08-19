import 'package:flutter/material.dart';
import 'package:todo_app/views/login_page.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(Icons.person, size: 60),
                ),
              ),
            ),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 24),
            Text(
              'jonhdeo@example.com',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24),
            Text(
              '+1 (123) 456-7890',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24),
            // logout button
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                onPressed: () {
                 // push to login page
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
