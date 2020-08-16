

import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kurs/dialog_toast/Toast_ShowDialogFunction.dart';

class toast_dialogGoster extends StatefulWidget {
@override
  _toast_dialogGosterState createState() => _toast_dialogGosterState();
}

class _toast_dialogGosterState extends State<toast_dialogGoster> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Degiskenler.title),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:100 ,right:100 ,bottom:10 ),
                child: RaisedButton(onPressed: ()=>toastGosterString("toast message"),child: Text("Toast Message"),color: Colors.teal,),
              ),
              Padding(
                padding: const EdgeInsets.only(left:100 ,right:100  ),
                child: RaisedButton(onPressed: ()=>dialogGoster(context),child: Text("Alert Dialog"),color: Colors.teal,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
