import 'package:flutter/material.dart';
import 'package:todoproject/Add%20Task/add_task.dart';

import 'schedule/schedule.dart';

class HomeLayout extends StatefulWidget {
 const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindx = 0;
  List<Widget> screens = [const AddTask(),const Schedule()];
  List<String> titels = ['New Task', 'Schedule'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titels[currentindx]),
      ),
      body: screens[currentindx],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentindx,
          onTap: (index) {
            setState(() {
              currentindx = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle), label: 'Done'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'Archived')
          ]),
    );
  }
}
