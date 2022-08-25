import 'package:flutter/material.dart';
import 'package:todoproject/Add%20Task/addtask_page.dart';
import 'package:todoproject/utils/functions.dart';
import 'package:todoproject/schedule/schedule_page.dart';
import 'package:todoproject/task_states/all_task.dart';
import 'package:todoproject/task_states/completed_task.dart';
import 'package:todoproject/task_states/favorite_task.dart';
import 'package:todoproject/task_states/uncompleted_task.dart';

class StartWind extends StatefulWidget {
  const StartWind({Key? key}) : super(key: key);

  @override
  State<StartWind> createState() => _StartWindState();
}

class _StartWindState extends State<StartWind> {
  @override
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          //   elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Board',
            style: Functions().barStyle,
            maxLines: 1,
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.schedule_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SchedulePage()),
                );
              },
            )
          ],

          bottom: TabBar(
              isScrollable: true,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                    child: Text(
                  'All',
                  style: Functions().secbarStyle,
                  maxLines: 1,
                )),
                Tab(
                    child: Text(
                  'Completed',
                  style: Functions().secbarStyle,
                  maxLines: 1,
                )),
                Tab(
                    child: Text(
                  'Unompleted',
                  style: Functions().secbarStyle,
                  maxLines: 1,
                )),
                Tab(
                    child: Text(
                  'Favorite',
                  style: Functions().secbarStyle,
                  maxLines: 1,
                ))
              ]),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                child: TabBarView(
              children: [
                AllTasks(),
                CompletedTasks(),
                UnCompletedTasks(),
                FavoriteTasks()
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: MaterialButton(
                  height: 54.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Add New Task',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ));

  // void gotoNewwid() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const AddTask()));
  // }

  Widget buildpage(String txt) => Center(
        child: Text(txt),
      );
}
