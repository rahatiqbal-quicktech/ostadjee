// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = _Paths.SPLASH;
  static const LANDING = _Paths.LANDING;
  static const LANDING_OVERVIEW = _Paths.LANDING_OVERVIEW;
  static const LANDING_SIGNIN = _Paths.LANDING_SIGNIN;
  static const HOME = _Paths.HOME;
  static const SEARCH = _Paths.SEARCH;
  static const SEARCH_RESULT = _Paths.SEARCH_RESULT;
  static const TUTOR_PROFILE_PUBLIC_VIEW = _Paths.TUTOR_PROFILE_PUBLIC_VIEW;
  static const PREMIUM_TUTOR_VIEW = _Paths.PREMIUM_TUTOR_VIEW;
  static const TUTOR_LOGIN = _Paths.TUTOR_LOGIN;
  static const TUTOR_REGISTRATION = _Paths.TUTOR_REGISTRATION;
  static const TUTOR_VERIFY = _Paths.TUTOR_VERIFY;
  static const TUTOR_FORGET_PASSWORD = _Paths.TUTOR_FORGET_PASSWORD;
  static const TUTOR_FORGET_PASSWORD_VERIFY =
      _Paths.TUTOR_FORGET_PASSWORD_VERIFY;
  static const CANDIDATE_LOGIN = _Paths.CANDIDATE_LOGIN;
  static const CANDIDATE_REGISTRATION = _Paths.CANDIDATE_REGISTRATION;
  static const CANDIDATE_VERIFY = _Paths.CANDIDATE_VERIFY;
  static const CANDIDATE_FORGET_PASSWORD = _Paths.CANDIDATE_FORGET_PASSWORD;
  static const CANDIDATE_FORGET_PASSWORD_VERIFY =
      _Paths.CANDIDATE_FORGET_PASSWORD_VERIFY;
  static const HOW_IT_WORKS = _Paths.HOW_IT_WORKS;
  static const TUTION_JOBS_VIEW = _Paths.TUTION_JOBS_VIEW;
  static const PROFILE_VIEW = _Paths.PROFILE_VIEW;
  static const CANDIDATE_PROFILE_EDIT_VIEW = _Paths.CANDIDATE_PROFILE_EDIT_VIEW;
  static const JOB_APPLY_DETAILS = _Paths.JOB_APPLY_DETAILS;
  static const JOB_MATCH_DETAILS = _Paths.JOB_MATCH_DETAILS;
  static const MATCH_VIEW = _Paths.MATCH_VIEW;
  static const BAG_VIEW = _Paths.BAG_VIEW;
  static const POST_JOB_VIEW = _Paths.POST_JOB_VIEW;
  static const CANDIDATE_PAYMENT_HISTORY_VIEW =
      _Paths.CANDIDATE_PAYMENT_HISTORY_VIEW;
  static const TUTOR_PROFILE_EDIT_VIEW = _Paths.TUTOR_PROFILE_EDIT_VIEW;
  static const TUTOR_PAYMENT_WITHDRAW_VIEW = _Paths.TUTOR_PAYMENT_WITHDRAW_VIEW;
  static const MAKE_ME_PREMIUM = _Paths.MAKE_ME_PREMIUM;
}

abstract class _Paths {
  static const SPLASH = '/';
  static const LANDING = '/landing';
  static const LANDING_OVERVIEW = '/landing_overview';
  static const LANDING_SIGNIN = '/landing_signin';
  static const HOME = '/home';
  static const SEARCH = '/search';
  static const SEARCH_RESULT = '/search_result';
  static const TUTOR_PROFILE_PUBLIC_VIEW = '/tutor_profile_public_view';
  static const PREMIUM_TUTOR_VIEW = '/premium_tutor__view';
  static const TUTOR_LOGIN = '/tutor_login';
  static const TUTOR_REGISTRATION = '/tutor_registration';
  static const TUTOR_VERIFY = '/tutor_verify';
  static const TUTOR_FORGET_PASSWORD = '/tutor_forget_password';
  static const TUTOR_FORGET_PASSWORD_VERIFY = '/tutor_forget_verify';
  static const CANDIDATE_LOGIN = '/candidate_login';
  static const CANDIDATE_REGISTRATION = '/candidate_registration';
  static const CANDIDATE_VERIFY = '/candidate_verify';
  static const CANDIDATE_FORGET_PASSWORD = '/candidate_forget_password';
  static const CANDIDATE_FORGET_PASSWORD_VERIFY = '/candidate_forget_verify';
  static const HOW_IT_WORKS = '/how_it_works';
  static const TUTION_JOBS_VIEW = '/tution_jobs';
  static const PROFILE_VIEW = '/profile_view';
  static const CANDIDATE_PROFILE_EDIT_VIEW = '/candidate_profile_edit_view';
  static const JOB_APPLY_DETAILS = '/job_apply_details';
  static const JOB_MATCH_DETAILS = '/job_match_details';
  static const MATCH_VIEW = '/match_view';
  static const BAG_VIEW = '/bag_view';
  static const POST_JOB_VIEW = '/post_job_view';
  static const CANDIDATE_PAYMENT_HISTORY_VIEW =
      '/candidate_payment_history_view';
  static const TUTOR_PROFILE_EDIT_VIEW = '/tutor_payment_history_view';
  static const TUTOR_PAYMENT_WITHDRAW_VIEW = '/tutor_payment_withdraw_view';
  static const MAKE_ME_PREMIUM = '/make_me_premium';
}
