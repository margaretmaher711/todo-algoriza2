import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todoproject/bloc/appbloc.dart';
import 'package:todoproject/utils/functions.dart';
import 'package:todoproject/widgets/button.dart';
import 'package:todoproject/widgets/txtforms.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../bloc/states.dart';
import '../models/reminder_model.dart';

class AddTask extends StatefulWidget {
  final String? titel;
  final String? hint;
  const AddTask({Key? key, this.titel, this.hint}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = '9:30 AM';
  int _selectedReminder = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  Color cooo = Colors.black;

  List<ReminderModel> reminderList = [
    ReminderModel(
      minutes: 10,
      reminder: '10 minutes before',
    ),
    ReminderModel(
      minutes: 30,
      reminder: '30 minutes before',
    ),
    ReminderModel(
      minutes: 60,
      reminder: '1 hour before',
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tz.initializeTimeZones();
  }

  int selectedColorIndex = 0;
  DateTime selectedDate = DateTime.now();
  List<String> txts = ['Titel', 'Deadline', 'Start Time', 'End Time', 'Remind'];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if (state is AppDatabaseUserCreated) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20,bottom: 20),
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
                    const SizedBox(
                      height: 20,
                    ),
                    TxtForms(
                      hint: 'Enter your task name',
                      controller: _titleController,
                      widget: null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      txts[1],
                      style: Functions().titlStyl,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TxtForms(
                      function: getDatefromUser,
                      hint: DateFormat.yMd().format(
                        selectedDate,
                      ),
                      controller: _startTimeController,
                    ),
                    const SizedBox(
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
                              const SizedBox(
                                height: 20,
                              ),
                              TxtForms(
                                hint: _startTime,
                                function: getStartTimefromUser,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
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
                              const SizedBox(
                                height: 20,
                              ),
                              TxtForms(
                                hint: _endTime,
                                function: getEndTimefromUser,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      txts[4],
                      style: Functions().titlStyl,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                        hint: const Text('10 minutes before'),
                        icon: const Icon(Icons.arrow_drop_down_sharp),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey)),
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                        items: reminderList
                            .asMap()
                            .map((key, value) => MapEntry(
                                  key,
                                  DropdownMenuItem(
                                    value: value.minutes,
                                    child: Text(
                                      value.reminder,
                                    ),
                                  ),
                                ))
                            .values
                            .toList(),
                        onChanged: (value) {
                          _selectedReminder = int.parse(value.toString());
                          debugPrint('$value');
                        }),
                    Text(
                      "Color",
                      style: Functions().titlStyl,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ...AppBloc.get(context)
                            .taskColor
                            .asMap()
                            .map(
                              (key, Color value) => MapEntry(
                                key,
                                IconButton(
                                  onPressed: () {
                                    AppBloc.get(context).changeColor(key);
                                  },
                                  icon: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppBloc.get(context)
                                                    .selectedColorIndex ==
                                                key
                                            ? Colors.green
                                            : Colors.transparent,
                                        width: 3.0,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: value,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ],

                      //  ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyButton(validationDate, 'Create a task'),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
      initialTime: const TimeOfDay(hour: 9, minute: 10),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }

  getStartTimefromUser() async {
    var pickedTime = await showTime();
    String formatedTime = pickedTime.format(context);

    setState(() {
      _startTime = formatedTime;
    });
  }

  getEndTimefromUser() async {
    var pickedTime = await showTime();
    String formatedTime = pickedTime.format(context);

    setState(() {
      _endTime = formatedTime;
    });
  }

  validationDate() {
    _addTaskToDB();
  }

  void notify() async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            channelKey: 'channelKey', id: 1, title: 'Hi margoo'));
  }

  _addTaskToDB() async {
    AppBloc.get(context).insertTaskData(
        title: _titleController.text,
        date: DateFormat.yMd().format(selectedDate),
        startTime: _startTimeController.text,
        endTime: _endTime,
        reminder: _selectedReminder);
  }
}
