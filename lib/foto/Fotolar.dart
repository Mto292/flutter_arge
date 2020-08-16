import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

class Fotolar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(Degiskenler.title),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Image ve Buton Türleri",
              style: TextStyle(fontSize: 25),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                              "https://external-preview.redd.it/oTmAqvKKo0taA2hkAZ6QI5cvA442Mwr90Dlg8bBVnSM.jpg?auto=webp&s=b4c82ba1bc8681df37bfb08585bbcc9840ea8943"),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            child: Text("MTO"),
                          ),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("image/450.jpg"),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeInImage.assetNetwork(
                              placeholder: "image/loading.gif",
                              image:
                              "https://external-preview.redd.it/oTmAqvKKo0taA2hkAZ6QI5cvA442Mwr90Dlg8bBVnSM.jpg?auto=webp&s=b4c82ba1bc8681df37bfb08585bbcc9840ea8943"),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("image/450.jpg"),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2),
                      color: Colors.blue,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Placeholder(
                              color: Colors.purple,
                            ),
                          ),
                          Text("2560x1080")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            butonlarim(),
          ],
        ),
      )
    );
  }
}


class butonlarim extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            elevation: 10,
            textColor: Colors.blue,
            color: Colors.purple,
            colorBrightness: Brightness.light,
            onPressed: () => debugPrint("Butona tıklandı"),
            child: Text("Buton"),
          ),
          RaisedButton(
            elevation: 10,
            textColor: Colors.white,
            color: Colors.green,
            colorBrightness: Brightness.light,
            splashColor: Colors.pinkAccent,
            onPressed: () => debugPrint("Butona tıklandı"),
            child: Text("Buton Tıkla ...."),
          ),
          RaisedButton(
            elevation: 10,
            textColor: Colors.pinkAccent,
            color: Colors.amber,
            colorBrightness: Brightness.light,
            onPressed: () => debugPrint("Butona tıklandı"),
            child: Text("Buton Tıkla veya Tıklama...."),
          ),
          IconButton(icon: Icon(Icons.account_box), onPressed: (){},splashColor:Colors.pinkAccent ,),
          FlatButton(onPressed: (){}, child: Text("FlatButon"))
        ],
      ),
    )
    ;
  }


}
