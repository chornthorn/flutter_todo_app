import 'package:flutter/material.dart';

import 'add_todo_page.dart';
import 'my_account_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remember is a game'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dashboard Overview',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 24),
                  Card(
                    color: Colors.purple,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Todos',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          // progress bar
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '50% completed',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Card(
                    color: Colors.indigoAccent,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 24),
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          // progress bar
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '50% completed',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Card(
                    color: Colors.pinkAccent,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This week',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 24),
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          // progress bar
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '50% completed',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Card(
                    color: Colors.blueAccent,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'This month',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(height: 24),
                          Text(
                            '10',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          // progress bar
                          LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor: Colors.grey[200],
                            valueColor: AlwaysStoppedAnimation(Colors.green),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '50% completed',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
