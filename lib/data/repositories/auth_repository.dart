import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../firebase_options.dart';

class AuthRepository {
  FirebaseAuth get _firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  static bool _isInitialized = false;

  /// 🔹 تأكد أن Firebase مهيأة مرة واحدة فقط
  Future<void> _ensureFirebaseInitialized() async {
    if (!_isInitialized) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _isInitialized = true;
      print("🔥 Firebase initialized inside AuthRepository");
    }
  }

  /// تسجيل مستخدم جديد
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    await _ensureFirebaseInitialized();

    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;
    final generatedCode = _generateReferralCode();

    await _firestore.collection('users').doc(user.uid).set({
      'name': name,
      'email': email,
      'referralCode': generatedCode,
      'referredBy': referralCode,
      'createdAt': FieldValue.serverTimestamp(),
    });

    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }

    return user;
  }

  /// تسجيل الدخول
  Future<User> login(String email, String password) async {
    await _ensureFirebaseInitialized();

    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }

  // كود إحالة عشوائي
  String _generateReferralCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final now = DateTime.now().millisecondsSinceEpoch;
    return 'NXT${now.toString().substring(8)}';
  }
}
