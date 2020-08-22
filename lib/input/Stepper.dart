import 'package:flutter/material.dart';
import 'package:flutter_kurs/dialog_toast/Toast_ShowDialogFunction.dart';

class stepper extends StatefulWidget {
  @override
  _StepperState createState() => _StepperState();
}




class _StepperState extends State<stepper> {
  int aktifAdim = 0;
  var _stepperType = StepperType.horizontal;

  TextEditingController _telController = TextEditingController();
  TextEditingController _kodController = TextEditingController();
  TextEditingController _adController = TextEditingController();

  String _telefonNo = "";
  String _aktivasyonKodu = "";
  String _adSoyad = "";

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
      ),
      floatingActionButton: GestureDetector(
          child: CircleAvatar(
            child: Icon(
              Icons.list,
            ),
          ),
          onTap: () {
            setState(() {

              if (_stepperType == StepperType.horizontal) {
                _stepperType = StepperType.vertical;
              } else {
                _stepperType = StepperType.horizontal;
              }
            });
          }),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              steps: _tumAdimlar(),
              type: _stepperType,
              currentStep: aktifAdim,
              controlsBuilder: (BuildContext context,
                  {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                return Row(
                  children: <Widget>[
                    RaisedButton(
                        child: aktifAdim == 0
                            ? Text("Kod Gönder")
                            : aktifAdim == 1
                                ? Text("Onayla")
                                : Text("Tamamla"),
                        color: Colors.teal,
                        onPressed: onStepContinue),
                  ],
                );
              },
              onStepContinue: () {
                setState(() {
                  if(aktifAdim == 0  ) {
                    _telefonNo = _telController.text ;
                  }else if(aktifAdim == 1  ) {
                    _aktivasyonKodu = _kodController.text  ;
                  }else {
                    _adSoyad = _adController.text;
                    toastGosterString(_adSoyad+"\n"+_telefonNo+"\n"+_aktivasyonKodu);

                  }
                  if (aktifAdim < _tumAdimlar().length - 1) {
                    aktifAdim++;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (aktifAdim > 0) {
                    aktifAdim--;
                  }
                });
              },
              onStepTapped: (int index) {

              },
            ),
          ),
        ],
      ),
    );
  }

  List<Step> _tumAdimlar() {
    List<Step> adimlar = [
      Step(
          title: _stepperType != StepperType.horizontal
              ? Text("Telefon Numarası")
              : Text(""),
          isActive: aktifAdim == 0 ? true : false,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _stepperType == StepperType.horizontal
                  ?  Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text(
                        "Telefon Numarası",
                      )
              ):SizedBox(),
              SizedBox(
                height:_stepperType == StepperType.horizontal
                    ? 14
                    : 0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: TextFormField(
                  controller: _telController,
                  decoration: InputDecoration(
                      hintText: "Telefon numaranızı giriniz",
                      labelText: "Telefon",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.deepOrange.shade50,
                      filled: true,
                      prefixIcon: Icon(Icons.phone_iphone)),
                ),
              ),
            ],
          ),
          state:  aktifAdim == 0 ? StepState.editing:aktifAdim > 0 ? StepState.complete:StepState.disabled),
      Step(
          title: _stepperType != StepperType.horizontal
              ? Text("Aktivasyon kodu")
              : Text(""),
          isActive: aktifAdim == 1 ? true : false,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _stepperType == StepperType.horizontal
                  ?  Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Aktivasyon kodu",
                  )
              ):SizedBox(),
              SizedBox(
                height:_stepperType == StepperType.horizontal
                    ? 14
                    : 0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: TextFormField(
                  controller: _kodController,
                  decoration: InputDecoration(
                      hintText: "Aktivasyon kodunuzu giriniz",
                      labelText: "Aktivasyon Kodu",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.deepOrange.shade50,
                      filled: true,
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
            ],
          ),
          state: aktifAdim == 1 ? StepState.editing:aktifAdim > 1 ? StepState.complete:StepState.disabled),
      Step(
          title: _stepperType != StepperType.horizontal
              ? Text("Ad Soyad")
              : Text(""),
          isActive: aktifAdim == 2 ? true : false,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _stepperType == StepperType.horizontal
                  ?  Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Text(
                    "Ad Soyad",
                  )
              ):SizedBox(),
              SizedBox(
                height:_stepperType == StepperType.horizontal
                    ? 14
                    : 0,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: TextFormField(
                  controller: _adController,
                  decoration: InputDecoration(
                      hintText: "Ad soyadınızı giriniz",
                      labelText: "Ad soyad",
                      border: UnderlineInputBorder(),
                      fillColor: Colors.deepOrange.shade50,
                      filled: true,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
            ],
          ),
          state: aktifAdim == 2 ? StepState.editing:aktifAdim > 2 ? StepState.complete:StepState.disabled),
    ];

    return adimlar;
  }
}
