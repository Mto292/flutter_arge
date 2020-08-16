import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/Users/MTO/Desktop/flutter_kurs/lib/dialog_toast/Toast_ShowDialogFunction.dart';
import 'package:flutter_kurs/GlobalDegiskenler/GlobalDegiskenler.dart';

class TextFormInput extends StatefulWidget {
  @override
  _TextFormInputState createState() => _TextFormInputState();
}

class _TextFormInputState extends State<TextFormInput> {
  String adSoyad, email, sifre, telNumarasi;
  bool autoValiDate = false, sifreGorunurluk = true;
  final formKey = GlobalKey<
      FormState>(); //Formda validate lerin o ankli durumlarına erişebilmek için kullanılır
  // GlobalKey ise uygulamanın her yerinde farklı keyler için farklı ID atanır FormState ise O anki deger demek oluyor

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
          child: SingleChildScrollView(
            child: Form(
                autovalidate: autoValiDate,
                key: formKey,
                child: Column(
                  children: <Widget>[
                    //AD soyad
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 32, right: 32),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Ad Soyadınızı Giriniz ",
                            labelText: "Ad Soyad",
                            labelStyle: TextStyle(color: Colors.pink),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.pink,
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.pink, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                                gapPadding: 10)),
                        validator: _adDogrula,
                        onSaved: (deger) => adSoyad = deger,
                      ),
                    ),
                    //Email
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 32, right: 32),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email Adresinizi Giriniz ",
                            labelText: "Email",
                            labelStyle: TextStyle(color: Colors.teal),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.teal,
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                                gapPadding: 10)),
                        validator: _emailDogrula,
                        onSaved: (deger) => email = deger,
                      ),
                    ),
                    //Phone
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 32, right: 32, top: 20),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                            hintText: "(5xx) ",
                            labelText: "Phone",
                            labelStyle: TextStyle(color: Colors.red),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.red,
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                                gapPadding: 10)),
                        validator: _telDogrula,
                        onSaved: (deger) => telNumarasi = deger,
                      ),
                    ),
                    //Şifre
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 20, left: 32, right: 32),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: sifreGorunurluk,
                        //şifre görünürlük
                        maxLength: 20,
                        decoration: InputDecoration(
                            hintText: "Şifrenizi Giriniz ",
                            labelText: "Şifre",
                            labelStyle: TextStyle(color: Colors.green),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.green,
                            ),
                            suffixIcon: GestureDetector(
                              child: Icon(Icons.remove_red_eye),
                              onTap: _sifreGoster,
                            ),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 2)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.purple, width: 2),
                                gapPadding: 10)),
                        validator: _sifreDogrula,
                        onSaved: (deger) => sifre = deger,
                      ),
                    ),
                    RaisedButton.icon(
                      onPressed: _verileriKayitEt,
                      icon: Icon(Icons.save),
                      label: Text("Kaydet"),
                      color: Colors.deepOrangeAccent,
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  String _adDogrula(String value) {
    String p = '^[a-zA-ZğüşıçöĞÜŞİÇÖ ]+\$';
    RegExp regExp = new RegExp(p);

    if (!regExp.hasMatch(value) || value.length < 4) {
      return "Lütfen Adınızı Doğru Giriniz";
    } else {
      return null;
    }
  }

  String _telDogrula(String value) {
    String p = r'^(?:[+0]9)?[0-9]{10}$';
    RegExp regExp = new RegExp(p);

    if (!regExp.hasMatch(value)) {
      return "Lütfen Numararnızı Doğru Giriniz";
    } else if (value.substring(0, 1) == "0") {
      return "Numaranızı Başında '0' Olmadan giriniz";
    } else {
      return null;
    }
  }

  String _sifreDogrula(String value) {
    if (value.length < 8) {
      return "Şifreniz 8 Karakterden Fazla Olması Gerekiyor";
    } else {
      return null;
    }
  }

  String _emailDogrula(String value) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(p);

    if (!regExp.hasMatch(value)) {
      return "Lütfen Mailinizi Doğru Giriniz";
    } else {
      return null;
    }
  }

  void _verileriKayitEt() {
    if (formKey.currentState.validate()) {
      //Hata Varmı
      formKey.currentState
          .save(); //textFormField taki tüm onSaved metodlarını tetikle
      String deger = "$adSoyad\n$email\n$telNumarasi\n$sifre";
      toastGosterString(deger);
    } else {
      //butona tıklandığı zaman validate sürekli olarak calışsın(canlı denetleme yapsın)
      setState(() {
        autoValiDate = true;
      });
    }
  }

  void _sifreGoster() {
    setState(() {
      sifreGorunurluk = !sifreGorunurluk;
    });
  }
}
