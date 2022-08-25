import 'package:flutter/material.dart';
import 'package:todoproject/schedule/schedule.dart';
import '../utils/functions.dart';


class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

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
          'Schedule',
          style: Functions().barStyle,
        ),
        backgroundColor: Colors.white,
      ),
      body: const Schedule(),
    );
  }
}
