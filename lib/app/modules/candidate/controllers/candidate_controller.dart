import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ostadjee/app/common/constants.dart';
import 'package:ostadjee/app/common/pojo_model/candidate_login_model.dart';
import 'package:ostadjee/app/common/util/exports.dart';
import 'package:ostadjee/app/repository/frontend_repository.dart';
import 'package:ostadjee/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController tokenController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? name, phone, email, token, password, confirmPassword;

  var agreeTerms = false.obs;

  var passwordObsecure = true.obs;
  var confirmPasswordObsecure = true.obs;

  List<String> candidateType = ['Student', 'Gurdian'];

  void onObsecureClick() {
    passwordObsecure.value = !passwordObsecure.value;
  }

  void onConfirmObsecureClick() {
    confirmPasswordObsecure.value = !confirmPasswordObsecure.value;
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(scopes: [
      // 'email',
      // "https://www.googleapis.com/auth/userinfo.profile",
      // "https://www.googleapis.com/auth/user.phonenumbers.read",

      // 'email',
      // 'phone'
      // 'https://www.googleapis.com/auth/contacts.readonly',
    ]).signIn();

    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await auth.signInWithCredential(credential);

    name = auth.currentUser?.displayName ?? "";
    phone = auth.currentUser?.phoneNumber ?? "01234567890";
    email = auth.currentUser?.email ?? "";
    password = auth.currentUser?.uid ?? "";

    if (phone!.contains("+88")) {
      phone!.replaceAll('+88', '');
    }

    onLoginClick(true);
  }

  void onLoginClick(bool isSocialLogin) async {
    CandidateLoginModel loginModel;

    final _response =
        await FrontEndRepository().postCandidateLogin(phone!, password!);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      loginModel = CandidateLoginModel.fromJson(
          json.decode(_response.object.toString()));

      Storage.saveValue(Constants.token, loginModel.token);
      Storage.saveValue(Constants.userType, "1");
      Get.offAllNamed(Routes.HOME);
    } else {
      if (isSocialLogin) {
        onRegisterClick(true);
      } else {
        showErrorToast(_response.object.toString());
      }
    }
  }

  onResendOTPClick() {}

  // changed

  onResendOTPClickCandidate() async {
    final _response = await FrontEndRepository().postTutorOTPResend(
      phoneController.text,
    );
    if (_response.id == ResponseCode.SUCCESSFUL) {
      showSuccessToast("OTP Resend");
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void onTermsChange(bool? value) {
    agreeTerms(value ?? false);
  }

  void launchTermsOfUsePage() async {
    String _url = Constants.termsAndConditionUrl;
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void launchPrivacyPolicyPage() async {
    String _url = Constants.privacyPolicyUrl;
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void onRegisterClick(bool isSocialLogin) async {
    if (agreeTerms.value) {
      final _response = await FrontEndRepository()
          .postCandidateRegister(name!, email!, phone!, password!);
      if (_response.id == ResponseCode.SUCCESSFUL) {
        if (isSocialLogin) {
          onLoginClick(true);
        } else {
          // showSuccessToast("Registration successfully");

          Get.offAndToNamed(Routes.CANDIDATE_VERIFY);
        }
      } else {
        showErrorToast(_response.object.toString());
      }
    } else {
      showErrorToast(Strings.agreeTermsAndConditionWarning);
    }
  }

  void onVerifyClick() async {
    final _response = await FrontEndRepository().postCandidateVerification(
        phoneController.text, passwordController.text, tokenController.text);
    if (_response.id == ResponseCode.SUCCESSFUL) {
      showSuccessToast("Verification successfully");

      Get.offAndToNamed(Routes.CANDIDATE_LOGIN);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void onForgetPasswordClick() async {
    final _response =
        await FrontEndRepository().postCandidateForgetPassword(phone!);

    if (_response.id == ResponseCode.SUCCESSFUL) {
      Get.toNamed(Routes.CANDIDATE_FORGET_PASSWORD_VERIFY);
    } else {
      showErrorToast(_response.object.toString());
    }
  }

  void onForgetPasswordVerifyClick() async {
    final _response = await FrontEndRepository()
        .postCandidateForgetPasswordVerify(token!, password!, confirmPassword!);

    if (_response.id == ResponseCode.SUCCESSFUL) {
      tokenController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      Get.offAllNamed(Routes.CANDIDATE_LOGIN);
    } else {
      showErrorToast(_response.object.toString());
    }
  }
}
