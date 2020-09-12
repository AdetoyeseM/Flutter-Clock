import 'package:flutter/material.dart';
import 'package:flutter_clock/clock/clcockface.dart'; 

class ClockBody extends StatefulWidget {
  @override
  _ClockBodyState createState() => _ClockBodyState();
}

class _ClockBodyState extends State<ClockBody> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Center(
          child: Stack(children: [
        Container( 
          child: ClockFace(),
          width: 500,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 4),
                blurRadius: 15.0,
                spreadRadius: 1.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              BoxShadow(
                offset: Offset(-4, -4),
                blurRadius: 15.0,
                spreadRadius: 1.0,
                color: Theme.of(context).colorScheme.secondaryVariant,
              ),
            ],
          ), 
        ),
      ])),
    );
  }
}
