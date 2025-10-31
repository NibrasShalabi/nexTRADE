import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final String? referredBy;
  final String role;
  final double balance;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.referredBy,
    this.role = 'user',
    this.balance = 0.0,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'referredBy': referredBy,
      'role': role,
      'balance': balance,
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      referredBy: data['referredBy'],
      role: data['role'],
      balance: (data['balance'] ?? 0).toDouble(),
    );
  }
}
