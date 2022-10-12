import 'package:flutter/material.dart';
import 'package:jobseek/utils/color_res.dart';

Widget commonTextFormField(
    {InputDecoration? textDecoration,
    TextEditingController? controller,
    VoidCallback? onTap,
      TextInputType? type,


    Color? color,
    bool? obscureText}) {
  return Container(

    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: color ?? ColorRes.borderColor),
    ),
    child: TextField(
      keyboardType:type ?? TextInputType.text,
      controller: controller,
      decoration: textDecoration,
      style: const TextStyle(fontWeight: FontWeight.bold),
      onTap: onTap ?? () {},
      obscureText: obscureText ?? false,

    ),
  );
}
