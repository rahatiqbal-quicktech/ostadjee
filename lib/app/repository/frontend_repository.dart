import 'dart:convert';

import 'package:http/http.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/subject_model.dart';
import 'package:ostadjee/app/repository/repository_helper.dart';

class FrontEndRepository {
  Future<ResponseObject> getSliders() async {
    return RepositoryHelper().apiCall(url: Constants.getSlider);
  }

  Future<ResponseObject> getDivisionTutor() async {
    return RepositoryHelper().apiCall(url: Constants.getDivisionTutor);
  }

  Future<ResponseObject> getFeatureTutors() async {
    return RepositoryHelper().apiCall(url: Constants.getFeatureTutor);
  }

  Future<ResponseObject> getFeatureJobs() async {
    return RepositoryHelper().apiCall(url: Constants.getFeatureJob);
  }

  Future<ResponseObject> getTutorDetails(int tutorId) async {
    return RepositoryHelper()
        .apiCall(url: Constants.getTutorDetails + tutorId.toString() + "/");
  }

  Future<ResponseObject> getSocialIcons() async {
    return RepositoryHelper().apiCall(url: Constants.getSocialIcons);
  }

  Future<ResponseObject> getPremiumTutors() async {
    return RepositoryHelper().apiCall(url: Constants.getPremiumTutors);
  }

  Future<ResponseObject> getDivisions() async {
    return RepositoryHelper().apiCall(url: Constants.getDivision);
  }

  Future<ResponseObject> getArea(int id) async {
    return RepositoryHelper()
        .apiCall(url: Constants.getArea + id.toString() + "/");
  }

  Future<ResponseObject> getMedium() async {
    return RepositoryHelper().apiCall(url: Constants.getMedium);
  }

  Future<ResponseObject> getDepartment(int id) async {
    return RepositoryHelper()
        .apiCall(url: Constants.getDepartment + id.toString() + "/");
  }

  Future<ResponseObject> getSubject(int? id) async {
    return RepositoryHelper().apiCall(
        url: "${Constants.getSubject}${id != null ? id.toString() + "/" : ""}");
  }

  Future<ResponseObject> getUniversities() async {
    return RepositoryHelper().apiCall(url: Constants.getUniversities);
  }

  Future<ResponseObject> getTutorDepartments() async {
    return RepositoryHelper().apiCall(url: "tutor-departments");
  }

  // Future<ResponseObject> getTeacherSearch(String parameter) async {
  //   return RepositoryHelper()
  //       .apiCall(url: Constants.getTeacherSearch + parameter);
  // }

