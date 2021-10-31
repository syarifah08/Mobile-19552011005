import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:tugassatu_19552011005_syarifah_asmiati/datepicker.dart';
import 'package:tugassatu_19552011005_syarifah_asmiati/timepicker.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  var datePicker = new Datepicker();
  var timePicker = new Timepicker();

  static List<Widget> _widgetOptions = <Widget>[
    Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        )),
    Scaffold(
      body: Datepicker(),
    ),
    Scaffold(
      body: Timepicker(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _selectedIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.apps_rounded),
            title: Text('Dashboard'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.date_range_rounded),
            title: Text('Date Picker'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.access_time_rounded),
            title: Text('Time Picker'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
