import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApplicantsDetailsController extends GetxController
    implements GetxService {
  List list = ["Accepted", "Rejected", "Schedule Interview", "Sent"];
  String? selectedValue;
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime? selectedDate = DateTime.now();
  String? showTime;
  String? showDate;
  var inputFormat = DateFormat('dd/MM/yyyy');
  TextEditingController msgController = TextEditingController();

  onChangeStatus(String value) {
    selectedValue = value;
    update(['drop']);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime.now(),
        lastDate: DateTime(2025));
    if (picked != null) {
      selectedDate = picked;
      showDate = getFormatDate(picked);

      update(['drop']);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()
            //selectedTime,
            );
    if (picked != null) {
      String selTime = '${picked.hour}:${picked.minute}:00';
      showTime = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(selTime));
      selectedTime = picked;
      update(['drop']);
    }
  }

  getFormatDate(date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(date.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
