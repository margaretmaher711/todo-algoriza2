import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'date',
                      style: subStyle,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text('my task', style: subStyle)
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get subStyle {
    return (GoogleFonts.belleza(
        textStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)));
  }
}
