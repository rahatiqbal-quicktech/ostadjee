import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/area_model.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_model.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_overview.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_payment_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_post_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_teacher_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/department_model.dart';
import 'package:ostadjee/app/common/pojo_model/division_model.dart';
import 'package:ostadjee/app/common/pojo_model/feature_tutor_model.dart';
import 'package:ostadjee/app/common/pojo_model/gender_model.dart';
import 'package:ostadjee/app/common/pojo_model/job_apply_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/job_match_list_model.dart';
import 'package:ostadjee/app/common/pojo_model/match_job_model.dart';
import 'package:ostadjee/app/common/pojo_model/medium_model.dart';
import 'package:ostadjee/app/common/pojo_model/premium_content_model.dart';
import 'package:ostadjee/app/common/pojo_model/salary_model.dart';
import 'package:ostadjee/app/common/pojo_model/slider_model.dart';
import 'package:ostadjee/app/common/pojo_model/social_icons_model.dart';
import 'package:ostadjee/app/common/pojo_model/subject_model.dart';
import 'package:ostadjee/app/common/pojo_model/teacher_model.dart';
import 'package:ostadjee/app/common/pojo_model/time_shift_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_apply_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_days_model.dart';
import 'package:ostadjee/app/common/pojo_model/tution_jobs_model.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_details_model.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_match_job_model.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_model.dart';
import 'package:ostadjee/app/common/pojo_model/tutor_payments_model.dart';
import 'package:ostadjee/app/common/pojo_model/university_model.dart';
import 'package:ostadjee/app/common/pojo_model/withdraw_list_model.dart';
import 'package:ostadjee/app/common/storage/storage.dart';
import 'package:ostadjee/app/common/values/app_colors.dart';
import 'package:ostadjee/app/common/values/strings.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_dashboard_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_job_list_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_make_payment_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_post_job_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_profile_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_tutor_list_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_balance_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_change_password_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_dashboard_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_edit_profile_account_verification_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_edit_profile_educational_info_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_edit_profile_personal_info_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_edit_profile_tuition_info_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_profile_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/tutor_withdraw_list_widget.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:ostadjee/changes/features/tutor_department/model/tutor_department_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class FrontendController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var token = "".obs;
  var tutor = false.obs;

  Position? currentLocation;

  late FirebaseAuth auth;

  TextEditingController paymentTitleController = TextEditingController();
  TextEditingController paymentAmountController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController instituteController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationDetailsController = TextEditingController();
  TextEditingController otherRequirementsController = TextEditingController();

  var profilePhotoUrl = "".obs;
  var profileVideoUrl = "".obs;
  var gender = "".obs;
  TextEditingController currentInstituteController = TextEditingController();
  TextEditingController subjectNameController = TextEditingController();
  TextEditingController heigestQualificationController =
      TextEditingController();
  TextEditingController presentAddress = TextEditingController();
  TextEditingController permanentAddress = TextEditingController();
  TextEditingController aboutYourself = TextEditingController();
  TextEditingController tuitionExperience = TextEditingController();

  TextEditingController sscYear = TextEditingController();
  TextEditingController sscInstitute = TextEditingController();
  TextEditingController sscGroup = TextEditingController();
  TextEditingController sscGpa = TextEditingController();
  var sscCertificate = "".obs;

  TextEditingController hscYear = TextEditingController();
  TextEditingController hscInstitute = TextEditingController();
  TextEditingController hscGroup = TextEditingController();
  TextEditingController hscGpa = TextEditingController();
  var hscCertificate = "".obs;

  TextEditingController graduationYear = TextEditingController();
  TextEditingController graduationInstitute = TextEditingController();
  TextEditingController graduationDepartment = TextEditingController();
  TextEditingController graduationCgpa = TextEditingController();
  var graduationCertificate = "".obs;

  var nidFrontFile = "".obs;
  var nidBackFile = "".obs;
  var studentIdFrontFile = "".obs;
  var studentIdBackFile = "".obs;

  // Candidate Edit

  var candidateProfilePhotoUrl = "".obs;
  var candidateFrontNidUrl = "".obs;
  var candidateBackNidUrl = "".obs;

  TextEditingController candidateName = TextEditingController();
  TextEditingController candidatePhone = TextEditingController();
  TextEditingController candidateEmail = TextEditingController();
  TextEditingController candidatePresentAddress = TextEditingController();
  TextEditingController candidatePermanentAddress = TextEditingController();

  // Candidate Edit

  var paymentDate = DateTime.now().obs;

  var oldPasswordObsecure = true.obs;
  var newPasswordObsecure = true.obs;
  var confirmPasswordObsecure = true.obs;

  var slider = SliderModel().obs;

  var featureTutor = FeatureTutorModel().obs;
  var featureJobs = TutorMatchJobModel().obs;

  var tutorDetails = TutorDetailsModel().obs;

  var premiumTutor = TutorModel().obs;
  var tutionJobs = TutionJobsModel().obs;
  var jobApplyList = JobApplyListModel().obs;
  var jobMatchList = JobMatchListModel().obs;
  var candidatePostList = CandidatePostListModel().obs;

  var socialIcons = SocialIconsModel().obs;

  var tutionDays = TutionDaysModel().obs;
  var timeShifts = TimeShiftModel().obs;
  var salary = SalaryModel().obs;
  var matchJob = MatchJobModel().obs;
  var premiumContent = PremiumContentModel().obs;

  // search
  var division = DivisionModel().obs;
  var area = AreaModel().obs;
  var mediums = MediumModel().obs;
  var departments = DepartmentModel().obs;
  var subjects = SubjectModel().obs;
  var genders = GenderModel().obs;
  var universities = UniversityModel().obs;
  var tutorDepartments = TutorDepartmentModel().obs;
  var tutors = TutorModel().obs;
  var searchTutionJobs = TutionJobsModel().obs;
  var payments = TutorPaymentsModel().obs;
  var withdrawList = WithdrawListModel().obs;

  Divisions? selectedDivision;
  Areas? selectedArea;
  Mediums? selectedMedium;
  Departments? selectedDepartment;
  Subjects? selectedSubject;
  Salaries? selectedSalaries;
  Genders? selectedGender, selectedTeacherGender;
  Universities? selectedUniveristy;
  Tutiondays? selectedTutionDays;
  Subjects? selectedTutionSubject;
  Timeshifts? selectedTimeShifts;
  Salaries? selectedTutionSalary;
  Salaries? selectedSalaryRange;
  Teacherlist? selectedTeacher;

  var selectedSubjects = <Subjects>[].obs;
  var selectedPreferredClass = <Departments>[].obs;
  var selectedPreferredSubjects = <Subjects>[].obs;
  var selectedDaysPerWeek = <Tutiondays>[].obs;
  var selectedTimeShift = <Timeshifts>[].obs;
  // added later
  var selectUniversities = <Universities>[].obs;

  // Profile
  List<Tab> profileTabs = const <Tab>[];
  List<Widget> profileWidget = const <Widget>[];

  var teacherDashboard = TeacherModel().obs;
  var candidateOverview = CandidateOverview().obs;
  var candidateDashboard = CandidateModel().obs;
  var tutionApplyList = TutionApplyModel().obs;
  var candidateTeacherList = CandidateTeacherListModel().obs;
  var candidatePaymentList = CandidatePaymentListModel().obs;

  late TabController tabController;
  late VideoPlayerController videoController;

  var haveVideo = false.obs;

  List<Tab> tutorTabs = const <Tab>[
    Tab(text: Strings.dashboard),
    Tab(text: Strings.myProfile),
    Tab(text: Strings.myBalance),
    // Tab(text: Strings.applyTution),
    // Tab(text: Strings.paymentWithdraw),
    Tab(text: Strings.withdrawList),
  ];

  List<Tab> candidateTabs = const <Tab>[
    Tab(text: Strings.dashboard),
    Tab(text: Strings.myProfile),
    Tab(text: Strings.postJob),
    Tab(text: Strings.jobList),
    Tab(text: Strings.hiredTeacher),
    Tab(text: Strings.makePayment),
    // Tab(text: Strings.paymentHistory),
  ];

  final List<Widget> tutorWidgets = const <Widget>[
    TutorDashboardWidget(),
    TutorProfileWidget(),
    TutorBalanceWidget(),
    // TutorApplyTutionWidget(),
    // TutorPaymentWithdrawWidget(),
    TutorWithdrawListWidget(),
  ];

  final List<Widget> candidateWidgets = <Widget>[
    const CandidateDashboardWidget(),
    const CandidateProfileWidget(),
    CandidatePostJobWidget(),
    const CandidateJobListWidget(),
    const CandidateTutorListWidget(),
    const CandidateMakePaymentWidget(),
  ];

  List<Icon> profileEditTabs = const <Icon>[
    Icon(Icons.person, color: AppColors.white),
    Icon(Icons.school, color: AppColors.white),
    Icon(Icons.history_edu, color: AppColors.white),
    Icon(Icons.how_to_reg, color: AppColors.white),
    // Icon(Icons.vpn_key, color: AppColors.white),
  ];

  var selectedProfileEditTab = 0.obs;

  final List<Widget> profileEditWidgets = <Widget>[
    const TutorEditProfilePersonalInformationWidget(),
    const TutorEditProfileEducationalInformationWidget(),
    TutorEditProfileTutionInformationWidget(),
    const TutorEditProfileAccountVerificationWidget(),
    const TutorChangePasswordWidget(),
  ];

  @override
  void onInit() {
    notifyChanges();

    tabController = TabController(vsync: this, length: profileTabs.length);

    auth = FirebaseAuth.instance;

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    notifyChanges();

    getSliders();
    getSocialIcons();
    getFeatureTutors();
    getPremiumTutor();
    getTutionJobs();
    getTutionDays();
    getTimeShifts();
    getSalary();
    getDivision();
    getMedium();
    getGenders();
    getUniversities();

    getUserLocation();

    if (token.value.isNotEmpty && tutor.value) {
      getFeatureJobs();
      getTeacherDashboard();
      getTutionApplyList();
      getTutorPayments();
      getWithdrawList();
      getMatchJob();
      getTutorPremiumContents();
    }

    if (token.value.isNotEmpty && !tutor.value) {
      getCandidateOverview();
      getCandidateDashboard();
      getCandidatePosts();
      getCandidateTeachers();
      getCandidatePayments();
    }
  }

  @override
  void onClose() {
    tabController.dispose();

    super.onClose();
  }

  void onGetCandidateProfilePicture(File? file) {
    if (file != null) {
      candidateProfilePhotoUrl(file.path);
    }
  }

  void onGetCandidateFrontNid(File? file) {
    if (file != null) {
      candidateFrontNidUrl(file.path);
    }
  }

  void onGetCandidateBackNid(File? file) {
    if (file != null) {
      candidateBackNidUrl(file.path);
    }
  }

  void onGetProfilePicture(File? file) {
    if (file != null) {
      profilePhotoUrl(file.path);
    }
  }

  void onGetProfileVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      profileVideoUrl(file.path);

      showSuccessToast("Video selected");
    } else {
      showSuccessToast("Video not selected");
    }
  }

  void onGetSscCertificate(File? file) {
    if (file != null) {
      sscCertificate(file.path);
    }
  }

  void onGetHscCertificate(File? file) {
    if (file != null) {
      hscCertificate(file.path);
    }
  }

  void onGetHonorsCertificate(File? file) {
    if (file != null) {
      graduationCertificate(file.path);
    }
  }

  void onGetFrontNid(File? file) {
    if (file != null) {
      nidFrontFile(file.path);
      print("nidFrontFile path ${file.path}");
    }
  }

  void onGetBackNid(File? file) {
    if (file != null) {
      nidBackFile(file.path);
    }
  }

  void onGetStudentIdFront(File? file) {
    if (file != null) {
      studentIdFrontFile(file.path);
    }
  }

  void onGetStudentIdBack(File? file) {
    if (file != null) {
      studentIdBackFile(file.path);
    }
  }

  Future<Position> locateUser() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLocation!.latitude, currentLocation!.longitude);

    locationDetailsController.text =
        "${placemarks[0].street!}, ${placemarks[0].subLocality!}, ${placemarks[0].locality!}";
  }

  selectPaymentDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: paymentDate.value,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != paymentDate.value) {
      paymentDate(picked);
    }
  }

  void onOldObsecureClick() {
    oldPasswordObsecure.value = !oldPasswordObsecure.value;
  }

  void onNewObsecureClick() {
    newPasswordObsecure.value = !newPasswordObsecure.value;
  }

  void onConfirmObsecureClick() {
    confirmPasswordObsecure.value = !confirmPasswordObsecure.value;
  }

  void notifyChanges() {
    token(Storage.getValue(Constants.token));

    if (Storage.hasData(Constants.userType)) {
      tutor(Storage.getValue(Constants.userType) == "0");
    }

    if (tutor.value) {
      profileTabs = tutorTabs;
      profileWidget = tutorWidgets;
    } else {
      profileTabs = candidateTabs;
      profileWidget = candidateWidgets;
    }
  }

  void onHomeClick() {
    Get.offAndToNamed(Routes.HOME);
  }

  void onPremiumTutorsClick() {
    Get.offAndToNamed(Routes.PREMIUM_TUTOR_VIEW);
  }

  void onRequestForTutorClick() {
    Get.offAndToNamed(Routes.CANDIDATE_LOGIN);
  }

  void onTutionJobsClick() {
    Get.offAndToNamed(Routes.TUTION_JOBS_VIEW);
  }

  void onHowItWorksClick() {
    Get.offAndToNamed(Routes.HOW_IT_WORKS);
  }

  void onDashboardClick() {
    tabController.animateTo(0);
    Get.offAndToNamed(Routes.PROFILE_VIEW);
  }

  void onMyProfileClick() {
    tabController.animateTo(1);
    Get.offAndToNamed(Routes.PROFILE_VIEW);
  }

  void onJobPostClick() {
    tabController.animateTo(2);
    Get.toNamed(Routes.PROFILE_VIEW);
  }

  void onEditProfileClick() {
    tabController.animateTo(2);
    Get.offAndToNamed(Routes.PROFILE_VIEW);
  }

  void onContactUsClick() async {
    try {
      await launchUrl(Uri.parse("https://ostadjee.com/"));
    } catch (launch) {
      Get.snackbar("Error", "Couldn't launch url");
    }
    // Get.back();
  }

  void onShareAppClick() {
    Get.back();
  }

  void onRateAppClick() {
    Get.back();
  }

  void onPrivacyPolicyClick() async {
    try {
      await launchUrl(Uri.parse("https://ostadjee.com/more/privacy-policy"));
    } catch (launch) {
      Get.snackbar("Error", "Couldn't launch url");
    }
    Get.back();
  }

  void onWebsiteClick() async {
    // Get.back();
    try {
      await launchUrl(Uri.parse("https://ostadjee.com/"));
    } catch (launch) {
      Get.snackbar("Error", "Couldn't launch url");
    }
  }

  void onAboutUsClick() async {
    // Get.back();
    try {
      await launchUrl(Uri.parse("https://ostadjee.com/more/about-us"));
    } catch (launch) {
      Get.snackbar("Error", "Couldn't launch url");
    }
  }

  void onLogoutClick() {
    Storage.clearStorage().then((value) => notifyChanges());

    if (auth.currentUser != null) {
      auth.signOut();
    }

    Get.offAllNamed(Routes.LANDING);
  }

  void getSliders() async {
    final _response = await FrontEndRepository().getSliders();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      slider(SliderModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getSocialIcons() async {
    final _response = await FrontEndRepository().getSocialIcons();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      socialIcons(
          SocialIconsModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getFeatureTutors() async {
    final _response = await FrontEndRepository().getFeatureTutors();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      featureTutor(
          FeatureTutorModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getFeatureJobs() async {
    final _response = await FrontEndRepository().getFeatureJobs();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      featureJobs(TutorMatchJobModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  getTutorDetails(int tutorId) async {
    Get.toNamed(Routes.TUTOR_PROFILE_PUBLIC_VIEW);

    final _response = await FrontEndRepository().getTutorDetails(tutorId);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutorDetails(
          TutorDetailsModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getPremiumTutor() async {
    final _response = await FrontEndRepository().getPremiumTutors();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      premiumTutor(
          TutorModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void onSearchIconClick() {
    Get.toNamed(Routes.SEARCH);
  }

  void getDivision() async {
    final _response = await FrontEndRepository().getDivisions();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      division(
          DivisionModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectDivision(Divisions value) {
    selectedDivision = value;

    selectedArea = null;

    getArea(selectedDivision!.id!);
  }

  void getArea(int id) async {
    final _response = await FrontEndRepository().getArea(id);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      area(AreaModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectArea(Areas value) {
    selectedArea = value;

    // selectedMedium = null;

    // getMedium();
  }

  void getMedium() async {
    final _response = await FrontEndRepository().getMedium();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      mediums(MediumModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectMedium(Mediums value) {
    selectedMedium = value;

    selectedDepartment = null;

    getDepartments(selectedMedium!.id!);
  }

  void getDepartments(int id) async {
    final _response = await FrontEndRepository().getDepartment(id);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      departments(
          DepartmentModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectDepartment(Departments value) {
    selectedDepartment = value;

    selectedSubject = null;

    getSubjects(selectedDepartment!.id!);
  }

  void selectPreferredClassForTutionInformation(Departments value) {
    selectedPreferredClass.add(value);

    selectedPreferredSubjects.clear();

    getSubjects(selectedDepartment!.id!);
  }

  void removePreferredClassForTutionInformation(Departments value) {
    selectedPreferredClass.remove(value);
  }

  void getSubjects(int? id) async {
    final _response = await FrontEndRepository().getSubject(id);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      subjects(SubjectModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectSubject(Subjects value) {
    selectedSubject = value;

    // getGenders();
  }

  void selectPreferredSubjectForTutionInformation(Subjects value) {
    selectedPreferredSubjects.add(value);
  }

  void removePreferredSubjectForTutionInformation(Subjects value) {
    selectedPreferredSubjects.remove(value);
  }

  void selectSubjectForJobPost(Subjects value) {
    selectedSubjects.add(value);

    update();
  }

  void removeSubjectForJobPost(Subjects value) {
    selectedSubjects.remove(value);
  }

  void selectUniversitiesForJobPost(Universities value) {
    selectUniversities.add(value);

    update();
  }

  void removeUniversitiesForJobPost(Universities value) {
    selectUniversities.remove(value);
  }

  void getUniversities() async {
    final _response = await FrontEndRepository().getUniversities();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      universities(
          UniversityModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTutorDepartments() async {
    final _response = await FrontEndRepository().getTutorDepartments();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutorDepartments(TutorDepartmentModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void selectUniversity(Universities value) {
    selectedUniveristy = value;
  }

  void getGenders() {
    List<Genders>? gender = [];

    gender.add(Genders(value: "Male", text: "Male"));
    gender.add(Genders(value: "Female", text: "Female"));

    var data = <String, dynamic>{};
    data['genders'] = gender.map((v) => v.toJson()).toList();

    data;

    genders(GenderModel.fromJson(data));
  }

  void selectGender(Genders value) {
    selectedGender = value;
  }

  void selectTeacherGender(Genders value) {
    selectedTeacherGender = value;
  }

  void selectDaysPerWeek(Tutiondays value) {
    selectedTutionDays = value;
  }

  void selectDaysPerWeekForTutionInformation(Tutiondays value) {
    selectedDaysPerWeek.add(value);
  }

  void removeDaysPerWeekForTutionInformation(Tutiondays value) {
    selectedDaysPerWeek.remove(value);
  }

  void selectSubjects(Subjects value) {
    selectedSubject = value;
  }

  void selectTimeShifts(Timeshifts value) {
    selectedTimeShifts = value;
  }

  void selectTimeShiftsForTutionInformation(Timeshifts value) {
    selectedTimeShift.add(value);
  }

  void removeTimeShiftsForTutionInformation(Timeshifts value) {
    selectedTimeShift.remove(value);
  }

  void selectSalaryRange(Salaries value) {
    selectedSalaries = value;
  }

  void selectTeacher(Teacherlist value) {
    selectedTeacher = value;
  }

  void searchByDivision(String country) {
    for (int i = 0; i < division.value.divisions!.length; i++) {
      if (division.value.divisions![i].text == country) {
        selectedDivision = division.value.divisions![i];

        searchData();
      }
    }
  }

  void searchData({bool goSearchResultPage = true}) async {
    // String parameter =
    //     "district_id=${selectedDivision == null ? "" : selectedDivision!.id}&area_id=${selectedArea == null ? "" : selectedArea!.id}&medium_id=${selectedMedium == null ? "" : selectedMedium!.id}&department_id=${selectedDepartment == null ? "" : selectedDepartment!.id}&subject_id=${selectedSubject == null ? "" : selectedSubject!.id}&gender_id=${selectedGender == null ? "" : selectedGender!.value}&university_id=${selectedUniveristy == null ? "" : selectedUniveristy!.id}";
    if (goSearchResultPage == true) {
      Get.toNamed(Routes.SEARCH_RESULT);
    }

    if (tutor.value) {
      final _response = await FrontEndRepository().getJobSearch(
          selectedDivision == null ? "" : selectedDivision!.id.toString(),
          selectedArea == null ? "" : selectedArea!.id.toString(),
          selectedMedium == null ? "" : selectedMedium!.id.toString(),
          selectedGender == null ? "" : selectedGender!.value!,
          selectedDepartment == null ? "" : selectedDepartment!.id.toString(),
          selectedSubject == null ? "" : selectedSubject!.id.toString(),
          selectedUniveristy == null ? "" : selectedUniveristy!.id.toString());
      if (_response.id == ResponseCode.SUCCESSFUL) {
        searchTutionJobs(
            TutionJobsModel.fromJson(json.decode(_response.object.toString())));
      } else {
        showErrorToast(_response.object.toString());
      }
    } else {
      final _response = await FrontEndRepository().getTeacherSearch(
          selectedDivision == null ? "" : selectedDivision!.id.toString(),
          selectedArea == null ? "" : selectedArea!.id.toString(),
          selectedMedium == null ? "" : selectedMedium!.id.toString(),
          selectedGender == null ? "" : selectedGender!.value!,
          selectedDepartment == null ? "" : selectedDepartment!.id.toString(),
          selectedSubject == null ? "" : selectedSubject!.id.toString(),
          selectedUniveristy == null ? "" : selectedUniveristy!.id.toString());
      if (_response.id == ResponseCode.SUCCESSFUL) {
        tutors(TutorModel.fromJson(json.decode(_response.object.toString())));
      } else {
        showErrorToast(_response.object.toString());
      }
    }
  }

  Future<TutorModel?> getAllTutorsList() async {
    // String parameter =
    //     "district_id=${selectedDivision == null ? "" : selectedDivision!.id}&area_id=${selectedArea == null ? "" : selectedArea!.id}&medium_id=${selectedMedium == null ? "" : selectedMedium!.id}&department_id=${selectedDepartment == null ? "" : selectedDepartment!.id}&subject_id=${selectedSubject == null ? "" : selectedSubject!.id}&gender_id=${selectedGender == null ? "" : selectedGender!.value}&university_id=${selectedUniveristy == null ? "" : selectedUniveristy!.id}";

    final _response = await FrontEndRepository().getTeacherSearch(
        selectedDivision == null ? "" : selectedDivision!.id.toString(),
        selectedArea == null ? "" : selectedArea!.id.toString(),
        selectedMedium == null ? "" : selectedMedium!.id.toString(),
        selectedGender == null ? "" : selectedGender!.value!,
        selectedDepartment == null ? "" : selectedDepartment!.id.toString(),
        selectedSubject == null ? "" : selectedSubject!.id.toString(),
        selectedUniveristy == null ? "" : selectedUniveristy!.id.toString());
    if (_response.id == ResponseCode.SUCCESSFUL) {
      return TutorModel.fromJson(json.decode(_response.object.toString()));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

// this part was commented out before
  void getTutionJobs() async {
    final _response = await FrontEndRepository().getTutionJobs();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutionJobs(
          TutionJobsModel.fromJson(json.decode(_response.object.toString())));
      print("This is tution jobs");
      print(tutionJobs.value);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTeacherDashboard() async {
    final _response = await FrontEndRepository().getTeacherDashboard();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      teacherDashboard(
          TeacherModel.fromJson(json.decode(_response.object.toString())));

      profilePhotoUrl(teacherDashboard.value.teacher?.image ?? "");
      profileVideoUrl(teacherDashboard.value.teacher?.video ?? "");
      if (profileVideoUrl.value.isNotEmpty) {
        videoController = VideoPlayerController.network(profileVideoUrl.value)
          ..initialize().then((_) {
            haveVideo(true);
          });
      }
      print(
          "getTeacherDashboard - ${teacherDashboard.value.teacher?.fullName}");
      nameController.text =
          teacherDashboard.value.teacher?.fullName ?? "Name test";
      phoneNumberController.text =
          teacherDashboard.value.teacher?.phoneNumber ?? "";
      emailController.text = teacherDashboard.value.teacher?.email ?? "";
      gender(teacherDashboard.value.teacher?.gender ?? "");
      currentInstituteController.text =
          teacherDashboard.value.teacher?.teacherUniversity ?? "";
      subjectNameController.text =
          teacherDashboard.value.teacher?.teacherSubject ?? "";
      heigestQualificationController.text =
          teacherDashboard.value.teacher?.teacherDegree ?? "";
      presentAddress.text =
          teacherDashboard.value.teacher?.teacherPresentAddress ?? "";
      permanentAddress.text =
          teacherDashboard.value.teacher?.teacherPermanentAddress ?? "";
      aboutYourself.text = teacherDashboard.value.teacher?.aboutYourself ?? "";

      sscYear.text = teacherDashboard.value.teacher?.sscYear ?? "";
      sscInstitute.text = teacherDashboard.value.teacher?.sscInstitute ?? "";
      sscGroup.text = teacherDashboard.value.teacher?.sscGroup ?? "";
      sscGpa.text = teacherDashboard.value.teacher?.sscGpa ?? "";
      sscCertificate(teacherDashboard.value.teacher?.sscCertificate ?? "");

      hscYear.text = teacherDashboard.value.teacher?.hscYear ?? "";
      hscInstitute.text = teacherDashboard.value.teacher?.hscInstitute ?? "";
      hscGroup.text = teacherDashboard.value.teacher?.hscGroup ?? "";
      hscGpa.text = teacherDashboard.value.teacher?.hscGpa ?? "";
      hscCertificate(teacherDashboard.value.teacher?.hscCertificate ?? "");

      graduationYear.text = teacherDashboard.value.teacher?.honoursYear ?? "";
      graduationInstitute.text =
          teacherDashboard.value.teacher?.honoursInstitute ?? "";
      graduationDepartment.text =
          teacherDashboard.value.teacher?.honoursSubject ?? "";
      graduationCgpa.text = teacherDashboard.value.teacher?.honoursGpa ?? "";
      graduationCertificate(
          teacherDashboard.value.teacher?.honoursCertificate ?? "");

      nidFrontFile(teacherDashboard.value.teacher?.nidCard ?? "");
      nidBackFile(teacherDashboard.value.teacher?.nidCardBack ?? "");
      studentIdFrontFile(teacherDashboard.value.teacher?.studentCard ?? "");
      studentIdBackFile(teacherDashboard.value.teacher?.studentCardBack ?? "");

      tuitionExperience.text =
          teacherDashboard.value.teacher?.tuitionExperience ?? "";

      if (division.value.divisions != null) {
        for (int i = 0; i < division.value.divisions!.length; i++) {
          if (division.value.divisions![i].id ==
              teacherDashboard.value.teacher?.divisionId) {
            selectedDivision = division.value.divisions![i];
          }
        }
      }
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTutionApplyList() async {
    final _response = await FrontEndRepository().getTutionApplyList();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutionApplyList(
          TutionApplyModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTutorPayments() async {
    final _response = await FrontEndRepository().getTutorPayments();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      payments(TutorPaymentsModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postPaymentWithdraw() async {
    final _response = await FrontEndRepository().postPaymentWithdraw(
        paymentTitleController.text, paymentAmountController.text);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      paymentTitleController.clear();
      paymentAmountController.clear();

      getTutorPayments();
      getWithdrawList();

      showSuccessToast("Request successfully send");
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getWithdrawList() async {
    final _response = await FrontEndRepository().getTutorPayments();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      withdrawList(
          WithdrawListModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postTeacherPasswordChange() async {
    final _response = await FrontEndRepository().postTutorChangePassword(
        oldPasswordController.text, newPasswordController.text);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      oldPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();

      showSuccessToast("Password change successfully");

      onLogoutClick();
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postApplyJob(String jobId) async {
    if (token.value.isNotEmpty && tutor.value) {
      final _response = await FrontEndRepository().postApplyJob(jobId);
      if (_response.id == ResponseCode.SUCCESSFUL) {
        Get.back();
        getTutionApplyList();
        showSuccessToast("Applied Successfully");
      } else {
        showErrorToast(_response.object.toString());
      }
    } else {
      Get.offAndToNamed(Routes.TUTOR_LOGIN);
    }
  }

  void getCandidateOverview() async {
    final _response = await FrontEndRepository().getCandidateOverview();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      candidateOverview(
          CandidateOverview.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getCandidateDashboard() async {
    final _response = await FrontEndRepository().getCandidateDashboard();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      candidateDashboard(
          CandidateModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postCandidateProfileEdit() async {
    final _response = await FrontEndRepository().postCandidateProfileEdit(
      candidateName.text,
      candidatePhone.text,
      candidateEmail.text,
      candidatePresentAddress.text,
      candidatePermanentAddress.text,
      candidateProfilePhotoUrl.value,
      candidateFrontNidUrl.value,
      candidateBackNidUrl.value,
    );
    if (_response.id == ResponseCode.SUCCESSFUL) {
      showSuccessToast("Profile updated successfully");

      Get.back();
      Get.back();

      getCandidateDashboard();
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getCandidatePosts() async {
    final _response = await FrontEndRepository().getCandidatePosts();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      candidatePostList(CandidatePostListModel.fromJson(
          json.decode(_response.object.toString())));
      print("This is matched jobs");
      print(candidatePostList.value);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getCandidateTeachers() async {
    final _response = await FrontEndRepository().getCandidateTeachers();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      candidateTeacherList(CandidateTeacherListModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getCandidatePayments() async {
    final _response = await FrontEndRepository().getCandidatePayments();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      candidatePaymentList(CandidatePaymentListModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTutionDays() async {
    final _response = await FrontEndRepository().getTutionDays();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      tutionDays(
          TutionDaysModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getTimeShifts() async {
    final _response = await FrontEndRepository().getTimeShifts();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      timeShifts(
          TimeShiftModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void getSalary() async {
    final _response = await FrontEndRepository().getSalary();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      salary(SalaryModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postCandidateJobPost() async {
    final _response = await FrontEndRepository().postCandidateJobPost(
      titleController.text,
      nameController.text,
      instituteController.text,
      selectedGender?.value ?? "",
      selectedMedium?.id.toString() ?? "",
      selectedDepartment?.id.toString() ?? "",
      phoneNumberController.text,
      emailController.text,
      selectedDivision?.id.toString() ?? "",
      selectedArea?.id.toString() ?? "",
      locationDetailsController.text,
      selectedTeacherGender?.value ?? "",
      selectedSubjects,
      selectedUniveristy?.id.toString() ?? "",
      selectedTutionDays?.id.toString() ?? "",
      selectedSalaryRange?.id.toString() ?? "",
      otherRequirementsController.text,
    );
    if (_response.id == ResponseCode.SUCCESSFUL) {
      titleController.clear();
      nameController.clear();
      instituteController.clear();
      selectedGender = null;
      selectedMedium = null;
      selectedDepartment = null;
      phoneNumberController.clear();
      emailController.clear();
      selectedDivision = null;
      selectedArea = null;
      locationDetailsController.clear();
      selectedTeacherGender = null;
      selectedSubjects.clear();
      selectedTutionDays = null;
      selectedSalaryRange = null;
      otherRequirementsController.clear();

      showSuccessToast("Post Added Successfully");

      Get.back();

      getCandidatePosts();
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postCandidateMakePayments() async {
    final _response = await FrontEndRepository().postCandidateMakePayments(
        paymentTitleController.text,
        paymentAmountController.text,
        selectedTeacher?.id.toString() ?? "",
        candidateDashboard.value.candidate?.id.toString() ?? "",
        paymentDate.value.toLocal().toString().split(' ')[0]);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      selectedTeacher = null;
      titleController.clear();
      nameController.clear();
      paymentDate(DateTime.now());

      showSuccessToast("Payment added successfully");

      getCandidatePayments();
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  getJobApplyList(String jobId) async {
    final _response = await FrontEndRepository().getJobApplyList(jobId);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      jobApplyList(
          JobApplyListModel.fromJson(json.decode(_response.object.toString())));

      Get.toNamed(Routes.JOB_APPLY_DETAILS);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  getJobMatchList(String jobId) async {
    final _response = await FrontEndRepository().getJobMatchList(jobId);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      jobMatchList(
          JobMatchListModel.fromJson(json.decode(_response.object.toString())));

      Get.toNamed(Routes.JOB_MATCH_DETAILS);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  postJobApplyStatus(int jobId, int hiddenId, String status) async {
    final _response =
        await FrontEndRepository().postJobApplyStatus(hiddenId, status);

    if (_response.id == ResponseCode.SUCCESSFUL) {
      showSuccessToast("Successfully Status Updated");

      getJobApplyList(jobId.toString());
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  getMatchJob() async {
    final _response = await FrontEndRepository().getMatchJob();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      matchJob(
          MatchJobModel.fromJson(json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  getTutorPremiumContents() async {
    final _response = await FrontEndRepository().getTutorPremiumContents();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      premiumContent(PremiumContentModel.fromJson(
          json.decode(_response.object.toString())));
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  postPremiumTutorRequest() async {
    final _response = await FrontEndRepository().postPremiumTutorRequest();
    if (_response.id == ResponseCode.SUCCESSFUL) {
      Get.back();

      String message = json.decode(_response.object.toString())['message'];

      showSuccessToast(message);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void postTeacherPersonalInformationUpdate({bool? isNext}) async {
    if (isNext ?? false) {
      selectedProfileEditTab(1);
    } else {
      final _response =
          await FrontEndRepository().postTeacherPersonalInformationUpdate(
        nameController.text,
        phoneNumberController.text,
        emailController.text,
        gender.value,
        currentInstituteController.text,
        subjectNameController.text,
        heigestQualificationController.text,
        selectedDivision!.id.toString(),
        presentAddress.text,
        permanentAddress.text,
        aboutYourself.text,
        profilePhotoUrl.value,
        profileVideoUrl.value,
      );
      if (_response.id == ResponseCode.SUCCESSFUL) {
        nameController.clear();
        phoneNumberController.clear();
        emailController.clear();
        gender("");
        currentInstituteController.clear();
        subjectNameController.clear();
        heigestQualificationController.clear();
        selectedDivision = null;
        presentAddress.clear();
        permanentAddress.clear();
        aboutYourself.clear();
        profilePhotoUrl("");
        profileVideoUrl("");

        showSuccessToast("Personal information updated successfully");

        selectedProfileEditTab(1);

        getTeacherDashboard();
      } else {
        showErrorToast(_response.object.toString());
      }
    }
  }

  void postTeacherEducationalInformationUpdate({bool? isNext}) async {
    if (isNext ?? false) {
      selectedProfileEditTab(2);
    } else {
      final _response =
          await FrontEndRepository().postTeacherEducationalInformationUpdate(
        sscYear.text,
        sscInstitute.text,
        sscGroup.text,
        sscGpa.text,
        hscYear.text,
        hscInstitute.text,
        hscGroup.text,
        hscGpa.text,
        graduationYear.text,
        graduationInstitute.text,
        graduationDepartment.text,
        graduationCgpa.text,
        selectedUniveristy?.id.toString() ?? "0",
        sscCertificate.value,
        hscCertificate.value,
        graduationCertificate.value,
      );
      if (_response.id == ResponseCode.SUCCESSFUL) {
        sscYear.clear();
        sscInstitute.clear();
        sscGroup.clear();
        sscGpa.clear();
        hscYear.clear();
        hscInstitute.clear();
        hscGroup.clear();
        hscGpa.clear();
        graduationYear.clear();
        graduationInstitute.clear();
        graduationDepartment.clear();
        graduationCgpa.clear();
        selectedUniveristy = null;
        sscCertificate("");
        hscCertificate("");
        graduationCertificate("");

        showSuccessToast("Educational information updated successfully");

        selectedProfileEditTab(2);

        getTeacherDashboard();
      } else {
        showErrorToast(_response.object.toString());
      }
    }
  }

  void postTeacherTutionInformationUpdate({bool? isNext}) async {
    if (isNext ?? false) {
      selectedProfileEditTab(3);
    } else {
      final _response =
          await FrontEndRepository().postTeacherTutionInformationUpdate(
        selectedDivision?.id.toString() ?? "",
        selectedSalaries?.id.toString() ?? "",
        selectedMedium?.id.toString() ?? "",
      );
      if (_response.id == ResponseCode.SUCCESSFUL) {
        selectedDivision = null;
        selectedSalaries = null;
        selectedMedium = null;

        showSuccessToast("Tution information updated successfully");

        selectedProfileEditTab(3);

        getTeacherDashboard();
      } else {
        showErrorToast(_response.object.toString());
      }
    }
  }

  void postTeacherVerifyUpdate() async {
    final _response = await FrontEndRepository().postTeacherVerifyUpdate(
      nidFrontFile.value,
      nidBackFile.value,
      studentIdFrontFile.value,
      studentIdBackFile.value,
    );
    if (_response.id == ResponseCode.SUCCESSFUL) {
      nidFrontFile("");
      nidBackFile("");
      studentIdFrontFile("");
      studentIdBackFile("");

      showSuccessToast("Verification information updated successfully");

      tabController.animateTo(1);

      Get.back();

      getTeacherDashboard();
    } else {
      showErrorToast(_response.object.toString());
    }
  }
}
