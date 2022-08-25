import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/bloc/appbloc.dart';
import 'package:todoproject/bloc/states.dart';
import 'package:todoproject/utils/primary_task.dart';

class UnCompletedTasks extends StatelessWidget {
  const UnCompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
      builder: (context, state) => ListView.builder(
        itemBuilder: (context, index) => PrimaryTaskItem(
          task: AppBloc.get(context)
              .tasks
              .where((element) => element.completed == 0)
              .toList()[index],
        ),
        itemCount: AppBloc.get(context)
            .tasks
            .where((element) => element.completed == 0)
            .toList()
            .length,
      ),
    );
  }
}
