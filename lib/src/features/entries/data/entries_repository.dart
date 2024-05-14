import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_firebase_chat/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:riverpod_firebase_chat/src/features/authentication/domain/app_user.dart';
import 'package:riverpod_firebase_chat/src/features/entries/domain/entry.dart';
import 'package:riverpod_firebase_chat/src/features/jobs/domain/job.dart';

part 'entries_repository.g.dart';

class EntriesRepository {
  const EntriesRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String entryPath(String uid, String entryId) =>
      'users/$uid/entries/$entryId';
  static String entriesPath(String uid) => 'users/$uid/entries';

  // create
  Future<void> addEntry({
    required UserID uid,
    required JobID jobId,
    required DateTime start,
    required DateTime end,
    required String comment,
  }) =>
      _firestore.collection(entriesPath(uid)).add({
        'jobId': jobId,
        'start': start.millisecondsSinceEpoch,
        'end': end.millisecondsSinceEpoch,
        'comment': comment,
      });

  // update
  Future<void> updateEntry({
    required UserID uid,
    required Entry entry,
  }) =>
      _firestore.doc(entryPath(uid, entry.id)).update(entry.toMap());

  // delete
  Future<void> deleteEntry({required UserID uid, required EntryID entryId}) =>
      _firestore.doc(entryPath(uid, entryId)).delete();

  // read
  Stream<List<Entry>> watchEntries({required UserID uid, JobID? jobId}) =>
      queryEntries(uid: uid, jobId: jobId)
          .orderBy("sentAtMillis")
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<Entry> queryEntries({required UserID uid, JobID? jobId}) {
    Query<Entry> query = _firestore
        .collection(entriesPath(uid))
        .orderBy("sentAtMillis")
        .withConverter<Entry>(
          fromFirestore: (snapshot, _) =>
              Entry.fromMap(snapshot.data()!, snapshot.id),
          toFirestore: (entry, _) => entry.toMap(),
        );
    if (jobId != null) {
      query = query.where('jobId', isEqualTo: jobId);
    }
    return query;
  }
}

// final entriesRepositoryProvider = Provider<EntriesRepository>((ref) {
//   return EntriesRepository(FirebaseFirestore.instance);
// });
//
@Riverpod(keepAlive: true)
EntriesRepository entriesRepository(EntriesRepositoryRef ref) {
  return EntriesRepository(FirebaseFirestore.instance);
}

@riverpod
Query<Entry> entriesQuery(EntriesQueryRef ref, JobID jobId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null when fetching jobs');
  }
  final repository = ref.watch(entriesRepositoryProvider);
  return repository.queryEntries(uid: user.uid, jobId: jobId);
}

// final jobEntriesQueryProvider =
//     Provider.autoDispose.family<Query<Entry>, JobID>((ref, jobId) {
//   final user = ref.watch(firebaseAuthProvider).currentUser;
//   if (user == null) {
//     throw AssertionError('User can\'t be null when fetching jobs');
//   }
//   final repository = ref.watch(entriesRepositoryProvider);
//   return repository.queryEntries(uid: user.uid, jobId: jobId);
// });

// final entriesRepositoryProvider = Provider<EntriesRepository>((ref) {
//   return EntriesRepository(FirebaseFirestore.instance);
// });

// final jobEntriesQueryProvider =
//     Provider.autoDispose.family<Query<Entry>, JobID>((ref, jobId) {
//   final user = ref.watch(firebaseAuthProvider).currentUser;
//   if (user == null) {
//     throw AssertionError('User can\'t be null when fetching jobs');
//   }
//   final repository = ref.watch(entriesRepositoryProvider);
//   return repository.queryEntries(uid: user.uid, jobId: jobId);
// });
