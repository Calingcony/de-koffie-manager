import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:de_koffie_manager/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snap
  List<Brew> _brewListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data()['name'] ?? '',
        sugars: doc.data()['sugars'] ?? '0',
        strength: doc.data()['strength'] ?? 0,
      );
    }).toList();
  }

  // get brew stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapShot);
  }
}
