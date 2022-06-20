import 'dart:convert';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/division_tutor_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_jobs_model.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';
import 'package:ostadjee/app/routes/app_pages.dart';

class LeadingController extends GetxController {
  var token = "".obs;
  var tutor = false.obs;

  var tutionJobs = TutionJobsModel().obs;
  var divisionTutor = DivisionTutorModel().obs;

  var totalApply = 0.obs;
  var totalTution = 0.obs;
  var totalStudents = 0.obs;

  var currentSlide = 0.obs;

  String rating = '4.5/5';

  @override
  void onInit() {
    notifyChanges();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    notifyChanges();

    getTutionJobs();
    getOverViewData();
    getDivisionTutors();
  }

  void notifyChanges() {
    token(Storage.getValue(Constants.token));

    if (Storage.hasData(Constants.userType)) {
      tutor(Storage.getValue(Constants.userType) == "0");
    }
  }

  void onTutionJobsClick() {
    Get.toNamed(Routes.TUTION_JOBS_VIEW);
  }

  void updateCurrentIndex(int index) {
    currentSlide(index);
  }

  void getTutionJobs() async {
    final _response = await FrontEndRepository().getTutionJobs();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutionJobs(
          TutionJobsModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getOverViewData() async {
    final _response = await FrontEndRepository().getOverViewData();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      var jsonData = json.decode(_response.object.toString());

      totalApply(jsonData['totalapply'] ?? 0);
      totalTution(jsonData['totaltution'] ?? 0);
      totalStudents(jsonData['totalstudents'] ?? 0);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getDivisionTutors() async {
    final _response = await FrontEndRepository().getDivisionTutor();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      divisionTutor(DivisionTutorModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }
}
