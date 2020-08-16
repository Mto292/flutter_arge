import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';
import 'package:flutter_kurs/searchbar/SearchBar.dart';
import 'package:flutter_kurs/shimmer/Shimmer.dart';
import 'package:flutter_kurs/tapBar/TabBar.dart';
import 'accordion/Accordion.dart';
import 'appbar/Appbar.dart';
import 'dialog_toast/toast_dialogGoster.dart';
import 'draggable/draggable.dart';
import 'draggable/draggable2.dart';
import 'draggable/draggable3.dart';
import 'foto/Fotolar.dart';
import 'input/CheckBoxListTile_Radio_Switch.dart';
import 'input/DropDown.dart';
import 'input/Stepper.dart';
import 'input/TextFormInput.dart';
import 'input/TextInput.dart';
import 'list/Carousel.dart';
import 'list/CustomScrolView_SliverAppBar.dart';
import 'list/GridViewBuilder_BoxDecoration.dart';
import 'list/ListViewBuilder.dart';
import 'list/Listeler.dart';


class Anamenu extends StatefulWidget {
  @override
  _AnamenuState createState() => _AnamenuState();
}

class _AnamenuState extends State<Anamenu> {
  List<String> uyeler = [
    "CheckBoxListTile_Radio_Switch",
    "DropDown",
    "TextFormInput",
    "TextInput",
    "Fotolar",
    "Listeler",
    "ListViewBuilder",
    "GridViewBuilderVeBoxDecoration",
    "CustomScrolView_SliverAppBar",
    "toastGoster_dialogGoster",
    "stepper",
    "Carousel",
    "TabBar",
    "Accordion",
    "AppBar",
    "SearchBar",
    "Shimmer",
    "Draggable",
    "Draggable2",
    "Draggable3",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
          primaryColor: Colors.deepOrange, accentColor: Colors.teal,primarySwatch: Colors.teal
      ) ,
      routes: {
        "/0": (context) => CheckBoxListTile_Radio_Switch(),
        "/1": (context) => DropDown(),
        "/2": (context) => TextFormInput(),
        "/3": (context) => TextInput(),
        "/4": (context) => Fotolar(),
        "/5": (context) => Listeler(),
        "/6": (context) => ListViewBuilder(),
        "/7": (context) => GridViewBuilderVeBoxDecoration(),
        "/8": (context) => CustomScrolView_SliverAppBar(),
        "/9": (context) => toast_dialogGoster(),
        "/10": (context) => stepper(),
        "/11": (context) => Carousel(),
        "/12": (context) => tabBar(),
        "/13": (context) => Accordion(),
        "/14": (context) => appbar(),
        "/15": (context) => SearchBar(),
        "/16": (context) => Shimmer(),
        "/17": (context) => draggable(),
        "/18": (context) => Draggable2(),
        "/19": (context) => Draggable3(),

      },

      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              snap: false,
              //appbar kaydırmada listenin üstüne gelmeden hemen insin mi
              pinned: true,
              //app barın kayıp kaymaması
              stretch: true,
              floating: false,
              //
              primary: true,
              //ust bar sebeke pili kaldırıp app barın ustune atar
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Anamenü",style: TextStyle(color: Colors.deepOrange),),
                titlePadding: EdgeInsets.all(16),
                background: FlutterLogo(colors: Colors.deepOrange),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              _butonlariOlustur,
              childCount: uyeler.length,
            ))
          ],
        ),
      ),
    );
  }

  Widget _butonlariOlustur(BuildContext context, int index) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            child: ListTile(
              title: Text(
                uyeler[index],
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.navigate_next),
            ),
          ),
        ),
        onTap: () {
          Degiskenler.title = uyeler[index];
          Navigator.pushNamed(context, "/$index");
        });
  }
}
