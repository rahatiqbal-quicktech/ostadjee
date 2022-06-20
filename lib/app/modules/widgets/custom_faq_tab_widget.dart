import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/pojo_model/how_it_works_model.dart';

class CustomFaqTabWidget extends StatelessWidget {
  final List<Faq> faqs;

  const CustomFaqTabWidget({
    Key? key,
    required this.faqs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
      width: Get.width,
      child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: faqs.map((Faq item) {
            return ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text(
                item.title!,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              children: [
                SizedBox(
                  width: Get.width,
                  child: Html(
                    data: "${item.description}",
                  ),
                )
              ],
            );
          }).toList())),
    );
  }
}
