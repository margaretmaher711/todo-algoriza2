import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/bloc/appbloc.dart';
import 'package:todoproject/bloc/states.dart';
import 'package:todoproject/schedule/taskbydate.dart';

class Schedule extends StatefulWidget {
  static DateTime selectedDate = DateTime.now();

  const Schedule({
    Key? key,
  }) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // DateTime dt = DateTime.tryParse(  DateFormat.MMMd().format(DateTime.now()));
  // DateTime dt =new DateTime.now();
  //  final TaskModel task;

  // ignore: recursive_getters

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            DatePicker(
              DateTime.now(),
              height: 80,
              width: 60,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.green,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                setState(() {
                  Schedule.selectedDate = date;
                });
                print(Schedule.selectedDate.day.toString());
                print(
                    AppBloc.get(context).tasks.toList()[1].date.split('/')[1]);
              
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: TaskByDate()),
          ],
        ),
      ),
    );
  }

 

}
