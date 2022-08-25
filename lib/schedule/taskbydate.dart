import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/bloc/states.dart';
import 'package:todoproject/schedule/schedule.dart';
import 'package:todoproject/utils/datedtasks.dart';
import '../bloc/appbloc.dart';

int sss = Schedule.selectedDate.day;
String date1 = "";
String date2 = "";

List tasksList = [];

class TaskByDate extends StatelessWidget {
  const TaskByDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    date1 = Schedule.selectedDate.day.toString();
    tasksList = AppBloc.get(context).tasks;
    print(date1);

    print(date2);
    // upDateTaskListByDate(indx);
    return BlocBuilder<AppBloc, AppStates>(
        builder: (context, state) => ListView.separated(
              itemBuilder: ((context, index) => DatedTasks(
                  task: AppBloc.get(context)
                      .tasks
                      .where((element) => upDateTaskListByDate(index))
                      .toList()[index])),
              itemCount: AppBloc.get(context)
                  .tasks
                  .where((element) =>
                      element.date.split('/')[1] ==
                      "Schedule.selectedDate.day.toString()")
                  .toList()
                  .length,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            ));
  }

  upDateTaskListByDate(int index) {
    //  TaskModel element;

    //   date2 = tasksList.;

    int result = date1.compareTo(date2);
    print("hii upDateTaskListByDate+ $result");
    if (result == 0) {
      return true;
    } else
      return false;
  }
}
