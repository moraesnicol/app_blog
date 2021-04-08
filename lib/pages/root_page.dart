import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'splash_screen.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  LoggedIn,
  NotLoggedIn,
  NotDetermined,
}

class _RootPageState extends State<RootPage> {
  AuthStatus _authStatus = AuthStatus.NotDetermined;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future _checkAuthStatus() async {
    User currentUser = auth.currentUser;
    if (currentUser == null) {
      setState(() {
        _authStatus = AuthStatus.NotLoggedIn;
      });
      _registerUser();
    } else {
      _authStatus = AuthStatus.LoggedIn;
    }
  }

  Future _registerUser() async {
    auth.signInAnonymously().then((value) {
      if (value != null) {
        setState(() {
          _authStatus = AuthStatus.LoggedIn;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    switch (_authStatus) {
      case AuthStatus.LoggedIn:
        return HomePage();
        break;
      case AuthStatus.NotLoggedIn:
        return SplashScreen();
      case AuthStatus.NotDetermined:
        return SplashScreen();
        break;
      default:
        return SplashScreen();
    }
  }
}
