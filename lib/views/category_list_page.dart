import 'package:flutter/material.dart';


class CategoryListPage extends StatelessWidget {
  const CategoryListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text('A$index'),
            ),
            title: Text('Todo 1'),
            subtitle: Text('Todo 1 description'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                print('delete button pressed');
              },
            ),
            onTap: () {
              print('tapped $index');
              // navigate to todo detail page
              Navigator.pushNamed(context, '/todo_detail');
            },
          );
        },
      ),
    );
  }
}
