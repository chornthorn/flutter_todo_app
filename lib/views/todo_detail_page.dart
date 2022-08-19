import 'package:flutter/material.dart';

class TodoDetail extends StatefulWidget {
  const TodoDetail({Key? key}) : super(key: key);

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo title: ',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: const Text('Lorum ipsum dolor sit amet'),
              ),
              const SizedBox(height: 8),
              Text(
                'Todo description: ',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                child: const Text(
                    ', consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
              ),
              const SizedBox(height: 16),
              Text(
                'Todo start date: ',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Text(
                '2020-01-01',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Todo time: ',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 8),
              Text(
                '12:00',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 16),
              // action buttons for delete and edit
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Edit'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
