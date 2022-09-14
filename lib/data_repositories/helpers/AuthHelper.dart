import 'package:ffirebase/AppRoute.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/HomeScreans.dart';
import 'package:ffirebase/uiAdmenApp1/Screansapp/ScreanAuth/welcomeL_s.dart';
import 'package:ffirebase/uiAdmenApp1/modelsAdmenApp/CustomDilog.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> SignIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential; // المعلومات الي بترجع اشي خاص معين زي الامن
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDilog.showDilogFunction('No user found for that email.');
        //ايميل مش موجود
      } else if (e.code == 'wrong-password') {
        CustomDilog.showDilogFunction('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> SignUp(String email, String password) async {
    // بالاول ظهر عندي خطا وما وداني ع الصفحة الثانية لاني مش عاملة قيمة مرجعة
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        //تنشي ايميل وكلمة سر
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //كلمة سر ضعيفة
        CustomDilog.showDilogFunction('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        //ايميل موجود مسبقا
        CustomDilog.showDilogFunction(
            'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  CheckUser() async {
    //دالة بتحقق اذا في يوزر متاح //اذا فات ع التطبيق ع الهوم اذا لا ع اللوقن
    User? user = firebaseAuth.currentUser; //بجيب المستخدم  ا لحالي
    if (user == null) {
      AppRouter.NavigatorreplasmentwithtoWidget(welcomeL_s());

      // AppRouter.NavigatorreplasmentwithtoWidget(LoginScrean());

    } else {
      // AppRouter.NavigatorreplasmentwithtoWidget());
      AppRouter.NavigatorreplasmentwithtoWidget(Home());
    }
  }

  Signout() async {
    await firebaseAuth.signOut();
    AppRouter.NavigatorreplasmentwithtoWidget(welcomeL_s());

    //AppRouter.NavigatorreplasmentwithtoWidget(LoginScrean());
  }

  forgetPassword(String email) {
    try {
      firebaseAuth.sendPasswordResetEmail(email: email);
      CustomDilog.showDilogFunction(
          "the operation was completed successfully , please follow your email ,");
    } on Exception catch (e) {}
  }
}
