import 'package:flutter/material.dart';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/functions.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // DateTime dt = DateTime.tryParse(  DateFormat.MMMd().format(DateTime.now()));
  // DateTime dt =new DateTime.now();
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.black,
        ),
        title: Text(
          'Schedule',
          style: Functions().barStyle,
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Container(
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.green,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  _selectedDate = date;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(DateFormat.yMMMd().format(DateTime.now()));
              },
              child: null,
            )
          ],
        ),
      ),
    );
  }
}
