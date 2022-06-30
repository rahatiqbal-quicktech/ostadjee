import 'package:flutter/material.dart';
import 'package:ostadjee/changes/features/edit_job_post/widgets/edit_job_container_widget.dart';

class ShowValueWidget extends StatelessWidget {
  ShowValueWidget({required this.fieldName, this.value, Key? key})
      : super(key: key);

  String fieldName;
  String? value;
  @override
  Widget build(BuildContext context) {
    return EditJobContainerWidget(
        childWidget: Text(
      "$fieldName : $value",
      style: const TextStyle(color: Colors.black87),
    ));
  }
}
