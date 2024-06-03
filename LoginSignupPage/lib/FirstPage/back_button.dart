import 'package:flutter/material.dart';

import 'Pallete.dart';
class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.pop(context);
    },
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 20)
      ),
      child:const Text('ورود',style: TextStyle(
          color: Pallete.whiteColor,
      ),),
    );
  }
}
