import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  bool _completed = false;

  // form key
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Todo',
                  ),
                  controller: _titleController,
                  validator: (value) {
                    if (value != null) if (value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description (optional)',
                  ),
                  maxLines: 4,
                  controller: _descriptionController,
                ),
                SizedBox(height: 24),
                CheckboxListTile(
                  title: Text('Completed'),
                  value: _completed,
                  onChanged: (value) {
                    print('onChanged $value');
                    setState(() {
                      _completed = value!;
                    });
                  },
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Add'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showLoadingIndicator(context);
                        // wait a few seconds
                        Future.delayed(const Duration(seconds: 2), () {
                         Navigator.of(context).pop();
                         Navigator.of(context).pop();
                        });
                      } else {
                        print('form is invalid');
                      }
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

  // show loading indicator while submitting form and dialog
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
              Text('Submitting...'),
            ],
          ),
        );
      },
    );
  }
}
