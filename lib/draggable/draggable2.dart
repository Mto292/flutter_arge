import 'package:flutter/material.dart';
import 'package:flutter_kurs/appbar/Appbar.dart';


class Draggable2 extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}
class _DragState extends State<Draggable2> {
  double top = 0;
  double left = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Material(
        child: Container(
          color: Colors.amber,
          child: Draggable(
            child: Container(
              padding: EdgeInsets.only(top: top, left: left),
              child: DragItem(),
            ),
            feedback: Container(
              padding: EdgeInsets.only(top: top, left: left),
              child: DragItem(),
            ),
            childWhenDragging: Container(
              padding: EdgeInsets.only(top: top, left: left),
              child: DragItem(),
            ),
            onDragCompleted: () {},
            onDragEnd: (drag) {
              setState(() {
                top = top + drag.offset.dy < 0 ? 0 : top + drag.offset.dy ;
                left = left + drag.offset.dx < 0 ? 0 : left + drag.offset.dx;
              });
            },
          ),
        ),
      )
    );
  }
}
class DragItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(57774, fontFamily: 'MaterialIcons'),
      size: 36,
    );
  }
}