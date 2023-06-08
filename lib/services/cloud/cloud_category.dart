import 'package:baby_buy/services/cloud/cloud_storage_constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@immutable
class CloudCategory {
  final String documentId;
  final String ownerUserId;
  final String title;
  final String description;
  const CloudCategory({
    required this.documentId,
    required this.ownerUserId,
    required this.title,
    required this.description,
  });

  CloudCategory.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        ownerUserId = snapshot.data()[ownerUserIdFieldName],
        title = snapshot.data()[titleTextFieldName] as String,
        description = snapshot.data()[descriptionTextFieldName] as String;
}
