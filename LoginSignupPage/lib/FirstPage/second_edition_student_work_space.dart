import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_classes_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_home_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_info_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_news_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_practices_page.dart';
import 'package:login_signup_page/FirstPage/student_news_page.dart';
import 'package:login_signup_page/alpha/a.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'Pallete.dart';

void main(){
  runApp(const Gama());
}
class Gama extends StatelessWidget{
  const Gama({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Pallete.backgroundColor,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', 'IR'),
      ],
      home: StudentWorkPageEdit(),
    );
  }

}
class StudentWorkPageEdit extends StatefulWidget {
  const StudentWorkPageEdit({super.key});


  @override
  State<StudentWorkPageEdit> createState() => _StudentWorkPageEditState();
}

class _StudentWorkPageEditState extends State<StudentWorkPageEdit> {
  Jalali? _selectedJalaliDate;
  TimeOfDay? _selectedTime;
  final TextEditingController _controller =TextEditingController(text: "");
  String _log="";
  String _dayLog="";
  String _hourLog="";

  List<String> _userTasks =[];
  void openInfoDialog() async{
    final taskResult = await showDialog<String>(
      context: context,
      builder: (BuildContext context){
        return StatefulBuilder(
          builder: (context, setState){
            return AlertDialog(
              title: const Text('کار جدید'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'کار جدید را وارد کنید',
                      contentPadding: EdgeInsets.all(20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Pallete.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Pallete.gradient1,
                          width: 4,
                        ),
                      ),
                    ),
                    controller: _controller,
                  ),
                  Text(
                      _log
                  ),
                  ListTile(
                    title: const Text("انتخاب روز ددلاین"),
                    subtitle: Text(_selectedJalaliDate != null
                        ? _selectedJalaliDate!.formatCompactDate()
                        : 'Not Set'),
                    trailing: const Icon(Icons.calendar_today),
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
                    title: const Text("انتخاب زمان ددلاین"),
                    subtitle: Text(_selectedTime != null
                        ? _selectedTime!.format(context)
                        : 'Not Set'),
                    trailing: const Icon(Icons.access_time),
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
                        'ددلاین: ${_selectedJalaliDate!.formatCompactDate()} ${_selectedTime!.format(context)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('بازگشت'),
                ),
                TextButton(
                  onPressed: () {
                    print("lenght :: $_userTasks.length");
                    setState(() {
                      send(_controller.text,_selectedJalaliDate.toString(),_selectedTime.toString());
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('ذخیره'),
                ),
              ],
            );
          },
        );
      }
    );
    print("Task Result :: $taskResult");
    _userTasks.add(taskResult!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Container(
        color: Pallete.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Pallete.backgroundColor,
              ),
            ),

            const Row(
              children: [
                SizedBox(width: 20,),
                Text(
                  'کارا',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _userTasks.length,
                itemBuilder: (context, index){
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        _userTasks[index++],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 550,),
            Row(
              children: [
                const SizedBox(width: 10,),
                IconButton(
                  onPressed: ()=>openInfoDialog(),
                  icon: const Icon(Icons.calendar_month,color: Colors.white,size: 40,),
                ),
              ],
            ),
            const SizedBox(height: 20,),

            Container(
              color: Colors.blueAccent,
              height: 83,
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const StudentHomePageEdit()));
                          },
                          icon: const Icon(
                            CupertinoIcons.house_fill,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 20,
                        height: 0,
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const StudentInfoPageEdit()));
                        },
                        icon: const Icon(
                          Icons.account_circle,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20,),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const StudentWorkPageEdit()));
                          },
                          icon: const Icon(
                            Icons.task_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StudentClassPageEdit()));
                        },
                        icon: const Icon(
                          Icons.add_chart_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=> const StudentNewsPageSection2())
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.news_solid,
                            color: Colors.black,
                            size: 30,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const StudentPracticesPageEdition()));
                          },
                          icon: const Icon(
                            Icons.add_business,
                            color: Colors.black,
                            size: 30,
                          ))
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 33,
                      ),
                      Text('سرا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 40,
                      ),
                      Text('حسابا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 30,
                      ),
                      Text('کارا',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(
                        width: 40,
                      ),
                      Text('کلاسا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 40,
                      ),
                      Text('خبرا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                      SizedBox(
                        width: 40,
                      ),
                      Text('تمرینا',
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDeadlineAlertDialog(BuildContext context){
    showDialog(context: context,
        builder: (context){
          return StatefulBuilder(
            builder: (context, setState){
              return AlertDialog(
                title: const Text('کار جدید'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'کار جدید را وارد کنید',
                        contentPadding: EdgeInsets.all(20),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Pallete.borderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Pallete.gradient1,
                            width: 4,
                          ),
                        ),
                      ),
                      controller: _controller,
                    ),
                    Text(
                        _log
                    ),
                    ListTile(
                      title: const Text("انتخاب روز ددلاین"),
                      subtitle: Text(_selectedJalaliDate != null
                          ? _selectedJalaliDate!.formatCompactDate()
                          : 'Not Set'),
                      trailing: const Icon(Icons.calendar_today),
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
                      title: const Text("انتخاب زمان ددلاین"),
                      subtitle: Text(_selectedTime != null
                          ? _selectedTime!.format(context)
                          : 'Not Set'),
                      trailing: const Icon(Icons.access_time),
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
                          'ددلاین: ${_selectedJalaliDate!.formatCompactDate()} ${_selectedTime!.format(context)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('بازگشت'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        send(_controller.text,_selectedJalaliDate.toString(),_selectedTime.toString());
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('ذخیره'),
                  ),
                ],
              );
            },
          );
        }
    );
  }
  send(String userText, String userDay,String userHour) async{
    String request = "$userText-$userDay-$userHour\u0000";
    await Socket.connect("10.0.2.2", 8000).then((serverSocket) {

      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        setState(() {
          _log += "${String.fromCharCodes(response)}\n";
        });
      });
    });

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