import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todoproject/New%20Tasks/new.dart';
import 'package:todoproject/schedule.dart';
import 'package:todoproject/functions.dart';
import 'package:todoproject/widgets/button.dart';
import 'functions.dart';

class StartWind extends StatefulWidget {
  const StartWind({Key? key}) : super(key: key);

  @override
  State<StartWind> createState() => _StartWindState();
}

class _StartWindState extends State<StartWind> with TickerProviderStateMixin {

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Board',
          style:Functions().barStyle,
          maxLines: 1,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.schedule_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Schedule()),
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: Colors.white,
              height: 70,
              child: Row(
                children: [
                  GestureDetector(
                    child: Text(
                      'All',
                      style: Functions().secbarStyle,
                      maxLines: 1,
                    ),
                    onTap: () {
                      print("object");
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Text(
                      'Completed',
                      style: Functions().secbarStyle,
                      maxLines: 1,
                    ),
                    onTap: () {
                      print('object');
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Text(
                      'Uncompleted',
                      style: Functions().secbarStyle,
                      maxLines: 1,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    child: Text(
                      'Favorite',
                      style: Functions().secbarStyle,
                      maxLines: 1,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [MyButton(gotoNewwid, 'Add a task')],
            ),
          ),
        ],
      ),
    );
  }

  void gotoNewwid() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NewWidg()));
  }
}
