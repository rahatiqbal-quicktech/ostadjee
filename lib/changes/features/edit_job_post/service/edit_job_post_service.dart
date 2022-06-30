import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/app/controllers/frontend_controller.dart';
import 'package:ostadjee/app/modules/profile/views/profile_edit_view.dart';
import 'package:ostadjee/app/modules/profile/views/profile_view.dart';

class EditJobPostService {
  String fullUrl = "https://ostadjee.com/api/v1/candidate/postupdate";
  final controller = Get.put(FrontendController());

  Future<dynamic> post({
    required String postId,
    required String title,
    required String fullName,
    required String college,
    required String studentGender,
    required String mediumId,
    required String departmentId,
    required String phone,
    required String email,
    required String divisionId,
    required String districtId,
    required String areaId,
    required String address,
    required String genderId,
    required String subjectId,
    required String dayWeek,
    required String salary,
    required String universityId,
    required String extraNote,
  }) async {
    try {
      Map<String, dynamic> data = {
        'post_id': postId,
        'title': title,
        'fullName': fullName,
        'college': college,
        's_gender': genderId,
        'medium_id': mediumId,
        'department_id': departmentId,
        'phoneNumber': phone,
        'email': email,
        'division_id': divisionId,
        'district_id': districtId,
        'area_id': areaId,
        'address': address,
        'gender_id': genderId,
        'subject_id': subjectId,
        'dayweek': dayWeek,
        'salary': salary,
        'university_id': universityId,
        'extranote': extraNote
      };
      log("$data");
      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {
          'Authorization': 'Bearer ${Storage.getValue(Constants.token)}',
        },
        body: data,
      );
      print(response.body);

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Post updated");
        controller.getCandidatePosts();
        Get.to(() => ProfileView());
      } else {
        Get.snackbar("Error", "Couldn't update job post");
      }
    } on Exception catch (e) {
      print("editJobPost $e");
    }
  }

  clearControllers() {
    controller.titleController.clear();
    controller.nameController.clear();
    controller.instituteController.clear();
    controller.selectedGender = null;
    controller.selectedMedium = null;
    controller.selectedDepartment = null;
    controller.phoneNumberController.clear();
    controller.emailController.clear();
    controller.selectedDivision = null;
    controller.selectedArea = null;
    controller.locationDetailsController.clear();
    controller.selectedTeacherGender = null;
    controller.selectedSubjects.clear();
    controller.selectedTutionDays = null;
    controller.selectedSalaryRange = null;
    controller.otherRequirementsController.clear();
  }
}
