 import 'package:flutter/material.dart';

import 'clockDialPainter.dart';
import 'clockhands.dart';

 class ClockFace extends StatefulWidget {
   @override
   _ClockFaceState createState() => _ClockFaceState();
 }
 
 class _ClockFaceState extends State<ClockFace> {
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: EdgeInsets.all(8.0),
       child: AspectRatio(
         aspectRatio: 1.0,
         child: Center(
           child: Container(
             width: double.infinity,
             decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary
             ),

           child: Stack(
              children: <Widget>[
                //Dial, numbers, and hands will go here
                Container(
                  
                  height: double.infinity,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: ClockDialPainter(
                    
                      clockText: ClockText.values,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                  ),
                ),
                ClockHands(),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 