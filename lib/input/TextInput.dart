import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'file:///C:/Users/MTO/Desktop/flutter_kurs/lib/dialog_toast/Toast_ShowDialogFunction.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String text = "";
  FocusNode _fNode1, _fNode2;
  int maxLine1 = 1, maxLine2 = 1;
  TextEditingController _textEditingController1, _textEditingController2;

  @override
  void initState() {
    // TODO implement initState
    super.initState();
    _textEditingController1 = TextEditingController();
    _textEditingController2 = TextEditingController();
    _textEditingController1.text = "Varsayılan Text";
    _textEditingController2.text;
    _fNode1 = FocusNode(); //focus Node Oluşturur
    _fNode2 = FocusNode(); //focus Node Oluşturur
    _fNode1.addListener(() {
      setState(() {
        _fNode1.hasFocus ? maxLine1 = 3 : maxLine1 = 1;
        _fNode2.hasFocus ? maxLine2 = 3 : maxLine2 = 1;
      });
    });
  }

  @override
  void dispose() {
    //uygualama kapandiği veya sayfa sonlandırıldı zaman çalıstırılır
    _textEditingController1.dispose();
    _textEditingController2.dispose();
    _fNode1.dispose(); // unfocus yapıp focus verilerini siler
    _fNode2.dispose(); // unfocus yapıp focus verilerini siler
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.deepOrange,
          accentColor: Colors.teal,
          primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text(Degiskenler.title),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: MediaQuery.of(context).size.width,
            color: Colors.teal,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    autofocus: false,
                    focusNode: _fNode1,
                    maxLines: maxLine1,
                    maxLength: 30,
                    maxLengthEnforced: true,
                    cursorColor: Colors.purple,
                    onChanged: (String s) => toastGosterString("onChanged: " + s),
                    onSubmitted: (String s) {
                      text = s;
                    },
                    decoration: InputDecoration(
                      hintText: "hintText",
                      hintMaxLines: 10,
                      //errorText: "errorText",
                      errorMaxLines: 10,
                      helperText: "helperText",
                      helperMaxLines: 10,
                      labelText: "labelText",
                      icon: Icon(Icons.edit),
                      prefixIcon: Icon(Icons.add),
                      suffixIcon: Icon(Icons.print),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Colors.red.shade100,
                      filled: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _textEditingController2,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.go,
                    autofocus: false,
                    focusNode: _fNode2,
                    maxLines: maxLine2,
                    maxLength: 30,
                    maxLengthEnforced: true,
                    cursorColor: Colors.purple,
                    onChanged: (String s) => toastGosterString("onChanged: " + s),
                    onSubmitted: (String s) {
                      text = s;
                    },
                    decoration: InputDecoration(
                      hintText: "hintText",
                      hintMaxLines: 10,
                      //errorText: "errorText",
                      errorMaxLines: 10,
                      helperText: "helperText",
                      helperMaxLines: 10,
                      labelText: "labelText",
                      icon: Icon(Icons.edit),
                      prefixIcon: Icon(Icons.add),
                      suffixIcon: Icon(Icons.print),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.tealAccent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Colors.red.shade200,
                      filled: true,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: FlatButton.icon(
                        onPressed: () {
                          _fNode2.hasFocus
                              ? FocusScope.of(context).unfocus()
                              : _fNode1.hasFocus
                                  ? FocusScope.of(context).nextFocus()
                                  : FocusScope.of(context).requestFocus(_fNode1);
                          _fNode2.hasFocus ? maxLine2 = 1 : null;
                          setState(() {});
                        },
                        icon: Icon(Icons.center_focus_strong),
                        label: Text("Fokusla"),
                        color: Colors.orange,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: FlatButton.icon(
                        onPressed: () {
                          _textEditingController2.text =
                              _textEditingController1.text;
                          setState(() {});
                        },
                        icon: Icon(Icons.content_copy),
                        label: Text("Aşağı Kopyala"),
                        color: Colors.orange,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
