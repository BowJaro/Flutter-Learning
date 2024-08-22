import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/services/db_firestore_api.dart';

class DbFirestoreService implements DbApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionJournals = 'journals';

  @override
  Stream<List<Journal>> getJournalList(String uid) {
    return _firestore
        .collection(_collectionJournals)
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      final journals =
          snapshot.docs.map((doc) => Journal.fromDoc(doc)).toList();
      journals.sort((a, b) => b.date.compareTo(a.date));
      return journals;
    });
  }

  @override
  Future<bool> addJournal(Journal journal) async {
    try {
      await _firestore.collection(_collectionJournals).add(journal.toMap());
      return true;
    } catch (error) {
      print('Error adding journal: $error');
      return false;
    }
  }

  @override
  Future<void> deleteJournal(Journal journal) async {
    try {
      await _firestore.collection(_collectionJournals).doc(journal.id).delete();
    } catch (error) {
      print('Error deleting journal: $error');
    }
  }
}
