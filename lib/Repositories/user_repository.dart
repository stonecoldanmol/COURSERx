import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  FirebaseUser _user;
  Status _status = Status.Uninitialized;

  Status get status => _status;
  FirebaseUser get firebaseuser => _user;

  //Returns a stream of firebase user authentication state to provider
  UserRepository.instance()
      : _googleSignIn = GoogleSignIn(),
        _firebaseAuth = FirebaseAuth.instance {
    _firebaseAuth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  //Constructor Never used
  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  //Sign in with google
  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUer = await _googleSignIn.signIn();
      _status = Status.Authenticating;
      notifyListeners();

      final GoogleSignInAuthentication googleAuth =
          await googleUer.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await _firebaseAuth.signInWithCredential(credential);
      _user = await _firebaseAuth.currentUser();
      _status = Status.Authenticated;
      notifyListeners();
      print('signed in');
      return true;
    } catch (error) {
      print(error);
      print('error in signing in');
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Sign in with credentials emails and password
  Future<bool> signInWithCredentials(
      {@required String email, @required String password}) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Sign up with email and password
  Future<bool> signUp(
      {@required String email, @required String password}) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      AuthResult authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = authResult.user;
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  //Signs out and sets state to Unauthenticated
  Future<void> signOut() async {
    await Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  //Returns if the user is signed in
  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  //Returns current user
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }

  //Whenever firebase auth state changes, it sets the user auth state
  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }
}
