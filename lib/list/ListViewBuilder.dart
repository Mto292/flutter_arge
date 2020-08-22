import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

import '../dialog_toast/Toast_ShowDialogFunction.dart';

class ListViewBuilder extends StatelessWidget {
  List veriBaslik = List.generate(500, (index) => index++);
  List veriAltBaslik =
      List.generate(500, (index) => Text("Liste Alt Baslık ${index++}"));

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          primaryColor: Colors.deepOrange, accentColor: Colors.teal,primarySwatch: Colors.teal
      ) ,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Degiskenler.title),
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(5),
            itemExtent: 85, //listeler arasındaki mesafe
            itemCount: veriAltBaslik.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Container(
                    child: Card(
                        elevation: 0,
                        color: index % 2 == 0 ? Colors.teal : Colors.teal.shade200,
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.android,
                              color: Colors.teal,
                            ),
                            backgroundColor: Colors.orange,
                          ),
                          title: Text({veriBaslik[index] + 1}.toString()),
                          subtitle: Text(veriAltBaslik[index].toString()),
                          trailing: Icon(Icons.share),
                          onTap: () {
                            dialogGoster(context);
                            toastGoster(index);
                          },
                        )),
                  ),
                  (index + 1) % 5 == 0
                      ? Divider(
                    color: Colors.orange,
                    height: 1,
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  )
                      : Container(),
                ],
              );
            }),

      ),
    );
  }
}
