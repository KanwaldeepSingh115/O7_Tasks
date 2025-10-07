import 'package:flutter/material.dart';

class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key});

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> selectTime() async {
    final TimeOfDay? timePick = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    setState(() {
      selectedTime = timePick;
    });
  }

  Future<void> selectdate() async {
    final DateTime? datePick = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select Date',
      cancelText: 'No',
      confirmText: 'Yes',
      fieldHintText: 'dd/mm/yyyy',
      fieldLabelText: 'Booking Date',
      errorFormatText: 'Enter a valid date',
      errorInvalidText: 'Date out of range',
      selectableDayPredicate: (DateTime date) {
        return date.weekday != DateTime.saturday &&
            date.weekday != DateTime.sunday;
      },
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      selectedDate = datePick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text("Select Date"),
              ),
              SizedBox(height: 20),
              Text(
                selectedDate != null
                    ? '${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}'
                    : 'Please select Date',
              ),
              SizedBox(height: 30),
              OutlinedButton(
                onPressed: selectdate,
                child: Text('DatePicker Customized!'),
              ),
              SizedBox(height: 30),
              Text(
                selectedTime != null
                    ? '${selectedTime!.hour}:${selectedTime!.minute}'
                    : 'Please Select Time',
              ),
              SizedBox(height: 50),
              FloatingActionButton(
                onPressed: selectTime,
                child: Text('Select time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
