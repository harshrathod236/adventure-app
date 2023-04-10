import 'package:adventure_ui_demo/core/Firebase/const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference collectionReference({required String collectionName}) {
  CollectionReference collectionReference =
      firestore.collection(collectionName);
  return collectionReference;
}