  Future<ResponseObject> getTeacherSearch(
      String district,
      String area,
      String medium,
      String gender,
      String department,
      String subject,
      String university) async {
    Map<String, String> fields = {
      'district': district,
      'area': area,
      'medium': medium,
      'gender': gender,
      'department': department,
      'subject': subject,
      'university': university,
    };

    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.getTeacherSearch, fields: fields);
  }

  Future<ResponseObject> getJobSearch(
      String district,
      String area,
      String medium,
      String gender,
      String department,
      String subject,
      String university) async {
    Map<String, String> fields = {
      'district': district,
      'area': area,
      'medium': medium,
      'gender': gender,
      'department': department,
      'subject': subject,
      'university': university,
    };

    // Map<String, String> fields = {
    //   'district': '1',
    //   'area': '1',
    //   'medium': '1',
    //   'gender': 'Female',
    //   'department': '1',
    //   'subject': 'subject',
    //   'university': university,
    // };

    return RepositoryHelper()
        .apiCall(method: "POST", url: Constants.getJobSearch, fields: fields);
  }

  Future<ResponseObject> getFaq() async {
    return RepositoryHelper().apiCall(url: Constants.getFaqs);
  }

  Future<ResponseObject> getTutionJobs() async {
    return RepositoryHelper().apiCall(url: Constants.getTutionJobs);
  }

  Future<ResponseObject> getOverViewData() async {
    return RepositoryHelper().apiCall(url: Constants.getOverViewData);
  }

  Future<ResponseObject> postTutorLogin(
      String phoneNumber, String password) async {
    Map<String, String> fields = {
      'phoneNumber': phoneNumber,
      'password': password,
    };
    return RepositoryHelper()
        .apiCall(method: "POST", url: Constants.postTutorLogin, fields: fields);
  }

  Future<ResponseObject> postTutorRegister(
      String name, String email, String phoneNumber, String password) async {
    Map<String, String> fields = {
      'fullName': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.postTutorRegister, fields: fields);
  }

  Future<ResponseObject> postTutorVerification(
      String verifyPhone, String initPass, String verifyPin) async {
    Map<String, String> fields = {
      'verifyPin': verifyPin,
    };
    Map<String, String> headers = {
      'verifyphone': verifyPhone,
      'initpass': initPass,
    };

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorVerify,
        fields: fields,
        headers: headers);
  }

  Future<ResponseObject> postTutorOTPResend(String verifyPhone) async {
    Map<String, String> headers = {
      'verifyphone': verifyPhone,
    };

    return RepositoryHelper().apiCall(
        method: "PUT", url: Constants.postTutorVerifyResend, headers: headers);
  }

  Future<ResponseObject> getTeacherDashboard() async {
    return RepositoryHelper().apiCall(url: Constants.getTeacherDashboard);
  }

  Future<ResponseObject> getTutionApplyList() async {
    return RepositoryHelper().apiCall(url: Constants.getTutionApplyList);
  }

  Future<ResponseObject> getTutorPayments() async {
    return RepositoryHelper().apiCall(url: Constants.getTutorPayments);
  }

  Future<ResponseObject> postPaymentWithdraw(
      String title, String amount) async {
    Map<String, String> fields = {
      'title': title,
      'amount': amount,
    };
    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorWithdrawRequest,
        fields: fields);
  }

  Future<ResponseObject> getTutorWithdrawList() async {
    return RepositoryHelper().apiCall(url: Constants.getTutorWithdrawList);
  }

  Future<ResponseObject> postTutorChangePassword(
      String oldPassword, String newPassword) async {
    Map<String, String> fields = {
      'old_password': oldPassword,
      'new_password': newPassword,
    };
    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.getTutorPasswordChange, fields: fields);
  }

  Future<ResponseObject> postApplyJob(String jobId) async {
    Map<String, String> fields = {
      'job_id': jobId,
    };
    return RepositoryHelper()
        .apiCall(method: "POST", url: Constants.postApplyJob, fields: fields);
  }

  Future<ResponseObject> postCandidateLogin(
      String phoneNumber, String password) async {
    Map<String, String> fields = {
      'phoneNumber': phoneNumber,
      'password': password,
    };
    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.postCandidateLogin, fields: fields);
  }

  Future<ResponseObject> postCandidateRegister(
      String name, String email, String phoneNumber, String password) async {
    Map<String, String> fields = {
      'fullName': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'password': password,
    };
    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.postCandidateRegister, fields: fields);
  }

  Future<ResponseObject> postCandidateVerification(
      String verifyPhone, String initPass, String verifyPin) async {
    Map<String, String> fields = {
      'verifyPin': verifyPin,
    };
    Map<String, String> headers = {
      'cverifyphone': verifyPhone,
      'cinitpass': initPass,
    };

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postCandidateVerify,
        fields: fields,
        headers: headers);
  }

  Future<ResponseObject> postCandidateForgetPassword(String phoneNumber) async {
    Map<String, String> fields = {
      'phone': phoneNumber,
    };
    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postCandidateForgetPassword,
        fields: fields);
  }

  Future<ResponseObject> postCandidateForgetPasswordVerify(
      String token, String password, String confirmPassword) async {
    Map<String, String> fields = {
      'token': token,
      'password': password,
      'confirm_password': confirmPassword,
    };
    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postCandidateForgetPasswordVerify,
        fields: fields);
  }

  Future<ResponseObject> postTutorForgetPassword(String phoneNumber) async {
    Map<String, String> fields = {
      'phone': phoneNumber,
    };
    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.postTutorForgetPassword, fields: fields);
  }

  Future<ResponseObject> postTutorForgetPasswordVerify(
      String token, String password, String confirmPassword) async {
    Map<String, String> fields = {
      'token': token,
      'password': password,
      'confirm_password': confirmPassword,
    };
    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorForgetPasswordVerify,
        fields: fields);
  }

  Future<ResponseObject> getCandidateOverview() async {
    return RepositoryHelper().apiCall(url: Constants.getCandidateOverview);
  }

  Future<ResponseObject> getCandidateDashboard() async {
    return RepositoryHelper().apiCall(url: Constants.getCandidateDashboard);
  }

  Future<ResponseObject> postCandidateProfileEdit(
    String fullName,
    String phoneNumber,
    String email,
    String presentAddress,
    String permanentAddress,
    String profilePicture,
    String nid,
    String nidBack,
  ) async {
    Map<String, String> fields = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'present_address': presentAddress,
      'parmanent_address': permanentAddress,
    };

    List<MultipartFile> files = [];

    if (profilePicture != "" && profilePicture.contains('data/user')) {
      files.add(await MultipartFile.fromPath('image', profilePicture));
    }

    if (nid != "" && nid.contains('data/user')) {
      files.add(await MultipartFile.fromPath('nid', nid));
    }

    if (nidBack != "" && nidBack.contains('data/user')) {
      files.add(await MultipartFile.fromPath('nid_back', nidBack));
    }

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.getCandidateEditProfile,
        fields: fields,
        files: files);
  }

  Future<ResponseObject> getCandidatePosts() async {
    return RepositoryHelper().apiCall(url: Constants.getCandidatePosts);
  }

  Future<ResponseObject> getCandidateTeachers() async {
    return RepositoryHelper().apiCall(url: Constants.getCandidateTeachers);
  }

  Future<ResponseObject> getCandidatePayments() async {
    return RepositoryHelper().apiCall(url: Constants.getCandidatePayments);
  }

  Future<ResponseObject> getTutionDays() async {
    return RepositoryHelper().apiCall(url: Constants.getTutionDays);
  }

  Future<ResponseObject> getTimeShifts() async {
    return RepositoryHelper().apiCall(url: Constants.getTimeShifts);
  }

  Future<ResponseObject> getSalary() async {
    return RepositoryHelper().apiCall(url: Constants.getSalary);
  }

  Future<ResponseObject> postCandidateJobPost(
      String? title,
      String? fullName,
      String? college,
      String? sGender,
      String? mediumId,
      String? departmentId,
      String? phoneNumber,
      String? email,
      String? districtId,
      String? areaId,
      String? address,
      String? genderId,
      List<Subjects> subjectId,
      String? universityId,
      String? dayWeek,
      String? salary,
      String? extranote) async {
    Map<String, String> fields = {
      'title': title ?? "",
      'fullName': fullName ?? "",
      'college': college ?? "",
      's_gender': sGender ?? "",
      'medium_id': mediumId ?? "",
      'department_id': departmentId ?? "",
      'phoneNumber': phoneNumber ?? "",
      'email': email ?? "",
      'district_id': districtId ?? "",
      'area_id': areaId ?? "",
      'address': address ?? "",
      'gender_id': genderId ?? "",
      'subject_id': json.encode(subjectId),
      'university_id': universityId ?? "",
      'dayweek': dayWeek ?? "",
      'salary': salary ?? "",
      'extranote': extranote ?? "",
      'request': "1",
    };

    return RepositoryHelper().apiCall(
        method: "POST", url: Constants.postCandidateJobPost, fields: fields);
  }

  Future<ResponseObject> postCandidateMakePayments(
    String? title,
    String? amount,
    String? teacherId,
    String? candidateId,
    String? date,
  ) async {
    Map<String, String> fields = {
      'title': title ?? "",
      'amount': amount ?? "",
      'teacher_id': teacherId ?? "",
      'candidate_id': candidateId ?? "",
      'date': date ?? "",
      'status': "pending",
    };

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postCandidateMakePayment,
        fields: fields);
  }

  Future<ResponseObject> getJobApplyList(String jobId) async {
    return RepositoryHelper()
        .apiCall(url: Constants.getJobApplyList + jobId + "/");
  }

  Future<ResponseObject> getJobMatchList(String jobId) async {
    return RepositoryHelper()
        .apiCall(url: Constants.getJobMatchList + jobId + "/");
  }

  Future<ResponseObject> postJobApplyStatus(int hiddenId, String status) async {
    return RepositoryHelper().apiCall(
        url:
            "${Constants.postJobApplyStatus}?hidden_id=$hiddenId&status=$status");
  }

  Future<ResponseObject> getMatchJob() async {
    return RepositoryHelper().apiCall(url: Constants.getMatchJob);
  }

  Future<ResponseObject> getTutorPremiumContents() async {
    return RepositoryHelper().apiCall(url: Constants.getPremiumContent);
  }

  Future<ResponseObject> postPremiumTutorRequest() async {
    return RepositoryHelper()
        .apiCall(method: "POST", url: Constants.postPremiumTutorRequest);
  }

  Future<ResponseObject> postTeacherPersonalInformationUpdate(
    String fullName,
    String phoneNumber,
    String email,
    String gender,
    String teacherUniversity,
    String teacherSubject,
    String teacherDegree,
    String divisionId,
    String teacherPresentAddress,
    String teacherPermanentAddress,
    String aboutYourself,
    String imagePath,
    String videoPath,
  ) async {
    Map<String, String> fields = {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'gender': gender,
      'teacher_university': teacherUniversity,
      'teacher_subject': teacherSubject,
      'teacher_degree': teacherDegree,
      'division_id': divisionId,
      'teacher_present_address': teacherPresentAddress,
      'teacher_permanent_address': teacherPermanentAddress,
      'about_yourself': aboutYourself,
    };

    List<MultipartFile> files = [];

    if (imagePath != "" && imagePath.contains('data/user')) {
      files.add(await MultipartFile.fromPath('image', imagePath));
    }

    if (videoPath != "" && videoPath.contains('data/user')) {
      files.add(await MultipartFile.fromPath('video', videoPath));
    }

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorPersonalInformationUpdate,
        fields: fields,
        files: files);
  }

  Future<ResponseObject> postTeacherEducationalInformationUpdate(
      String sscYear,
      String sscInstitute,
      String sscGroup,
      String sscGpa,
      String hscYear,
      String hscInstitute,
      String hscGroup,
      String hscGpa,
      String honoursYear,
      String honoursInstitute,
      String honoursSubject,
      String honoursGpa,
      String universityId,
      String sscCertificate,
      String hscCertificate,
      String otherCertificate) async {
    Map<String, String> fields = {
      'ssc_year': sscYear,
      'ssc_institute': sscInstitute,
      'ssc_group': sscGroup,
      'ssc_gpa': sscGpa,
      'hsc_year': hscYear,
      'hsc_institute': hscInstitute,
      'hsc_group': hscGroup,
      'hsc_gpa': hscGpa,
      'honours_year': honoursYear,
      'honours_institute': honoursInstitute,
      'honours_subject': honoursSubject,
      'honours_gpa': honoursGpa,
      'university_id': universityId,
    };

    List<MultipartFile> files = [];

    if (sscCertificate != "" && sscCertificate.contains('data/user')) {
      files
          .add(await MultipartFile.fromPath('ssc_certificate', sscCertificate));
    }

    if (hscCertificate != "" && hscCertificate.contains('data/user')) {
      files
          .add(await MultipartFile.fromPath('hsc_certificate', hscCertificate));
    }

    if (otherCertificate != "" && otherCertificate.contains('data/user')) {
      files.add(
          await MultipartFile.fromPath('other_certificate', otherCertificate));
    }

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorEducationalInformationUpdate,
        fields: fields,
        files: files);
  }

  Future<ResponseObject> postTeacherTutionInformationUpdate(
      String districtId, String tutionSalary, String tutionMedium) async {
    Map<String, String> fields = {
      'district_id': districtId,
      'tuition_salary': tutionSalary,
      'tuition_medium': tutionMedium,
    };

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorTutionInformationUpdate,
        fields: fields);
  }

  Future<ResponseObject> postTeacherVerifyUpdate(String nidCard, String nidBack,
      String studentCardFront, String studentCardBack) async {
    List<MultipartFile> files = [];

    if (nidCard != "" && nidCard.contains('data/user')) {
      files.add(await MultipartFile.fromPath('nid_card', nidCard));
    }

    if (nidBack != "" && nidBack.contains('data/user')) {
      files.add(await MultipartFile.fromPath('nid_card_back', nidBack));
    }

    if (studentCardFront != "" && studentCardFront.contains('data/user')) {
      files.add(await MultipartFile.fromPath('student_card', studentCardFront));
    }

    if (studentCardBack != "" && studentCardBack.contains('data/user')) {
      files.add(
          await MultipartFile.fromPath('student_card_back', studentCardBack));
    }

    return RepositoryHelper().apiCall(
        method: "POST",
        url: Constants.postTutorVerifyInformationUpdate,
        files: files);
  }
}
