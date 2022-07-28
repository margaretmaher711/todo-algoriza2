import 'package:flutter/material.dart';

import 'sql.dart';

class Functions {
  final SqlDB sql = SqlDB();

  TextStyle get secbarStyle {
    return (TextStyle(color: Colors.grey, fontSize: 20));
  }

  TextStyle get barStyle {
    return (TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 23));
  }

  TextStyle get titlStyl {
    return (TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }

  // void gotoSched() {
  //   isertion();
  //   // Navigator.push(
  //   //     context, MaterialPageRoute(builder: (context) => Schedule()));
  // }

  // TxtForms contform = new TxtForms();
  void isertion(String nameOFtask, String startTime) {
    //contform.userInput
    print("nameOFtask  === $nameOFtask");

    sql.insertDB('''
                insert into Tasks(titel ,date ,time )
                values ("$nameOFtask" ,'7/7/2022' ,"$startTime")''');
    sql.readDB();
    // List<Map> response = sql.readDB();
    // print("============================");
    // print("$response");
  }
}
