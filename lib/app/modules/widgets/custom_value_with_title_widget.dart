import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';

class CustomValueWithTitleWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;
  final Widget? widget;

  const CustomValueWithTitleWidget({
    Key? key,
    required this.title,
    required this.value,
    this.icon,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              color: AppColors.doveGray,
            ),
          if (widget != null) widget!,
          if (icon != null || widget != null)
            const CustomSpaceWidget(
              width: 10,
            ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.doveGray,
                      fontSize: Dimens.fontSize15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                      fontSize: Dimens.fontSize18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
