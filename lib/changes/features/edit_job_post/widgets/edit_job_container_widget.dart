import 'package:flutter/material.dart';

class EditJobContainerWidget extends StatelessWidget {
  const EditJobContainerWidget({required this.childWidget, Key? key})
      : super(key: key);
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        top: 5,
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: childWidget,
    );
  }
}
