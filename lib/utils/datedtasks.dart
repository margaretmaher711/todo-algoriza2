import 'package:flutter/material.dart';
import '../bloc/appbloc.dart';
import '../models/task_model.dart';

class DatedTasks extends StatelessWidget {
  final TaskModel task;

  const DatedTasks({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timeOfTask = AppBloc.get(context).tasks[task.id].endTime;
    String titleOfTask = AppBloc.get(context).tasks[task.id].title;

    return Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: AppBloc.get(context).taskColor[task.color],
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              children: [
                Text(timeOfTask,
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 8,
                ),
                Text(titleOfTask,
                    style: const TextStyle(fontSize: 20, color: Colors.white))
              ],
            ),
            InkWell(
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white)),
                  child: task.completed == 1
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null),
              onTap: () {
                AppBloc.get(context).updateCompleteTask(task.id);
              },
            )
          ]),
        ));
  }
}
