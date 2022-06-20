import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:ostadjee/app/common/util/exports.dart';

class Constants {
  const Constants._();

  static const String baseUrl = 'https://ostadjee.com/api/v1/';
  static const String imageBaseUrl = 'https://ostadjee.com/';

  static const String termsAndConditionUrl = 'https://ostadjee.com/more/terms-and-conditions';
  static const String privacyPolicyUrl = 'https://ostadjee.com/more/privacy-policy';

  static const timeout = Duration(minutes: 1);

  static const String token = 'authToken';
  static const String userType = 'userType'; // 0 = Tutor, 1 = Candidate

  static const String dummyImageUrl =
      'https://i.picsum.photos/id/1084/536/354.jpg'
      '?grayscale&hmac=Ux7nzg19e1q35mlUVZjhCLxqkR30cC-CarVg-nlIf60';
  static const String placeHolderBlurHash = 'LEHV6nWB2yk8pyo0adR*.7kCMdnj';

  // Frontend
  static const String getSlider = "sliders/";
  static const String getSocialIcons = "social-media/";
  static const String getDivisionTutor = "division-tutors/";
  static const String getFeatureTutor = "feature-tutors/";
  static const String getFeatureJob = "teacher/jobmatch/list/";
  static const String getFaqs = "faq/";
  static const String getPremiumTutors = "premium/tutors/";
  static const String getTutionDays = "tutiondays/";
  static const String getTimeShifts = "timeshifts/";
  static const String getSalary = "salaries/";
  static const String getDivision = "divisions/";
  static const String getArea = "areas/";
  static const String getMedium = "mediums/";
  static const String getDepartment = "department/";
  static const String getSubject = "subjects/";
  static const String getUniversities = "universities/";
  static const String getTeacherSearch = "tutor/search";
  static const String getJobSearch = "job/search";
  static const String getTutorDetails = "tutor/details/";
  static const String postTutorLogin = "teacher/login";
  static const String postTutorRegister = "teacher/register";
  static const String postTutorVerify = "teacher/verified";
  static const String postTutorVerifyResend = "teacher/resend/verify/";
  static const String postTutorForgetPassword = "teacher/forget-password";
  static const String postTutorForgetPasswordVerify =
      "teacher/forget-password/reset";
  static const String getTutorDashboard = "teacher/dashboard/";
  static const String getTutionJobs = "tution/jobs/";
  static const String getOverViewData = "counter/";
  static const String getJobApplyList = "candidate/teachar/apply/";
  static const String getJobMatchList = "candidate/teacher-match/?post_id=";
  static const String postJobApplyStatus = "candidate/teacher/applystatus";
  static const String getTeacherDashboard = "teacher/dashboard/";
  static const String getTutionApplyList = "teacher/tution/apply/";
  static const String getTutorPayments = "teacher/payments/";
  static const String postTutorWithdrawRequest = "teacher/withdraw-request";
  static const String getTutorWithdrawList = "teacher/withdraw-list/";
  static const String getTutorPasswordChange = "teacher/password/change";
  static const String postTutorPersonalInformationUpdate =
      "teacher/personal-info/update";
  static const String postTutorEducationalInformationUpdate =
      "teacher/education-info/update";
  static const String postTutorTutionInformationUpdate =
      "teacher/tution-info/update";
  static const String postTutorVerifyInformationUpdate =
      "teacher/verify-info/update";
  static const String postApplyJob = "teacher/jobapply";
  static const String getMatchJob = "teacher/jobmatch/";
  static const String getPremiumContent = "teacher/premium/content/";
  static const String postPremiumTutorRequest = "teacher/premium-request";

  static const String getCandidatePosts = "candidate/post/list/";
  static const String postCandidateLogin = "candidate/login";
  static const String postCandidateForgetPassword = "candidate/forget-password";
  static const String postCandidateForgetPasswordVerify =
      "candidate/forget-password/reset";
  static const String postCandidateRegister = "candidate/register";
  static const String postCandidateVerify = "candidate/verified";
  static const String getCandidateOverview = "candidate/dashboard/overview/";
  static const String getCandidateDashboard = "candidate/dashboard/";
  static const String getCandidateEditProfile =
      "candidate/personal-info/update";
  static const String getCandidateTeachers = "candidate/teacher/list/";
  static const String getCandidatePayments = "candidate/payment/list/";
  static const String postCandidateJobPost = "candidate/postjob";
  static const String postCandidateMakePayment = "candidate/save-payment";
}

// show error message using toast
showErrorToast(String message) {
  if (message != "") {
    BotToast.showText(
        text: message,
        contentColor: Colors.red,
        textStyle: const TextStyle(
          letterSpacing: 0.3,
          color: AppColors.white,
          fontSize: 15,
        ),
        duration: const Duration(seconds: 3));
  }
}

// show success message using toast
showSuccessToast(String message) {
  if (message != "") {
    BotToast.showText(
        text: message,
        textStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
        ),
        contentColor: Colors.green);
  }
}

// checkInternet(Function() requestDidSaved) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());
//   if (connectivityResult == ConnectivityResult.none) {
//     Get.toNamed('/no_internet').then((value) {
//       checkInternet(requestDidSaved);
//     });
//   } else {
//     requestDidSaved();
//   }
// }

class ResponseObject {
  int id;
  Object object;

  ResponseObject(
      {this.id = ResponseCode.NO_INTERNET_CONNECTION, required this.object});
}

class APIResponseCode {
  // ignore: constant_identifier_names
  static const int OK = 200;
  // ignore: constant_identifier_names
  static const int CREATED = 201;
  // ignore: constant_identifier_names
  static const int BAD_REQUEST = 400;
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 404;
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR = 500;
  // ignore: constant_identifier_names
  static const int UNAUTHORIZED_ERROR = 401;
}

class ResponseCode {
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = 0;
  // ignore: constant_identifier_names
  static const int AUTHORIZATION_FAILED = 401;
  // ignore: constant_identifier_names
  static const int SUCCESSFUL = 500;
  // ignore: constant_identifier_names
  static const int FAILED = 501;
  // ignore: constant_identifier_names
  static const int NOT_FOUND = 502;
}
