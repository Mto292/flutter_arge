import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';


class appbar extends StatefulWidget {
  @override
  _appbarState createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 36,),
          GFAppBar(
            leading:  GFIconButton(
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {},
              type: GFButtonType.transparent,
            ),
            title: Text("GF Appbar"),
            actions: <Widget>[
              GFIconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {},
                type: GFButtonType.transparent,
              ),
            ],
          ),
          SizedBox(height: 36,),
          GFAppBar(
            leading:  GFIconButton(
              icon: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () {},
              type: GFButtonType.transparent,
            ),
            searchBar: true,
            title: Text("GF Appbar"),
            actions: <Widget>[
              GFIconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () {},
                type: GFButtonType.transparent,
              ),
            ],
          ),
        ],

      ),


    );
  }
}
