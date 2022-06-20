import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/widgets/custom_inkwell_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_space_widget.dart';
import 'package:ostadjee/app/modules/widgets/custom_text_widget.dart';

class DashboardItemWidget extends GetView<FrontendController> {
  final String? title, value;
  final int? routeIndex;
  final String? route;
  final Function()? onClick;
  final IconData? icon;
  final String? stringIcon;
  final Color color;
  final Widget? widget;

  const DashboardItemWidget({
    Key? key,
    required this.title,
    this.icon,
    this.stringIcon,
    required this.color,
    this.routeIndex,
    this.route,
    this.onClick,
    this.value,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomInkwellWidget(
        onTap: () {
          if (routeIndex != null) {
            controller.tabController.animateTo(routeIndex!);
          }
          if (route != null) {
              controller.selectedProfileEditTab(0);
            Get.toNamed(route!);
          }
        },
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 4,
                offset: const Offset(2, 2), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextWidget(
                            text: title ?? "",
                            fontSize: Dimens.fontSize16,
                            color: color,
                            isFullWidth: true,
                          ),
                        ),
                        const CustomSpaceWidget(
                          width: 10,
                        ),
                        if (icon != null)
                          Icon(
                            icon!,
                            color: color,
                          ),
                        if (stringIcon != null)
                          CustomTextWidget(
                            text: stringIcon ?? "",
                            fontSize: Dimens.fontSize24,
                            color: color,
                          ),
                      ],
                    ),
                    if (value != null)
                      const CustomSpaceWidget(
                        height: 5,
                      ),
                    if (value != null)
                      CustomTextWidget(
                        text: value ?? "",
                        fontSize: Dimens.fontSize18,
                        fontWeight: FontWeight.bold,
                        color: color,
                        isFullWidth: true,
                      ),
                    if (widget != null)
                      const CustomSpaceWidget(
                        height: 5,
                      ),
                    if (widget != null) widget!,
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
