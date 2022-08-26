import 'package:flutter/material.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/color_res.dart';

Widget detailBox(text){
  return Container(
    height: 50,
  padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        const Color(0xFFF3F0F8),
        const Color(0xFFF3F0F8).withOpacity(0.1),
      ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight
      ),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        const Icon(Icons.check_circle_outline,color: ColorRes.containerColor,size: 30,),
        const SizedBox(width: 20,),
        Text(text,style: appTextStyle(color: Colors.black,fontSize: 14),)
      ],
    ),

  );
}