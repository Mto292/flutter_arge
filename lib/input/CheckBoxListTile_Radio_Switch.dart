import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

import '../dialog_toast/Toast_ShowDialogFunction.dart';

class CheckBoxListTile_Radio_Switch extends StatefulWidget {
  @override
  _CheckBoxListTile_Radio_SwitchState createState() =>
      _CheckBoxListTile_Radio_SwitchState();
}

class _CheckBoxListTile_Radio_SwitchState
    extends State<CheckBoxListTile_Radio_Switch> {
  bool _checkBoxState1 = true;
  String _cbDeger;
  bool _swState = false;
  int _sliderDeger = 20;

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
        body: Container(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                        value: _checkBoxState1,
                        title: Text("CheckBox Title"),
                        subtitle: Text("CheckBox Subtitle"),
                        secondary: Icon(Icons.add),
                        onChanged: (deger) {
                          setState(() {
                            _checkBoxState1 = deger;
                            toastGosterString("cb1: $deger");
                          });
                        }),
                    SwitchListTile(
                        title: Text("Switch Title"),
                        subtitle: Text("Switch Subtitle"),
                        secondary: Icon(Icons.fingerprint),
                        value: _swState,
                        onChanged: (deger) {
                          _swState = deger;
                          setState(() {
                            toastGosterString("Switch: $deger");
                          });
                        }),
                    RadioListTile<String>(
                        title: Text("Kerkük"),
                        subtitle: Text("Radio Subtitle"),
                        secondary: Icon(Icons.map),
                        value: "Kerkük",
                        groupValue: _cbDeger,
                        onChanged: (deger) {
                          _cbDeger = deger;
                          setState(() {
                            toastGosterString("Radio1: $deger");
                          });
                        }),
                    RadioListTile<String>(
                        title: Text("Sakarya"),
                        subtitle: Text("Radio Subtitle"),
                        secondary: Icon(Icons.map),
                        value: "Sakarya",
                        groupValue: _cbDeger,
                        onChanged: (deger) {
                          _cbDeger = deger;
                          setState(() {
                            toastGosterString("Radio2: $deger");
                          });
                        }),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: "İstanbul",
                          groupValue: _cbDeger,
                          onChanged: (deger) {
                            _cbDeger = deger;
                            setState(() {
                              toastGosterString("Radio2: $deger");
                            });
                          },
                        ),
                        Radio(
                          value: "Bursa",
                          groupValue: _cbDeger,
                          onChanged: (deger) {
                            _cbDeger = deger;
                            setState(() {
                              toastGosterString("Radio2: $deger");
                            });
                          },
                        ),
                        Radio(
                          activeColor: Colors.deepOrange,
                          focusColor: Colors.blue,
                          hoverColor: Colors.tealAccent,
                          value: "Ankara",
                          groupValue: _cbDeger,
                          onChanged: (deger) {
                            _cbDeger = deger;
                            setState(() {
                              toastGosterString("Radio2: $deger");
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Slider(
                      value: _sliderDeger.toDouble(),
                      min: 0,
                      max: 100,
                      divisions: 100,
                      //kaç parçaya bölünsün
                      label: _sliderDeger.round().toString(),
                      onChanged: (deger) {
                        _sliderDeger = deger.round();
                        setState(() {});
                      },
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
