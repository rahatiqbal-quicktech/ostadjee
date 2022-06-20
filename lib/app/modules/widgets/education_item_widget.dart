import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';

import 'custom_text_widget.dart';

class EducationItemWidget extends StatelessWidget {
  final String? examName, year, institute, group, result;

  const EducationItemWidget({
    Key? key,
    this.examName = "",
    this.year = "",
    this.institute = "",
    this.group = "",
    this.result = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: "${Strings.examName}: ${examName!}",
          isFullWidth: true,
        ),
        CustomTextWidget(
          text: "${Strings.year}: ${year!}",
          isFullWidth: true,
        ),
        CustomTextWidget(
          text: "${Strings.institute}: ${institute!}",
          isFullWidth: true,
        ),
        CustomTextWidget(
          text: "${Strings.groupSubject}: ${group!}",
          isFullWidth: true,
        ),
        CustomTextWidget(
          text: "${Strings.result}: ${result!}",
          isFullWidth: true,
        ),
      ],
    );
  }
}
