import 'package:flutter/material.dart';

void main(){
  runApp(Profilescreen());
}
class Profilescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: 375,
              height: 739,
              child: Stack(
                children: [
                  Positioned(
                    left: 13,
                    top: 1,
                    child: Container(
                      width: 360,
                      height: 738,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 360,
                              height: 276,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 360,
                                      height: 276,
                                      decoration: BoxDecoration(color: Color(0xFFF5487F)),
                                    ),
                                  ),
                                  Positioned(
                                    left: 110,
                                    top: 179,
                                    child: Text(
                                      'تقی تقوی اصل',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 161,
                                    top: 214,
                                    child: Text(
                                      'دانشجو',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.800000011920929),
                                        fontSize: 14,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 125,
                                    top: 63,
                                    child: Container(
                                      width: 110,
                                      height: 110,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 138,
                                    top: 84,
                                    child: Container(
                                      width: 91,
                                      height: 91,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://via.placeholder.com/91x91"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 203,
                                    top: 151,
                                    child: Container(
                                      width: 22,
                                      height: 22,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF24201D),
                                        shape: OvalBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 28,
                            top: 282,
                            child: Container(
                              width: 304,
                              height: 187,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 304,
                                      height: 187,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(27),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 186,
                                    top: 23,
                                    child: Text(
                                      'شماره دانشجویی',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 231,
                                    top: 67,
                                    child: Text(
                                      'ترم جاری',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 219,
                                    top: 109,
                                    child: Text(
                                      'تعداد واحد',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 228,
                                    top: 151,
                                    child: Text(
                                      'معدل کل',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 23,
                                    child: Text(
                                      '4023921124',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 68,
                                    child: Text(
                                      'بهار 1402-1403',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 111,
                                    child: Text(
                                      '16',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 152,
                                    child: Text(
                                      '18.64',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 55,
                                    child: Container(
                                      width: 265,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.black.withOpacity(0.10000000149011612),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 100,
                                    child: Container(
                                      width: 265,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.black.withOpacity(0.10000000149011612),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 21,
                                    top: 141,
                                    child: Container(
                                      width: 265,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.black.withOpacity(0.10000000149011612),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 28,
                            top: 655,
                            child: Container(
                              width: 304,
                              height: 42,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 304,
                                      height: 42,
                                      decoration: ShapeDecoration(
                                        color: Color(0xD8FF4444),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 99,
                                    top: 12,
                                    child: Text(
                                      'حذف حساب کاربری',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Vazirmatn',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                        letterSpacing: -0.30,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 28,
                            top: 501,
                            child: Container(
                              width: 304,
                              height: 114,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 304,
                                      height: 114,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(17),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 258,
                                    top: 70,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF5487F),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 265,
                                    top: 77,
                                    child: Container(
                                      width: 16.31,
                                      height: 17,
                                      child: Stack(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 175,
                                    top: 75,
                                    child: SizedBox(
                                      width: 75,
                                      height: 22,
                                      child: Text(
                                        'تغییر رمز عبور',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Vazirmatn',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 23,
                                    top: 57,
                                    child: Container(
                                      width: 265,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: Colors.black.withOpacity(0.10000000149011612),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 258,
                                    top: 18,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: ShapeDecoration(
                                        color: Color(0xFF553772),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 265,
                                    top: 26,
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage("https://via.placeholder.com/16x16"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 125,
                                    top: 22,
                                    child: SizedBox(
                                      width: 148,
                                      height: 22,
                                      child: Text(
                                        'ویرایش مشخصات',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Vazirmatn',
                                          fontWeight: FontWeight.w500,
                                          height: 0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 208,
                            top: 158,
                            child: Container(
                              width: 12,
                              height: 9,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/12x9"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      width: 375,
                      height: 44,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 336.33,
                            top: 17.33,
                            child: Container(
                              width: 24.33,
                              height: 11.33,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.35,
                                      child: Container(
                                        width: 22,
                                        height: 11.33,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1, color: Colors.white),
                                            borderRadius: BorderRadius.circular(2.67),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 2,
                                    top: 2,
                                    child: Container(
                                      width: 18,
                                      height: 7.33,
                                      decoration: ShapeDecoration(
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(1.33),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 316,
                            top: 17.33,
                            child: Container(
                              width: 15.33,
                              height: 11,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/15x11"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 294,
                            top: 17.67,
                            child: Container(
                              width: 17,
                              height: 10.67,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://via.placeholder.com/17x11"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 21,
                            top: 7,
                            child: Container(
                              width: 54,
                              height: 21,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 7,
                                    child: SizedBox(
                                      width: 54,
                                      child: Text(
                                        '09:41',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Tauri',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: -0.30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}