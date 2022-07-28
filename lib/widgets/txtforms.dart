import 'package:flutter/material.dart';

import 'package:todoproject/sql.dart';

class TxtForms extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final Widget? widget;
  TxtForms({Key? key, this.controller, this.hint, this.widget})
      : super(key: key);
  final SqlDB sql = SqlDB();

  @override
  String? vvvvv;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromARGB(255, 186, 189, 191)),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
             // readOnly: Widget == null ? false : true,
              controller: controller,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your task';
                }

                return null;
              },
              onSaved: (String? value) {
               // isertion(value);
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
                fillColor: Colors.white70,
                filled: true,
              ),
            ),
          ),
          widget == null ? Container() : Container(child: widget),
        ],
      ),
    );
  }

  void isertion(String? val) {
    //contform.userInput
    String? nameOFtask = val;
    String? deadlineDate = val;

    sql.insertDB('''
								insert into Tasks(titel ,date ,time )
								values ("$nameOFtask" ,"$deadlineDate" ,"15.30")''');
    sql.readDB();
    // List<Map> response = sql.readDB();
    // print("============================");
    // print("$response");
    // print(vvvvv);
  }
}

//////////////////////////////////


