import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;


  static const String demoSmsCode = '111123';

  User? get currentUser => _auth.currentUser;

  Map<String, dynamic> driverProfile = <String, dynamic>{};

  Future<void> saveDriverProfile(Map<String, dynamic> profile) async {
    driverProfile = profile;
    final String? uid = _auth.currentUser?.uid;
    if (uid == null) {
      return;
    }
    await _db
        .collection('drivers')
        .doc(uid)
        .set(profile, SetOptions(merge: true));
  }

  Future<Map<String, dynamic>> fetchDriverProfile() async {
    final String? uid = _auth.currentUser?.uid;
    if (uid == null) {
      return <String, dynamic>{};
    }
    final DocumentSnapshot<Map<String, dynamic>> snap =
        await _db.collection('drivers').doc(uid).get();
    driverProfile = snap.data() ?? <String, dynamic>{};
    return driverProfile;
  }

  Future<bool> signInEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }


  Future<bool> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }


  Future<String?> registerEmail(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return 'That email is already registered.';
        case 'weak-password':
          return 'Password must be at least 6 characters.';
        case 'invalid-email':
          return 'That email address is not valid.';
        default:
          return 'Could not create account. Please try again.';
      }
    }
  }

  Future<void> signOut() => _auth.signOut();

  Future<bool> sendOtp(String phoneNumber) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return phoneNumber.startsWith('+'); // +97680661615
  }


  Future<bool> verifyOtp(String smsCode) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return smsCode.trim() == demoSmsCode;
  }
}
