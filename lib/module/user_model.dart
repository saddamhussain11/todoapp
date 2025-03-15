import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userid;
  String name;
  String email;
  String image;

  UserModel({
    required this.userid,
    required this.name,
    required this.email,
    required this.image,
  });

  // Convert Firestore Document to UserModel
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      userid: data['userid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      image: data['image'] ?? '',
    );
  }

  // Convert UserModel to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'userid': userid,
      'name': name,
      'email': email,
      'image': image,
    };
  }
}
