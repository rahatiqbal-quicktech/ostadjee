import 'package:get/get.dart';
import 'package:ostadjee/app/bindings/bindings.dart';
import 'package:ostadjee/app/bindings/leading_bindings.dart';
import 'package:ostadjee/app/modules/candidate/bindings/candidate_binding.dart';
import 'package:ostadjee/app/modules/candidate/views/candidate_account_verify.dart';
import 'package:ostadjee/app/modules/candidate/views/candidate_forget_password.dart';
import 'package:ostadjee/app/modules/candidate/views/candidate_forget_verify.dart';
import 'package:ostadjee/app/modules/candidate/views/candidate_login.dart';
import 'package:ostadjee/app/modules/candidate/views/candidate_registration.dart';
import 'package:ostadjee/app/modules/home/views/bag_view.dart';
import 'package:ostadjee/app/modules/home/views/home_view.dart';
import 'package:ostadjee/app/modules/home/views/match_view.dart';
import 'package:ostadjee/app/modules/how_it_works/bindings/how_it_works_binding.dart';
import 'package:ostadjee/app/modules/how_it_works/views/how_it_works_view.dart';
import 'package:ostadjee/app/modules/profile/views/post_job_view.dart';
import 'package:ostadjee/app/modules/profile/views/profile_edit_view.dart';
import 'package:ostadjee/app/modules/profile/views/profile_view.dart';
import 'package:ostadjee/app/modules/profile/views/candidate_payment_history_view.dart';
import 'package:ostadjee/app/modules/profile/views/tutor_payment_withdraw_view.dart';
import 'package:ostadjee/app/modules/profile/views/candidate_edit_profile.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_job_applies_widget.dart';
import 'package:ostadjee/app/modules/profile/widgets/candidate_job_matches_widget.dart';
import 'package:ostadjee/app/modules/search/views/search_result.dart';
import 'package:ostadjee/app/modules/search/views/search_view.dart';
import 'package:ostadjee/app/modules/splash/views/landing.dart';
import 'package:ostadjee/app/modules/splash/views/landing_overview.dart';
import 'package:ostadjee/app/modules/splash/views/landing_signin.dart';
import 'package:ostadjee/app/modules/splash/views/splash_view.dart';
import 'package:ostadjee/app/modules/tution/views/tution_jobs_view.dart';
import 'package:ostadjee/app/modules/tutor/bindings/tutor_binding.dart';
import 'package:ostadjee/app/modules/tutor/views/premium_tutor_view.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_account_verify.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_forget_password.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_forget_verify.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_login.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_make_premium.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_profile_public_view.dart';
import 'package:ostadjee/app/modules/tutor/views/tutor_registration.dart';

part 'app_routes.dart';

class AppPages {
  const AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => const Landing(),
      binding: LeadingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.TUTION_JOBS_VIEW,
      page: () => const TutionJobsView(),
      binding: LeadingBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.LANDING_SIGNIN,
      page: () => LandingSignin(),
      binding: LeadingBinding(),
    ),
    GetPage(
      name: _Paths.LANDING_OVERVIEW,
      page: () => const LandingOverview(),
      binding: LeadingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      binding: Binding(),
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      transition: Transition.upToDown,
    ),
    GetPage(
      name: _Paths.SEARCH_RESULT,
      page: () => SearchResult(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.TUTOR_PROFILE_PUBLIC_VIEW,
      page: () => TutorProfilePublicView(),
      binding: TutorBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.PREMIUM_TUTOR_VIEW,
      page: () => PremiumTutorView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.TUTOR_LOGIN,
      page: () => const TutorLogin(),
      binding: TutorBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.TUTOR_REGISTRATION,
      page: () => const TutorRegistration(),
      binding: TutorBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.TUTOR_VERIFY,
      page: () => TutorAccountVerify(),
      binding: TutorBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.TUTOR_FORGET_PASSWORD,
      page: () => TutorForgetPassword(),
      binding: TutorBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.TUTOR_FORGET_PASSWORD_VERIFY,
      page: () => TutorForgetVerify(),
      binding: TutorBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CANDIDATE_LOGIN,
      page: () => const CandidateLogin(),
      binding: CandidateBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: _Paths.CANDIDATE_REGISTRATION,
      page: () => const CandidateRegistration(),
      binding: CandidateBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.CANDIDATE_VERIFY,
      page: () => CandidateAccountVerify(),
      binding: CandidateBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.CANDIDATE_FORGET_PASSWORD,
      page: () => CandidateForgetPassword(),
      binding: CandidateBinding(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: _Paths.CANDIDATE_FORGET_PASSWORD_VERIFY,
      page: () => CandidateForgetVerify(),
      binding: CandidateBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.HOW_IT_WORKS,
      page: () => HowItWorksView(),
      binding: HowItWorksBinding(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.PROFILE_VIEW,
      page: () => ProfileView(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.CANDIDATE_PROFILE_EDIT_VIEW,
      page: () => CandidateEditProfile(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.JOB_APPLY_DETAILS,
      page: () => CandidateJobApplyListWidget(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.JOB_MATCH_DETAILS,
      page: () => CandidateJobMatchListWidget(),
      transition: Transition.fade,
    ),
    GetPage(
      name: _Paths.MATCH_VIEW,
      page: () => MatchView(),
    ),
    GetPage(
      name: _Paths.BAG_VIEW,
      page: () => BagView(),
    ),
    GetPage(
      name: _Paths.POST_JOB_VIEW,
      page: () => PostJobView(),
    ),
    GetPage(
      name: _Paths.CANDIDATE_PAYMENT_HISTORY_VIEW,
      page: () => CandidatePaymentHistoryView(),
    ),
    GetPage(
      name: _Paths.TUTOR_PROFILE_EDIT_VIEW,
      page: () => ProfileEditView(),
    ),
    GetPage(
      name: _Paths.TUTOR_PAYMENT_WITHDRAW_VIEW,
      page: () => TutorPaymentWithdrawView(),
    ),
    GetPage(
      name: _Paths.MAKE_ME_PREMIUM,
      page: () => TutorMakePremium(),
    ),
  ];
}
