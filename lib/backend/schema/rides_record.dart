import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RidesRecord extends FirestoreRecord {
  RidesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "startingPoint" field.
  LatLng? _startingPoint;
  LatLng? get startingPoint => _startingPoint;
  bool hasStartingPoint() => _startingPoint != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  bool hasSeats() => _seats != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  void _initializeFields() {
    _startingPoint = snapshotData['startingPoint'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _seats = castToType<int>(snapshotData['seats']);
    _driver = snapshotData['driver'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rides');

  static Stream<RidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RidesRecord.fromSnapshot(s));

  static Future<RidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RidesRecord.fromSnapshot(s));

  static RidesRecord fromSnapshot(DocumentSnapshot snapshot) => RidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RidesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRidesRecordData({
  LatLng? startingPoint,
  LatLng? destination,
  int? seats,
  DocumentReference? driver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startingPoint': startingPoint,
      'destination': destination,
      'seats': seats,
      'driver': driver,
    }.withoutNulls,
  );

  return firestoreData;
}

class RidesRecordDocumentEquality implements Equality<RidesRecord> {
  const RidesRecordDocumentEquality();

  @override
  bool equals(RidesRecord? e1, RidesRecord? e2) {
    return e1?.startingPoint == e2?.startingPoint &&
        e1?.destination == e2?.destination &&
        e1?.seats == e2?.seats &&
        e1?.driver == e2?.driver;
  }

  @override
  int hash(RidesRecord? e) => const ListEquality()
      .hash([e?.startingPoint, e?.destination, e?.seats, e?.driver]);

  @override
  bool isValidKey(Object? o) => o is RidesRecord;
}
