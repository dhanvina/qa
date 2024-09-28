class UserModel {
  final String userId;
  final String role;

  UserModel({required this.userId, required this.role});

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      userId: data['userId'],
      role: data['role'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'role': role,
    };
  }
}
