import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

final String uid;
DatabaseService({required this.uid});
  //collection reference
  final CollectionReference busUserCollection = FirebaseFirestore.instance.collection('bus');

  Future updateUserData(String name, String id, String origin) async {
    return await busUserCollection.doc(uid).set({
      name: name,
      id: id,
      origin: origin });
  }
    }