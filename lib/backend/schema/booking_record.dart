import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingRecord extends FirestoreRecord {
  BookingRecord._(
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

  // "Source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "timeleft" field.
  String? _timeleft;
  String get timeleft => _timeleft ?? '';
  bool hasTimeleft() => _timeleft != null;

  // "distanceleft" field.
  String? _distanceleft;
  String get distanceleft => _distanceleft ?? '';
  bool hasDistanceleft() => _distanceleft != null;

  // "driversPositions" field.
  List<LatLng>? _driversPositions;
  List<LatLng> get driversPositions => _driversPositions ?? const [];
  bool hasDriversPositions() => _driversPositions != null;

  // "sourceAdress" field.
  SourceStruct? _sourceAdress;
  SourceStruct get sourceAdress => _sourceAdress ?? SourceStruct();
  bool hasSourceAdress() => _sourceAdress != null;

  // "destiAdress" field.
  DestinationStruct? _destiAdress;
  DestinationStruct get destiAdress => _destiAdress ?? DestinationStruct();
  bool hasDestiAdress() => _destiAdress != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "totaldestination" field.
  int? _totaldestination;
  int get totaldestination => _totaldestination ?? 0;
  bool hasTotaldestination() => _totaldestination != null;

  // "rating" field.
  bool? _rating;
  bool get rating => _rating ?? false;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _driver = snapshotData['driver'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _source = snapshotData['Source'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _timeleft = snapshotData['timeleft'] as String?;
    _distanceleft = snapshotData['distanceleft'] as String?;
    _driversPositions = getDataList(snapshotData['driversPositions']);
    _sourceAdress = SourceStruct.maybeFromMap(snapshotData['sourceAdress']);
    _destiAdress = DestinationStruct.maybeFromMap(snapshotData['destiAdress']);
    _status = deserializeEnum<Status>(snapshotData['status']);
    _time = snapshotData['time'] as DateTime?;
    _day = snapshotData['day'] as DateTime?;
    _totaldestination = castToType<int>(snapshotData['totaldestination']);
    _rating = snapshotData['rating'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('booking');

  static Stream<BookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingRecord.fromSnapshot(s));

  static Future<BookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingRecord.fromSnapshot(s));

  static BookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingRecordData({
  DocumentReference? driver,
  DocumentReference? user,
  LatLng? source,
  LatLng? destination,
  String? timeleft,
  String? distanceleft,
  SourceStruct? sourceAdress,
  DestinationStruct? destiAdress,
  Status? status,
  DateTime? time,
  DateTime? day,
  int? totaldestination,
  bool? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver': driver,
      'user': user,
      'Source': source,
      'destination': destination,
      'timeleft': timeleft,
      'distanceleft': distanceleft,
      'sourceAdress': SourceStruct().toMap(),
      'destiAdress': DestinationStruct().toMap(),
      'status': status,
      'time': time,
      'day': day,
      'totaldestination': totaldestination,
      'rating': rating,
    }.withoutNulls,
  );

  // Handle nested data for "sourceAdress" field.
  addSourceStructData(firestoreData, sourceAdress, 'sourceAdress');

  // Handle nested data for "destiAdress" field.
  addDestinationStructData(firestoreData, destiAdress, 'destiAdress');

  return firestoreData;
}

class BookingRecordDocumentEquality implements Equality<BookingRecord> {
  const BookingRecordDocumentEquality();

  @override
  bool equals(BookingRecord? e1, BookingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.driver == e2?.driver &&
        e1?.user == e2?.user &&
        e1?.source == e2?.source &&
        e1?.destination == e2?.destination &&
        e1?.timeleft == e2?.timeleft &&
        e1?.distanceleft == e2?.distanceleft &&
        listEquality.equals(e1?.driversPositions, e2?.driversPositions) &&
        e1?.sourceAdress == e2?.sourceAdress &&
        e1?.destiAdress == e2?.destiAdress &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time &&
        e1?.day == e2?.day &&
        e1?.totaldestination == e2?.totaldestination &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(BookingRecord? e) => const ListEquality().hash([
        e?.driver,
        e?.user,
        e?.source,
        e?.destination,
        e?.timeleft,
        e?.distanceleft,
        e?.driversPositions,
        e?.sourceAdress,
        e?.destiAdress,
        e?.status,
        e?.time,
        e?.day,
        e?.totaldestination,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingRecord;
}
