import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoproject/bloc/appbloc.dart';
import 'package:todoproject/utils/primary_task.dart';
import '../bloc/states.dart';

class FavoriteTasks extends StatelessWidget {
  const FavoriteTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppStates>(
        builder: (context, state) => ListView.builder(
              itemBuilder: ((context, index) => PrimaryTaskItem(
                  task: AppBloc.get(context)
                      .tasks
                      .where((element) => element.favorite == 1)
                      .toList()[index])),
              itemCount: AppBloc.get(context)
                  .tasks
                  .where((element) => element.favorite == 1)
                  .toList()
                  .length,
            ));
 
  }
}
