import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:login_signup_page/FirstPage/Pallete.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_classes_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_news_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_practices_page.dart';
import 'package:login_signup_page/FirstPage/second_edition_student_work_space.dart';
import 'package:login_signup_page/FirstPage/student_news_page.dart';

void main(){
  runApp(const Alpha());
}
class Alpha extends StatelessWidget{
  const Alpha({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: StudentHomePageEdit(),
    );
  }
}
class MyMenuBarSara extends StatelessWidget {
  const MyMenuBarSara({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          showAboutDialog(
                            context: context,
                            applicationName: 'MenuBar Sample',
                            applicationVersion: '1.0.0',
                          );
                        },
                        child: const MenuAcceleratorLabel('&About'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Saved!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Save'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Quit!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Quit'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&File'),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Magnify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('&Magnify'),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Minify!'),
                            ),
                          );
                        },
                        child: const MenuAcceleratorLabel('Mi&nify'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&View'),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.shortestSide * 0.5,
          ),
        ),
      ],
    );
  }
}
class StudentHomePageEdit extends StatelessWidget {
  const StudentHomePageEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: const SafeArea(
            child: Padding(padding: EdgeInsets.all(15),
              child:  Text('صفحه اصلی',style:
              TextStyle(
                  color: Colors.white
              ),
              ),
            ),
          ),
        leading: IconButton(
          focusColor: Colors.black,
          icon: const Icon(Icons.account_circle_outlined,
            color: Colors.white,),
          onPressed: () { },
        ),
        centerTitle: true,
        ),
      body: Container(
        color: Pallete.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Pallete.backgroundColor,
              ),
            ),
            /*MenuBar(
              children: <Widget>[
                SubmenuButton(
                  menuChildren: <Widget>[
                    MenuItemButton(
                      onPressed: () {
                        showAboutDialog(
                          context: context,
                          applicationName: 'MenuBar Sample',
                          applicationVersion: '1.0.0',
                        );
                      },
                      child: const MenuAcceleratorLabel('&About'),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Saved!'),
                          ),
                        );
                      },
                      child: const MenuAcceleratorLabel('&Save'),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Quit!'),
                          ),
                        );
                      },
                      child: const MenuAcceleratorLabel('&Quit'),
                    ),
                  ],
                  child: const MenuAcceleratorLabel('&File'),
                ),
                SubmenuButton(
                  menuChildren: <Widget>[
                    MenuItemButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Magnify!'),
                          ),
                        );
                      },
                      child: const MenuAcceleratorLabel('&Magnify'),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Minify!'),
                          ),
                        );
                      },
                      child: const MenuAcceleratorLabel('Mi&nify'),
                    ),
                  ],
                  child: const MenuAcceleratorLabel('&View'),
                ),
              ],
            ),*/
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text('خلاصه',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
              ),
              ),
            ),
            const SizedBox(height: 10,),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,

              children: <Widget>[
                _buildSummaryCard('بهترین نمره 100', CupertinoIcons.star_fill, Colors.blue),
                _buildSummaryCard('2 تا امتحان داری', CupertinoIcons.heart_slash_fill, Colors.red),
                _buildSummaryCard('3 تا تمرین داری', CupertinoIcons.time, Colors.pink),
              ],
            ),
            Center(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  _buildSummaryCard('2 تا ددلاین پرید', CupertinoIcons.timer, Colors.blueGrey),
                  _buildSummaryCard('بدترین نمره 10', CupertinoIcons.down_arrow, Colors.orange),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'تسک های جاری',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildTaskCard('آز ریز - تمرین 1', CupertinoIcons.clear_circled_solid, CupertinoIcons.check_mark_circled_solid),
            _buildTaskCard('تست - تمرین 1', CupertinoIcons.clear_circled_solid, CupertinoIcons.check_mark_circled_solid),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'کارهای انجام شده',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildCompletedCard('AP - تمرین 2'),
                _buildCompletedCard('AP - تمرین 2'),
              ],
            ),
            const SizedBox(height: 80,),
           Container(
             color: Colors.blueAccent,
             height: 83,
             child: Column(
               children: [
                 Row(
                   children: [
                     const SizedBox(height: 20,width: 20,),
                     IconButton(onPressed: (){}, icon: const Icon(CupertinoIcons.house_fill,color: Colors.white,size: 30,)),
                     const SizedBox(width: 30, height: 0,),
                     IconButton(onPressed: (){
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                               const StudentWorkPageEdit()));
                     }, icon: const Icon(Icons.task_rounded,color: Colors.black,size: 30,)),
                     const SizedBox(width: 30,),
                     IconButton(onPressed: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const StudentClassPageEdit()));
                     }, icon: const Icon(Icons.add_chart_rounded,color: Colors.black,size: 30,),),
                     const SizedBox(width: 30,),
                     IconButton(onPressed: (){
                       Navigator.pushReplacement(context,
                         MaterialPageRoute(builder: (context)=> const StudentNewsPageSection2())
                       );
                     }, icon: const Icon(CupertinoIcons.news_solid,color: Colors.black,size: 30,)),
                     const SizedBox(width: 30,),
                     IconButton(onPressed: (){
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context) =>
                                   const StudentPracticesPageEdition()));
                     }, icon: const Icon(Icons.add_business,color: Colors.black,size: 30,))
                   ],
                 ),
                 const Row(
                   children: [
                     SizedBox(width: 33,),
                     Text('سرا',style: TextStyle(color: Colors.white,fontSize: 18)),
                     SizedBox(width: 55,),
                     Text('کارا',style: TextStyle(color: Colors.black,fontSize: 18)),
                     SizedBox(width: 46,),
                     Text('کلاسا',style: TextStyle(color: Colors.black,fontSize: 18)),
                     SizedBox(width: 48,),
                     Text('خبرا',style: TextStyle(color: Colors.black,fontSize: 18)),
                     SizedBox(width: 44,),
                     Text('تمرینا',style: TextStyle(color: Colors.black,fontSize: 18)),
                   ],

                 )
               ],
             ),
           )



          ],
        ),
      )
      );
  }
  Widget _buildSummaryCard(String text, IconData icon, Color color) {
    return Card(
      color: Colors.cyanAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }
  Widget _buildTaskCard(String text, IconData icon1, IconData icon2) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.cyanAccent,
      elevation: 5,
      child: ListTile(
        leading: Icon(icon1, color: Colors.red, size: 30),
        title: Text(text, style: TextStyle(fontSize: 16)),
        trailing: Icon(icon2, color: Colors.green, size: 30),
      ),
    );
  }
  Widget _buildCompletedCard(String text) {
    return Card(
      color: Colors.cyanAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Text(text, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 10),
            const Icon(CupertinoIcons.check_mark_circled_solid, color: Colors.green, size: 30),
          ],
        ),
      ),
    );
  }
}





