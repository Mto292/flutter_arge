import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

import '../dialog_toast/Toast_ShowDialogFunction.dart';

class GridViewBuilderVeBoxDecoration extends StatelessWidget {
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
        body: GridView.builder(
          primary: false,
          //liste Ekrana sigdığı zaman scrol effecti gosterilip gosterilmemesi
          scrollDirection: Axis.horizontal,
          //sağdan sola mı kaysın yoksa yükardan aşağı mı
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          //Bi Ekranda max gösterilecek liste
          // SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 520),//max alabilecegi Genişlik
          itemBuilder: (context, index) {
            return GestureDetector(
              child: Container(
                //alignment: Alignment.center,
                margin: EdgeInsets.all(10),
                //color: Colors.teal[100 * ((index + 1) % 6)],
                decoration: BoxDecoration(
                    // Decoration kulanımı
                    image: DecorationImage(
                        image: AssetImage("image/450.jpg"), fit: BoxFit.cover),
                    boxShadow: [
                      // gölgeleme efecti
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(5, 8),
                        blurRadius: 8,
                      )
                    ],
                    //borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.circle,
                    //şeklini ayarlar vermezsek defult olarak dikdörtken olur
                    border: Border.all(
                        width: 3,
                        color: Colors.red[600],
                        style: BorderStyle.solid),
                    // Etrafa cizgi cizer
                    gradient: LinearGradient(
                        //Renk geçişini ayarlar
                        colors: [Colors.teal[900], Colors.teal[100]],
                        begin: Alignment(-1, -1),
                        end: Alignment(1, 1))),
                /* child: FadeInImage.assetNetwork(
              //alignment: Alignment.bottomCenter,
              placeholder: "image/loading.gif",
              image: "https://www.livehaber.net/images/album/foto5.jpg",
              fit: BoxFit.contain,
            )*/
              ),
              onTap: () => toastGosterString("Tek Tıklama"),
              onDoubleTap: () => toastGosterString("Çift Tıklama"),
              onLongPress: () => toastGosterString("Uzun Tıklama"),
              //onHorizontalDragStart:(e) => ToastGosterString("Kaydırma Kaydırma Bilgileri:$e") ,
            );
          },
        ),
      ),
    );
  }
}
