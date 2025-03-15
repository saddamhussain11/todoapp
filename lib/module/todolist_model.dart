import 'package:cloud_firestore/cloud_firestore.dart';

class TodolistModel {
  String docid;
  String title;
  String description;
  String userid;
  String Time;

  TodolistModel({
    required this.docid,
    required this.userid,
    required this.title,
    required this.description,
    required this.Time,
  });

  // Update the factory constructor to accept a DocumentSnapshot instead of QuerySnapshot
  factory TodolistModel.fromFirestore(Map<String, dynamic> data) {
    return TodolistModel(
      docid: data['docid'] ?? '', // Use doc.id for the document ID
      userid: data['userid'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      Time: data['Time'] ?? '',
    );
  }

  Map<String, dynamic> tofirestore() {
    return {
      'docid': docid,
      'userid': userid,
      'title': title,
      'description': description,
      'Time': Time,
    };
  }
}
