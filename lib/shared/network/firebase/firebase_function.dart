import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/taskModel.dart';

class FirebaseFunction {
  static CollectionReference<TaskModel> getCollection() {
    return FirebaseFirestore.instance.collection('Tasks').withConverter(
          fromFirestore: (snapshot, options) =>
              TaskModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.tojson(),
        );
  }

  static Future<void> addTaskToFireStore(TaskModel taskModel) {
    var collection = getCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    return docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasksFromFireStore(DateTime date) {
    var collection = getCollection();
    return collection
        .where("startDate",
            isEqualTo: DateUtils.dateOnly(date).millisecondsSinceEpoch)
        .snapshots();
  }
}
