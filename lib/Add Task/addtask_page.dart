import 'package:flutter/material.dart';
import 'package:todoproject/Add%20Task/add_task.dart';
import '../utils/functions.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.black,
        ),
        title: Text(
          'Add task',
          style: Functions().barStyle,
        ),
        backgroundColor: Colors.white,
      ),
      body: const AddTask(),
    );
  }
}
