import 'package:baby_buy/services/cloud/cloud_category.dart';
import 'package:baby_buy/services/cloud/cloud_storage_constants.dart';
import 'package:baby_buy/services/cloud/cloud_storage_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCloudCategoryStorage {
  final category = FirebaseFirestore.instance.collection('category');

  // to delete category
  Future<void> deleteCategory({required String documentId}) async {
    try {
      await category.doc(documentId).delete();
    } catch (e) {
      throw CouldNotDeleteCategoryException();
    }
  }

  // to update existing category
  Future<void> updateCategory({
    required String documentId,
    required String title,
    required String description,
  }) async {
    try {
      await category.doc(documentId).update({
        titleTextFieldName: title,
        descriptionTextFieldName: description,
      });
    } catch (e) {
      throw CouldNotUpdateCategoryException();
    }
  }

  // creating a stream to expose the category to the user
  Stream<Iterable<CloudCategory>> allCategories(
          {required String ownerUserId}) =>
      category.snapshots().map(
            (event) => event.docs
                .map((doc) => CloudCategory.fromSnapshot(doc))
                .where((category) => category.ownerUserId == ownerUserId),
          );

  // to get categories
  Future<Iterable<CloudCategory>> getCategory(
      {required String ownerUserId}) async {
    try {
      return await category
          .where(
            ownerUserIdFieldName,
            isEqualTo: ownerUserId,
          )
          .get()
          .then(
            (value) => value.docs.map(
              (doc) => CloudCategory.fromSnapshot(doc),
            ),
          );
    } catch (e) {
      throw CouldNotGetAllCategoryException();
    }
  }

  // to create a new category
  Future<CloudCategory> createCategory({required String ownerUserId}) async {
    final document = await category.add({
      ownerUserIdFieldName: ownerUserId,
      titleTextFieldName: '',
      descriptionTextFieldName: '',
    });

    final fetchedCategory = await document.get();
    return CloudCategory(
      documentId: fetchedCategory.id,
      ownerUserId: ownerUserId,
      title: '',
      description: '',
    );
  }

  // singleton which doesn't allow the class to be instantiated more than once
  static final FirebaseCloudCategoryStorage _shared =
      FirebaseCloudCategoryStorage._sharedInstance();
  FirebaseCloudCategoryStorage._sharedInstance();
  factory FirebaseCloudCategoryStorage() => _shared;
}
