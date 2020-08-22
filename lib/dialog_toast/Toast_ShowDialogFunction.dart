import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

dialogGoster(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context){
      return  AlertDialog(
        title: Text("Title"),
        content: SingleChildScrollView(
          //Ekrana sığmadığı zaman scrol sekline getirir
          child: ListBody(
            //bir scrol yapısı icinde birden fazla child eklememize olanak tanır
            children: <Widget>[
              Text("Alt Başlık 1"),
              Text("Alt Başlık 2"),
              Text("Alt Başlık 3"),
              Text("Alt Başlık 4"),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("Tamam")),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("Iptal")),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text("Çık")),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      );
    }
  );
}

toastGoster(int index) {
  Fluttertoast.showToast(
      msg: "Index $index",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}

toastGosterString(String str) {
  Fluttertoast.showToast(
      msg: "$str",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0);
}
