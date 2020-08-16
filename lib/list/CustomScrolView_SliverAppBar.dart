import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

class CustomScrolView_SliverAppBar extends StatelessWidget {
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black87,
              expandedHeight: 200,
              floating: false,
              //listeninin başına gelindiği zaman appbarın acılması veya herhangi kaydırmada bile açılması
              pinned: true,
              //appbarın surekli görünür olup olamaması
              snap: false,
              //true: az bi kaydırmada olsa bile appbar aşağı iner
              // title: Text("Flutter Dersleri"),
              flexibleSpace: FlexibleSpaceBar(
                //Aşağı açılan appbarın icini özeliklerini düzenler
                background: Image.asset(
                  "image/450.jpg",
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "CustomScrolView",
                  style: TextStyle(color: Colors.red[600]),
                ),
                centerTitle: false,
                titlePadding: EdgeInsets.only(left: 25, bottom: 25),
              ),
            ),

            SliverGrid(
                //List Uyeleri Sabit veya dinamik Olması
                delegate: SliverChildListDelegate(SabitSliverListUyeler()),
                gridDelegate: //Gridin Çalışma Mantığı
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4)),
            SliverGrid(
                delegate: //List Uyeleri Sabit veya dinamik Olması
                    SliverChildBuilderDelegate(DinamikListeOlustur,
                        childCount: 4),
                gridDelegate: //Gridin Çalışma Mantığı
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4)),
            SliverList(
              //Sliver sabit Listeyi icerir
              delegate: SliverChildListDelegate(SabitSliverListUyeler()),
            ),
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverList(
                  //Dinamnik Listeyi oluşturmak
                  delegate: SliverChildBuilderDelegate(DinamikListeOlustur,
                      childCount: 4)),
            ),
            SliverFixedExtentList(
                delegate: SliverChildListDelegate(SabitSliverListUyeler()),
                itemExtent: 150),
            //Yükseklik Vermek istersek SliverFixedExtentlist Kulanırız üstekiler ile hiç bi farkı yoktur
            SliverPadding(
              padding: EdgeInsets.all(15),
              sliver: SliverFixedExtentList(
                  delegate: SliverChildBuilderDelegate(DinamikListeOlustur,
                      childCount: 4),
                  itemExtent: 150)
              //Yükseklik Vermek istersek SliverFixedExtentlist Kulanırız üstekiler ile hiç bi farkı yoktur
              ,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> SabitSliverListUyeler() {
    return [
      Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.teal,
        child: Text(
          "Sliver List Üyesi 1",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.red,
        child: Text(
          "Sliver List Üyesi 2",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.indigo,
        child: Text(
          "Sliver List Üyesi 3",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
      Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.tealAccent,
        child: Text(
          "Sliver List Üyesi 4",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22),
        ),
      ),
    ];
  }

  Widget DinamikListeOlustur(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      color: rastgeleReng(),
      child: Text(
        "Sliver Dinamik List Üyesi ${index + 1}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 22),
      ),
    );
  }

  rastgeleReng() => Color.fromARGB(
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255));
}
