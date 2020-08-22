import 'package:getflutter/getflutter.dart';
import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          GFAccordion(
              title: 'GF Accordion',
              content: "GetFlutter is an open source library that comes with pre-build 1000+ UI components."
          ),
          GFAccordion(
              title: 'GF Accordion',
              content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize)
          ),
          GFAccordion(
              title: 'GF Accordion',
              content: 'GetFlutter is an open source library that comes with pre-build 1000+ UI components.',
              collapsedIcon: Text('Show'),
              expandedIcon: Text('Hide')
          ),
        ],
      ),
    );
  }
}
