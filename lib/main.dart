import 'package:flutter/material.dart';
import 'package:flutter_clock/clock/clockbody.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<MyApp> {
  ThemeData _clocktheme = _buildclocktheme(false);
  List<bool> isSelected = [false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: _clocktheme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(

              actions: <Widget>[
          ToggleButtons(
           color: Colors.grey,
                        selectedColor: Colors.grey[50],  
                        borderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        children: [
                          Icon(Icons.brightness_3)],
                        onPressed: (int index) {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                            _clocktheme = _buildclocktheme(isSelected[index]);
                          });
                        },
                        isSelected: isSelected,
          )
              ],
              leading: Icon(Icons.timer,color: isSelected[0] ? Colors.grey[300] : Colors.grey[800]),
              
              title: Text('Clock',
                  style: TextStyle(
                      color: isSelected[0] ? Colors.grey[300] : Colors.grey[800]
                      )
                      ),
              backgroundColor:  isSelected[0] ? Colors.grey[800] : Colors.grey[300],
              elevation: 0,
            ),
            backgroundColor:
                isSelected[0] ? Colors.grey[800] : Colors.grey[300],
            body: Center(
              child: OrientationBuilder(
                builder: (context, orientation) {
                  return Flex(
                    direction: orientation == Orientation.portrait
                        ? Axis.vertical
                        : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 300, width: 300, child: Clock()),
                      SizedBox(height: 50, width: 100),
                       
                    ],
                  );
                },
              ),
            )));
  }
}

ThemeData _buildclocktheme(bool darkmode) {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      primaryColor: darkmode ? Colors.grey[800] : Colors.white,
      colorScheme: darkmode
          ? base.colorScheme.copyWith(
              primary: Colors.grey[800],
              secondary: Colors.grey[900],
              secondaryVariant: Colors.grey[700],
              primaryVariant: Colors.white)
          : base.colorScheme.copyWith(
              primary: Colors.grey[300],
              secondary: Colors.grey[500],
              secondaryVariant: Colors.white,
              primaryVariant: Colors.grey),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: ClockBody());
  }
}
