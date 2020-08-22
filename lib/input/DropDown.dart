import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';
import 'package:flutter_kurs/dialog_toast/Toast_ShowDialogFunction.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String _dropDownSecilen = "kirmizi", _secilenSehir;
  List<String> _sehirlerListe = ["Kerkük", "Türkye", "Azerbaycan"];

  @override
  Widget build(BuildContext context) {
    _secilenSehir = _sehirlerListe[0];
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Dropdown Statik",
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton(
                      value: _dropDownSecilen,
                      items: [
                        DropdownMenuItem(
                            value: "kirmizi",
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 7,
                                  ),
                                ),
                                Text("Kırmızı"),
                              ],
                            )),
                        DropdownMenuItem(
                            value: "mavi",
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 7,
                                  ),
                                ),
                                Text("Mavi"),
                              ],
                            )),
                        DropdownMenuItem(
                            value: "yesil",
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 7,
                                  ),
                                ),
                                Text("Yeşil"),
                              ],
                            )),
                      ],
                      onChanged: (secilen) {
                        toastGosterString(secilen);
                        setState(() {
                          _dropDownSecilen = secilen;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "DropDown Dinamik",
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<String>(
                      value: _secilenSehir,
                      items: _sehirlerListe.map((e) {
                        return DropdownMenuItem<String>(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: e == "Kerkük"
                                      ? Colors.blue
                                      : e == "Türkye"
                                      ? Colors.red
                                      : e == "Azerbaycan"
                                      ? Colors.green
                                      : Colors.white,
                                  radius: 7,
                                ),
                              ),
                              Text(e)
                            ],
                          ),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (secilen) {
                        toastGosterString(secilen);
                        setState(() {
                          _secilenSehir = secilen;
                        });
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
