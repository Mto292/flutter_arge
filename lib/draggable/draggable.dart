import 'package:flutter/material.dart';

class draggable extends StatefulWidget {
  @override
  _draggableState createState() => _draggableState();
}

class _draggableState extends State<draggable> {
  var targetColor = Colors.transparent;

  Color dragColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Draggable<Color>(
              child: Container(
                height: 100,
                width: 100,
                color: dragColor,
              ),
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              childWhenDragging: Container(
                height: 100,
                width: 100,),
              axis: Axis.vertical,
              data: Colors.red,
              feedbackOffset: Offset.fromDirection(23,23),
             // dragAnchor: DragAnchor.pointer,dokunuldugu noktadan drop yapılsın
            ),
            Draggable<Color>(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.purple,
              ),
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.purple,
              ),
              //axis: Axis.vertical,
              data: Colors.purple,
            ),
            DragTarget<Color>(builder: (BuildContext context, List<Color> candidateData, List<dynamic> rejectedData){
              return Container(
                decoration: BoxDecoration(
                  color: targetColor,
                  border: Border.all(),
                ),
                height: 100,
                width: 100,
              );
            },
              onAccept: (deger){//ustune bırakıldıgı zaman
              var d = deger;
              setState(() {
                targetColor = deger;
              });
              },
              onLeave: (deger){//üstüne getirip çekildiği zaman
                var d = deger;
                setState(() {
                  targetColor = deger;
                });
              },

            )
          ],
        )
      ),
    );
  }
}
