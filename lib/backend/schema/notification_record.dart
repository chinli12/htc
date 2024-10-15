import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "type" field.
  Notifytype? _type;
  Notifytype? get type => _type;
  bool hasType() => _type != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  void _initializeFields() {
    _driver = snapshotData['driver'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _text = snapshotData['text'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _type = deserializeEnum<Notifytype>(snapshotData['type']);
    _seen = snapshotData['seen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DocumentReference? driver,
  DocumentReference? user,
  String? text,
  DateTime? time,
  Notifytype? type,
  bool? seen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver': driver,
      'user': user,
      'text': text,
      'time': time,
      'type': type,
      'seen': seen,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.driver == e2?.driver &&
        e1?.user == e2?.user &&
        e1?.text == e2?.text &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.seen == e2?.seen;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality()
      .hash([e?.driver, e?.user, e?.text, e?.time, e?.type, e?.seen]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
