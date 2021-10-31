import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatelessWidget {
  const Datepicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DatepickerPage(),
    );
  }
}

class DatepickerPage extends StatefulWidget {
  @override
  _DatepickerState createState() {
    return _DatepickerState();
  }
}

class _DatepickerState extends State<DatepickerPage> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030),
                    initialEntryMode: DatePickerEntryMode.calendar,
                  ).then((value) {
                    if (value != null)
                      setState(() {
                        selectDate = value;
                      });
                  });
                },
                child: Text(
                  "Date Picker",
                  style: TextStyle(color: Colors.red),
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
                      "Date Value : ${DateFormat('dd-MM-yyyy').format(selectDate).toString()}",
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
