import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  @override
  State<Date> createState() {
    return DateState();
  }
}

class DateState extends State<Date> {
  late String _dateCount;
  late String _range;

  @override
  void initState() {
    _dateCount = '';
    _range = '';
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
   setState(() {
     
   });
   print(args.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 215, 239, 220),
      child: SfDateRangePicker(
        maxDate: DateTime.now(),
        minDate: DateTime(1945, 1, 1, 1, 1),
        onSelectionChanged: _onSelectionChanged,
      ),
    );
  }
}
