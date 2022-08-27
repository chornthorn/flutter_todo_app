import 'package:flutter/material.dart';
import 'package:todo_app/views/todo_detail_page.dart';

import 'add_todo_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  int _featureItemCount = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          // search button
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print('search button pressed');
              _openSearchDialog(context);
            },
          ),
          // filter button
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              print('filter button pressed');
              _openFilterMenu(context);
            },
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: 10,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       leading: CircleAvatar(
      //         child: Text('A$index'),
      //       ),
      //       title: Text('Todo 1'),
      //       subtitle: Text('Todo 1 description'),
      //       trailing: IconButton(
      //         icon: const Icon(Icons.delete),
      //         onPressed: () {
      //           print('delete button pressed');
      //           _showDeleteDialog(context);
      //         },
      //       ),
      //       onTap: () {
      //         print('tapped $index');
      //         // navigate to todo detail page
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => TodoDetail(),
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
      body: ListView(
        children: [
          Container(
            width: 200,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(
              width: 1,
              color: Colors.grey.withOpacity(0.5),
            )),
            padding: EdgeInsets.all(24),
            alignment: Alignment.center,
            margin: EdgeInsets.all(16),
            child: Text("Slide Banner"),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Spacer(),
                Text(
                  "View all",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ...List.generate(
                    3,
                    (index) => Container(
                      width: 200,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 8),
                      child: Text("Hello $index"),
                    ),
                  ),
                  Text('20+ more'),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Feature",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ...List.generate(
                    _featureItemCount,
                    (index) => Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      )),
                      padding: EdgeInsets.all(24),
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 8),
                      child: Text("Hello $index"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _featureItemCount = 20;
                      });
                    },
                    child: Text("20+ more"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('floating action button pressed');
          // navigate to the add todo page by using a material page route
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoPage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // create a dialog to confirm the delete action
  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete'),
          content: Text('Are you sure you want to delete this item?'),
          actions: [
            OutlinedButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _showSnackBar(context);
              },
            ),
          ],
        );
      },
    );
  }

  // create snackbar to show the delete action
  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Item deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            print('undo button pressed');
          },
        ),
      ),
    );
  }

  // open menu for filtering
  void _openFilterMenu(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 100,
        0,
        0,
        MediaQuery.of(context).size.height,
      ),
      items: [
        PopupMenuItem(
          child: Text('All'),
          value: 0,
        ),
        PopupMenuItem(
          child: Text('Completed'),
          value: 1,
        ),
        PopupMenuItem(
          child: Text('Incomplete'),
          value: 2,
        ),
      ],
    );
  }

  // open dialog to input search text
  void _openSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Search'),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          actions: [
            OutlinedButton(
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
