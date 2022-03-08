import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';
import 'package:tamyez/model/faq_model.dart';
import 'package:tamyez/repository/auth_repo.dart';
import 'package:tamyez/utils/TokenUtil.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final googleSignIn = GoogleSignIn(
      scopes: ['email', "https://www.googleapis.com/auth/userinfo.profile"]);
  List<FaqModel> faqs = [];
  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;

  static AuthProvider of(BuildContext context, {bool listen = false}) {
    if (listen) return context.watch<AuthProvider>();
    return context.read<AuthProvider>();
  }

  Future googleLogin(BuildContext context) async {
    isLoading = true;
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;
    final googleAuth = await googleUser.authentication;

    TokenUtil.saveToken(googleAuth.accessToken);
    notifyListeners();
  }

  Future facebookLogin(BuildContext context) async {
    isLoading = true;

    final LoginResult result = await FacebookAuth.instance.login(
      permissions: [
        'public_profile',
        'email',
      ],
    );

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData(
        fields: "name,email",
      );
      TokenUtil.saveToken(accessToken.token);
      notifyListeners();
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future<void> getFaq(BuildContext context) async {
    isLoading = true;
    await AuthRepository.getFaq(context).then((value) {
      faqs = value;
      isLoading = false;
      notifyListeners();
    });
  }
}
