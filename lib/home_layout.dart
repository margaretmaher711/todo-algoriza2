import 'package:flutter/material.dart';
import 'package:todoproject/Archived%20Tasks/archived.dart';
import 'package:todoproject/Done%20Tasks/done.dart';
import 'package:todoproject/New%20Tasks/new.dart';
import 'package:todoproject/schedule.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentindx = 0;
  List<Widget> screens = [NewWidg(), DoneWidg(), Schedule()];
  List<String> titels = ['New Task', 'Done Task', 'Schedule'];

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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
            BottomNavigationBarItem(
                icon: Icon(Icons.check_circle), label: 'Done'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'Archived')
          ]),
    );
  }
}
