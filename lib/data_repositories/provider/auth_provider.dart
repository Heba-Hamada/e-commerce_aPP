import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/data_repositories/helpers/AuthHelper.dart';
import 'package:ffirebase/data_repositories/helpers/firestore_helper.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/HomeScreans.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/User/appUserScrean.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class Authprovider extends ChangeNotifier {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController Passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  GlobalKey<FormState> loginkey = GlobalKey();

  GlobalKey<FormState> SignUpkey = GlobalKey();
  //TextEditingController emailcontroller = TextEditingController();
  //TextEditingController passwordcontroller = TextEditingController();
  //TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  nullValidation(String? v) {
    if (v == null || v.isEmpty) {
      return " هذا الحقل مطلوب";
    }
  }

  emailValidaion(String value) {
    if (!isEmail(value)) {
      return "صيغة ايميل خاطئة ";
    }
  }

  validname(String value) {
    if (value == null) {
      return " الاسم لا يجب ان يكون فارغا ";
    }
  }

  passwordValidaion(String value) {
    if (value.length < 6) {
      return "يجب ان تكون كلمة المرور اكثر من 6 احرف ";
    }
  }

  SignIn() async {
    if (loginkey.currentState!.validate()) {
      UserCredential? credentials = await AuthHelper.authHelper
          .SignIn(emailcontroller.text, Passwordcontroller.text);
      if (credentials != null) {
        AppRouter.NavigatorreplasmentwithtoWidget(Home());
      }
    }
  }

  register() async {
    UserCredential? userCredential = await AuthHelper.authHelper
        .SignUp(emailcontroller.text, Passwordcontroller.text);
    AppUser appUser = AppUser(
      name: namecontroller.text,
      email: emailcontroller.text,
      city: citycontroller.text,
      phone: phonecontroller.text,
      id: userCredential!.user!.uid,
    );
    FirestoreHelper.firestoreHelper.addUserToFireStore(appUser);
  }

  CheckUser() {
    AuthHelper.authHelper.CheckUser();
  }

  SignOut() {
    AuthHelper.authHelper.Signout();
  }

  forgetPassword() {
    AuthHelper.authHelper.forgetPassword("hhamada13@smail.ucas.edu.ps");
  }
}
