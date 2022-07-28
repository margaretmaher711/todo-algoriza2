import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/functions.dart';
import 'package:todoproject/sql.dart';
import 'package:todoproject/widgets/button.dart';
import 'package:todoproject/widgets/txtforms.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import '../widgets/icon.dart';

class NewWidg extends StatefulWidget {
  final String? titel;
  final String? hint;
  const NewWidg({Key? key, this.titel, this.hint}) : super(key: key);

  @override
  State<NewWidg> createState() => _NewWidgState();
}

class _NewWidgState extends State<NewWidg> {
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '9:30 AM';
  String _selectedReminder = '10 min before';
  TextEditingController titleController = TextEditingController();
  TextEditingController startTimeController = TextEditingController();

  List<String> reminderList = [
    "1 day before",
    "1 hour before",
    "30 min before",
    "10 min before"
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
  }

  final SqlDB sql = SqlDB();
  DateTime selectedDate = DateTime.now();
  List<String> txts = ['Titel', 'Deadline', 'Start Time', 'End Time', 'Remind'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: Colors.black,
        ),
        title: Text(
          'Add task',
          style: Functions().barStyle,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txts[0],
                    style: Functions().titlStyl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TxtForms(
                    hint: 'Enter your task name',
                    controller: titleController,
                    widget: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    txts[1],
                    style: Functions().titlStyl,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  TxtForms(
                    hint: DateFormat.yMd().format(
                      selectedDate,
                    ),
                    controller: startTimeController,
                    widget: IconButton(
                      onPressed: () {
                        getDatefromUser();
                      },
                      icon: MyIcon(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              txts[2],
                              style: Functions().titlStyl,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TxtForms(
                              hint: _startTime,
                              widget: IconButton(
                                onPressed: () {
                                  getTimefromUser(true);
                                },
                                icon: Icon(
                                  Icons.schedule_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              txts[3],
                              style: Functions().titlStyl,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TxtForms(
                              hint: _endTime,
                              widget: IconButton(
                                onPressed: () {
                                  getTimefromUser(false);
                                },
                                icon: Icon(
                                  Icons.schedule_rounded,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(
                    txts[4],
                    style: Functions().titlStyl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TxtForms(
                    hint: _selectedReminder,
                    widget: PopupMenuButton(
                      onSelected: (val) {
                        setState(() {
                          notify();

                          _selectedReminder = val.toString();
                        });
                      },
                      icon: MyIcon(),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(reminderList[0]),
                          value: reminderList[0],
                        ),
                        PopupMenuItem(
                          child: Text(reminderList[1]),
                          value: reminderList[1],
                        ),
                        PopupMenuItem(
                          child: Text(reminderList[2]),
                          value: reminderList[2],
                        ),
                        PopupMenuItem(
                          child: Text(reminderList[3]),
                          value: reminderList[3],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  MyButton(validationDate, 'Create a task'),

/////////////////////////////////////////
                  //   FloatingActionButton(onPressed: () {
                  //     sql.insertDB('''
                  //           insert into Tasks(titel ,date ,time )
                  //           values ("second task" ,"7/11/2000" ,"15.30")''');
                  //   }),
                  //   FloatingActionButton(onPressed: () async {
                  //     List<Map> response = await sql.readDB();
                  //     print("============================");
                  //     print("$response");
                  //   }),
                  //   FloatingActionButton(onPressed: () async {
                  //     int response =
                  //         await sql.deletDB('delete from Tasks where id =7 ');
                  //     print("============================");
                  //     print("$response");
                  //   }),
                  //   FloatingActionButton(onPressed: () async {
                  //     int response = await sql.updateDB(
                  //         'update Tasks set titel = \'thired task\' where id =3 ');
                  //     print("============================");
                  //     print("$response");
                  //   }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  getDatefromUser() async {
    DateTime? chosendate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023));

    if (chosendate != null) {
      setState(() {
        selectedDate = chosendate;
      });
    }
  }

  showTime() {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: 9, minute: 10),
      initialEntryMode: TimePickerEntryMode.input,
    );
    // setState(() {
    //   _startTime = ;
    // });
  }

  getTimefromUser(bool isStartTime) async {
    var pickedTime = await showTime();
    String formatedTime = pickedTime.format(context);
    if (isStartTime == true) {
      _startTime = formatedTime;
    } else if (isStartTime == false) {
      _endTime = formatedTime;
    }
  }

  validationDate() {
    Functions().isertion(titleController.text, startTimeController.text);
  }

  void notify() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            channelKey: 'channelKey', id: 1, title: 'Hi margoo'));
  }

  deletion() async {
    int response = await sql.deletDB('delete from Tasks where id =4 ');
    print("============================");
    sql.readDB();

    print("$response");
  }
}
