import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appbloc.dart';
import '../bloc/states.dart';
import '../utils/primary_task.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => PrimaryTaskItem(
            task: AppBloc.get(context)
                .tasks
                .where((element) => element.completed == 1)
                .toList()[index],
          ),
          itemCount: AppBloc.get(context)
              .tasks
              .where((element) => element.completed == 1)
              .toList()
              .length,
        );
      },
    );
  }
}
