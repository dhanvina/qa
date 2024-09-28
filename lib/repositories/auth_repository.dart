import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthRepository {
  final FirebaseFirestore _firestore;

  AuthRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<UserModel?> authenticate(String userId, String password) async {
    try {
      QuerySnapshot result = await _firestore
          .collection('users')
          .where('userId', isEqualTo: userId)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      if (result.docs.isNotEmpty) {
        return UserModel.fromFirestore(result.docs.first.data() as Map<String, dynamic>);
      } else {
        return null; // User not found
      }
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }
}
