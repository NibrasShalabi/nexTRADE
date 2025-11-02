import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🔹 توليد كود إحالة فريد لكل مستخدم
  String _generateReferralCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final code = List.generate(6, (i) {
      final index = (timestamp.hashCode + i * 13) % chars.length;
      return chars[index];
    }).join();
    return 'NXT$code';
  }

  /// 🔹 التحقق من صحة كود الإحالة (هل موجود فعلاً؟)
  Future<bool> _isReferralCodeValid(String code) async {
    final snapshot = await _firestore
        .collection('users')
        .where('referralCode', isEqualTo: code)
        .limit(1)
        .get();

    return snapshot.docs.isNotEmpty;
  }

  /// 🔹 تسجيل مستخدم جديد مع كود الإحالة والتحقق منه
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
    String? referralCode,
  }) async {
    // ✅ تحقق من كود الإحالة إن وُجد
    if (referralCode != null && referralCode.isNotEmpty) {
      final isValid = await _isReferralCodeValid(referralCode);
      if (!isValid) {
        throw Exception("❌ كود الإحالة غير صحيح أو لا يخص أي مستخدم.");
      }
    }

    // ✅ إنشاء المستخدم الجديد
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user!;
    final generatedCode = _generateReferralCode();

    // ✅ حفظ البيانات داخل Firestore
    await _firestore.collection('users').doc(user.uid).set({
      'name': name,
      'email': email,
      'referralCode': generatedCode, // كود المستخدم الجديد
      'referredBy': referralCode, // كود الشخص الذي أحاله
      'createdAt': FieldValue.serverTimestamp(),
    });

    // ✅ إرسال إيميل التحقق (اختياري)
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }

    return user;
  }

  /// 🔹 تسجيل الدخول
  Future<User> login(String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!;
  }
}
