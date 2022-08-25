import 'package:sqflite/sqflite.dart';
import 'package:todoproject/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class AppBloc extends Cubit<AppStates> {
  AppBloc() : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);
  late Database _database;

  void intialDB() async {
    var databasePath = await getDatabasesPath();
    String path = p.join(databasePath, 'tasks.db');
    debugPrint('AppDatabaseInitialized');

    openAppDatabase(
      path: path,
    );
    emit(AppDatabaseInitialized());
  }

  void openAppDatabase({
    required String path,
  }) async {
    openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE tasks (id INTEGER PRIMARY KEY,
            title TEXT, date TEXT, startTime TEXT,
            endTime TEXT,
            reminder INTEGER,
            color INTEGER,
            completed INTEGER,
            favorite INTEGER)
                              ''').then((value) {
          print('created');
        });
      },
      onOpen: (Database db) {
        debugPrint('AppDatabaseOpened');
        _database = db;

        getTasksData();
        emit(AppDatabaseUserCreated());
      },
    );
  }

  void insertTaskData({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required int reminder,
  }) async {
    await _database.transaction(
      (txn) async {
        int id = await txn.rawInsert(
          'INSERT INTO tasks (title, date, startTime, endTime, reminder, color, completed, favorite)'
          ' VALUES ("$title", "$date", "$startTime", "$endTime", $reminder, $selectedColorIndex, 0,0 )',
        );
        debugPrint('Task Inserted');
      },
    ).then((value) {
      debugPrint('Task Data Inserted');

      // usernameController.clear();
      getTasksData();

      emit(AppDatabaseUserCreated());
    });
  }

  List<TaskModel> tasks = [];

  void getTasksData() async {
    emit(AppDatabaseLoading());

    tasks = [];

    _database.rawQuery('SELECT * FROM tasks').then((value) {
      debugPrint('Tasks Data Fetched');
      debugPrint(value.toString());

      for (var element in value) {
        tasks.add(TaskModel.fromJson(element));
      }

      debugPrint(tasks.toString());
      emit(AppDatabaseUsers());
    });
  }

  void updateCompleteTask(int taskId) async {
    int completed =
        tasks.firstWhere((element) => element.id == taskId).completed == 1
            ? 0
            : 1;

    _database.rawUpdate('UPDATE tasks SET completed = ? WHERE id = $taskId',
        [completed]).then((value) {
      debugPrint('Task Data Updated');
      getTasksData();
    });
  }

  void updateFavoriteTask(int taskId) async {
    int favorite =
        tasks.firstWhere((element) => element.id == taskId).favorite == 1
            ? 0
            : 1;

    _database.rawUpdate('UPDATE tasks SET favorite = ? WHERE id = $taskId',
        [favorite]).then((value) {
      debugPrint('Task Data Updated');
      getTasksData();
    });
  }

  int selectedColorIndex = 0;

  List<MaterialColor> taskColor = [
    Colors.red,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple
  ];

  void changeColor(index) {
    selectedColorIndex = index;
    emit(TaskColorChanged());
  }
}
