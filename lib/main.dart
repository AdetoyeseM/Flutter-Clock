import 'package:flutter/material.dart';
import 'package:flutter_clock/clock/clockbody.dart';
import 'package:flutter_clock/location.dart';
import 'package:geolocator/geolocator.dart';

import 'package:intl/intl.dart';

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

  Position _currentPosition;
  String _currentAddress;
  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('hh:mma \n dd MMM, yyyy').format(now);
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
                  children: [Icon(Icons.brightness_3)],
                  onPressed: (int index) {
                    setState(() {
                      isSelected[index] = !isSelected[index];
                      _clocktheme = _buildclocktheme(isSelected[index]);
                    });
                  },
                  isSelected: isSelected,
                )
              ],
              leading: Icon(Icons.timer,
                  color: isSelected[0] ? Colors.grey[300] : Colors.grey[800]),
              title: Text(
                'Clock',
                style: TextStyle(
                    color: isSelected[0] ? Colors.grey[300] : Colors.grey[800]),
              ),
              backgroundColor:
                  isSelected[0] ? Colors.grey[800] : Colors.grey[300],
              elevation: 0,
            ),
            backgroundColor:
                isSelected[0] ? Colors.grey[800] : Colors.grey[300],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: 300, width: 300, child: Clock()),
                Divider(),
                SizedBox(height: 5, width: 100),
                Center(
                  child: Text(
                    formattedDate,
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: isSelected[0]
                            ? Colors.grey[300]
                            : Colors.grey[800]),
                  ),
                ),
                Divider(),
                SizedBox(height: 0, width: 10),
                Center(
                  child: Text(
                    'My Location:\n',
                    style: TextStyle(
                        letterSpacing: 1.5,
                        color: isSelected[0]
                            ? Colors.grey[300]
                            : Colors.grey[800]),
                  ),
                ),
                Center(child: Location()),
                Divider(),
              ],
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
