import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  Function() goto;
  String txt;
  MyButton(this.goto,this.txt);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //عايزة اخلي تحديد النافيجيشن من برا ,يتم تحديدة في لحظة الضغط
        goto();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            txt,
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
