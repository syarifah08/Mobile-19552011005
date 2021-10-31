import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Timepicker extends StatelessWidget {
  const Timepicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimepickerPage(),
    );
  }
}

class TimepickerPage extends StatefulWidget {
  @override
  _TimepickerState createState() {
    return _TimepickerState();
  }
}

class _TimepickerState extends State<TimepickerPage> {
  TimeOfDay selectTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: selectTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  ).then((value) {
                    if (value != null)
                      setState(() {
                        selectTime = value;
                      });
                  });
                },
                child: Text(
                  "Time Picker",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Time Value : ${selectTime.format(context)} ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
