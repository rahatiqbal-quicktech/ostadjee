import 'package:flutter/material.dart';
import 'package:ostadjee/changes/features/tuition_information/controller/tuition_information_controller.dart';

class TuitionInformationContainer extends StatelessWidget {
  const TuitionInformationContainer({
    Key? key,
    required this.value,
    required this.string,
  }) : super(key: key);

  final String value;
  final String string;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade300,
      ),
      child: Text("$string : $value"),
    );
  }
}
