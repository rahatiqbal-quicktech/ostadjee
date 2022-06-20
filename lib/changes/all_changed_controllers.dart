import 'package:get/get.dart';
import 'package:ostadjee/changes/features/can_apply/controller/can_apply_function.dart';
import 'package:ostadjee/changes/features/featured_tutor/controller/featured_tutors_controller.dart';
import 'package:ostadjee/changes/features/job_match_list/controller/job_match_list_controller.dart';
import 'package:ostadjee/changes/features/tuition_information/controller/tuition_information_controller.dart';
import 'package:ostadjee/changes/features/tutor_department/controller/selected_tutor_departments_controller.dart';
import 'package:ostadjee/changes/features/tutor_department/controller/tutor_departments_controller.dart';
import 'package:ostadjee/changes/features/upgrade_post_limit/controller/payable_amount_controller.dart';
import 'package:ostadjee/changes/shared/controllers/all_price_controller.dart';

import 'features/job_post_count/controller/job_post_count_controller.dart';

class AllChangedControllers {
  final jobPostCountController = Get.put(JobPostCountController());
  final featuresTutorsController = Get.put(FeaturedTutorsController());
  final allPriceController = Get.put(AllPriceController());
  final payableAmountController = Get.put(PayableAmountController());
  final tutorDepartmentsController = Get.put(TutorDepartmentsController());
  final selectTutorDepartmentController =
      Get.put(SelectTutorDepartmentController());
  final canApplyFunctionController = Get.put(CanApplyFunction());
  final jobMatchListController = Get.put(JobMatchListController());
  final tuitionInformationController = Get.put(TuitionInformationController());
}
