import 'package:flutter/material.dart';
import 'package:jobseek/utils/color_res.dart';

Widget commonTextFormField(
    {InputDecoration? textDecoration,
    TextEditingController? controller,
    VoidCallback? onTap}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: ColorRes.borderColor),
    ),
    child: TextFormField(
      controller: controller,
      decoration: textDecoration,
      style: const TextStyle(fontWeight: FontWeight.bold),
      onTap: onTap ?? () {},
    ),
  );
}