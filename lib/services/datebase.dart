import 'package:cloud_firestore/cloud_firestore.dart';

class DatebaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) => print(e));
  }

  getQuizezData() async {
    return await Firestore.instance.collection("Quiz").snapshots();
  }

  getSettingsData() async {
    return await Firestore.instance
        .collection('settings')
        .document('83JsQwDa8sdT1Mi5IjBH')
        .toString();
  }

  getQuizData(String quizId) async {
    return await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }

  Future getList() async {
    var firestore = Firestore.instance;

    DocumentReference docRef =
        firestore.collection('settings').document('83JsQwDa8sdT1Mi5IjBH');
    var data;
    docRef.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        data = datasnapshot.data['quizler'];
      }
    });
    return data;
  }
}
