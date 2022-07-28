import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoproject/New%20Tasks/new.dart';
import 'package:todoproject/home_layout.dart';
import 'package:todoproject/schedule.dart';
import 'package:todoproject/sql.dart';
import 'package:todoproject/startwindow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoproject/utils/local_notifications.dart';
import 'package:todoproject/widgets/createdtasks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'channelKey',
        channelName: 'channelName',
        channelDescription: 'channelDescription',
        defaultColor: Colors.blue,
        playSound: true,
       // soundSource: 'url',
        enableLights: true)
  ]);
  // NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SqlDB sql = SqlDB();

  @override
  void initState() {
    super.initState();
    sql.intialDB();
  }

  @override
  Widget build(BuildContext context) {
    return StartWind();
  }

  TextStyle get subStyle {
    return (GoogleFonts.lato(
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  }
}
