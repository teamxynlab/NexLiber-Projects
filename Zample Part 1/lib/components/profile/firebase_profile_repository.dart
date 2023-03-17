import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zample/components/profile/profile.dart';

class FirebaseProfileRepository {
  final CollectionReference _profileCollection =
      FirebaseFirestore.instance.collection("profile");

  Future<void> create({required Profile profile}) {
    return _profileCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(profile.toJson());
  }

  Future<void> delete() async {
    return _profileCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .delete();
  }

  Future<Profile> get() async {
    final DocumentSnapshot document = await _profileCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return Profile.fromJson(document.data() as Map<String, dynamic>);
  }

  Future<bool> exists() async {
    final DocumentSnapshot document = await _profileCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return document.exists;
  }

  Future<void> update({required Profile profile}) async {
    return _profileCollection
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(profile.toJson());
  }

  Stream<Profile> get profileStream => _profileCollection
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots()
      .map((snapshot) =>
          Profile.fromJson(snapshot.data() as Map<String, dynamic>));
}
