import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Jalali? _selectedJalaliDate;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deadline Setter'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () => _showDeadlineDialog(context),
          iconSize: 50.0,
        ),
      ),
    );
  }

  void _showDeadlineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Set Deadline'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text("Choose Date"),
                    subtitle: Text(_selectedJalaliDate != null
                        ? _selectedJalaliDate!.formatCompactDate()
                        : 'Not Set'),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      Jalali? pickedDate = await showPersianDatePicker(
                        context: context,
                        initialDate: _selectedJalaliDate ?? Jalali.now(),
                        firstDate: Jalali(1400, 1, 1),
                        lastDate: Jalali(1450, 12, 29),
                      );

                      if (pickedDate != null) {
                        setState(() {
                          _selectedJalaliDate = pickedDate;
                        });
                      }
                    },
                  ),


                  ListTile(
                    title: Text("Choose Time"),
                    subtitle: Text(_selectedTime != null
                        ? _selectedTime!.format(context)
                        : 'Not Set'),
                    trailing: Icon(Icons.access_time),
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime ?? TimeOfDay.now(),
                      );

                      if (pickedTime != null) {
                        setState(() {
                          _selectedTime = pickedTime;
                        });
                      }
                    },
                  ),
                  if (_selectedJalaliDate != null && _selectedTime != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        'Deadline: ${_selectedJalaliDate!.formatCompactDate()} ${_selectedTime!.format(context)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      // Update the state to show the selected deadline in the main screen
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Set Deadline'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

Future<Jalali?> showPersianDatePicker({
  required BuildContext context,
  required Jalali initialDate,
  required Jalali firstDate,
  required Jalali lastDate,
}) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: initialDate.toDateTime(),
    firstDate: firstDate.toDateTime(),
    lastDate: lastDate.toDateTime(),
  );

  return picked != null ? Jalali.fromDateTime(picked) : null;
}

extension JalaliFormatter on Jalali {
  String formatCompactDate() {
    final f = farsiNumberFormat();
    return '${f.format(year)}/${f.format(month)}/${f.format(day)}';
  }

  NumberFormat farsiNumberFormat() {
    return NumberFormat('##', 'fa');
  }
}

