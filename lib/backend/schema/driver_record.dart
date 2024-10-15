import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverRecord extends FirestoreRecord {
  DriverRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "infor" field.
  DocumentReference? _infor;
  DocumentReference? get infor => _infor;
  bool hasInfor() => _infor != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "carplatenumber" field.
  String? _carplatenumber;
  String get carplatenumber => _carplatenumber ?? '';
  bool hasCarplatenumber() => _carplatenumber != null;

  // "carmodel" field.
  String? _carmodel;
  String get carmodel => _carmodel ?? '';
  bool hasCarmodel() => _carmodel != null;

  // "carColor" field.
  String? _carColor;
  String get carColor => _carColor ?? '';
  bool hasCarColor() => _carColor != null;

  // "mon" field.
  String? _mon;
  String get mon => _mon ?? '';
  bool hasMon() => _mon != null;

  // "tues" field.
  String? _tues;
  String get tues => _tues ?? '';
  bool hasTues() => _tues != null;

  // "wed" field.
  String? _wed;
  String get wed => _wed ?? '';
  bool hasWed() => _wed != null;

  // "thur" field.
  String? _thur;
  String get thur => _thur ?? '';
  bool hasThur() => _thur != null;

  // "fri" field.
  String? _fri;
  String get fri => _fri ?? '';
  bool hasFri() => _fri != null;

  // "sat" field.
  String? _sat;
  String get sat => _sat ?? '';
  bool hasSat() => _sat != null;

  // "sun" field.
  String? _sun;
  String get sun => _sun ?? '';
  bool hasSun() => _sun != null;

  // "monStart" field.
  DateTime? _monStart;
  DateTime? get monStart => _monStart;
  bool hasMonStart() => _monStart != null;

  // "monEnd" field.
  DateTime? _monEnd;
  DateTime? get monEnd => _monEnd;
  bool hasMonEnd() => _monEnd != null;

  // "tueStart" field.
  DateTime? _tueStart;
  DateTime? get tueStart => _tueStart;
  bool hasTueStart() => _tueStart != null;

  // "tueEnd" field.
  DateTime? _tueEnd;
  DateTime? get tueEnd => _tueEnd;
  bool hasTueEnd() => _tueEnd != null;

  // "wedStart" field.
  DateTime? _wedStart;
  DateTime? get wedStart => _wedStart;
  bool hasWedStart() => _wedStart != null;

  // "wedEnd" field.
  DateTime? _wedEnd;
  DateTime? get wedEnd => _wedEnd;
  bool hasWedEnd() => _wedEnd != null;

  // "thuStart" field.
  DateTime? _thuStart;
  DateTime? get thuStart => _thuStart;
  bool hasThuStart() => _thuStart != null;

  // "thurEnd" field.
  DateTime? _thurEnd;
  DateTime? get thurEnd => _thurEnd;
  bool hasThurEnd() => _thurEnd != null;

  // "friStart" field.
  DateTime? _friStart;
  DateTime? get friStart => _friStart;
  bool hasFriStart() => _friStart != null;

  // "friEnd" field.
  DateTime? _friEnd;
  DateTime? get friEnd => _friEnd;
  bool hasFriEnd() => _friEnd != null;

  // "satStart" field.
  DateTime? _satStart;
  DateTime? get satStart => _satStart;
  bool hasSatStart() => _satStart != null;

  // "satEnd" field.
  DateTime? _satEnd;
  DateTime? get satEnd => _satEnd;
  bool hasSatEnd() => _satEnd != null;

  // "sunStart" field.
  DateTime? _sunStart;
  DateTime? get sunStart => _sunStart;
  bool hasSunStart() => _sunStart != null;

  // "sundEnd" field.
  DateTime? _sundEnd;
  DateTime? get sundEnd => _sundEnd;
  bool hasSundEnd() => _sundEnd != null;

  // "Dtriverslicens" field.
  String? _dtriverslicens;
  String get dtriverslicens => _dtriverslicens ?? '';
  bool hasDtriverslicens() => _dtriverslicens != null;

  // "profilepicture" field.
  String? _profilepicture;
  String get profilepicture => _profilepicture ?? '';
  bool hasProfilepicture() => _profilepicture != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "trip" field.
  int? _trip;
  int get trip => _trip ?? 0;
  bool hasTrip() => _trip != null;

  // "driver" field.
  bool? _driver;
  bool get driver => _driver ?? false;
  bool hasDriver() => _driver != null;

  // "available" field.
  bool? _available;
  bool get available => _available ?? false;
  bool hasAvailable() => _available != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "totalrating" field.
  int? _totalrating;
  int get totalrating => _totalrating ?? 0;
  bool hasTotalrating() => _totalrating != null;

  // "sumRating" field.
  List<double>? _sumRating;
  List<double> get sumRating => _sumRating ?? const [];
  bool hasSumRating() => _sumRating != null;

  void _initializeFields() {
    _infor = snapshotData['infor'] as DocumentReference?;
    _location = snapshotData['location'] as LatLng?;
    _carplatenumber = snapshotData['carplatenumber'] as String?;
    _carmodel = snapshotData['carmodel'] as String?;
    _carColor = snapshotData['carColor'] as String?;
    _mon = snapshotData['mon'] as String?;
    _tues = snapshotData['tues'] as String?;
    _wed = snapshotData['wed'] as String?;
    _thur = snapshotData['thur'] as String?;
    _fri = snapshotData['fri'] as String?;
    _sat = snapshotData['sat'] as String?;
    _sun = snapshotData['sun'] as String?;
    _monStart = snapshotData['monStart'] as DateTime?;
    _monEnd = snapshotData['monEnd'] as DateTime?;
    _tueStart = snapshotData['tueStart'] as DateTime?;
    _tueEnd = snapshotData['tueEnd'] as DateTime?;
    _wedStart = snapshotData['wedStart'] as DateTime?;
    _wedEnd = snapshotData['wedEnd'] as DateTime?;
    _thuStart = snapshotData['thuStart'] as DateTime?;
    _thurEnd = snapshotData['thurEnd'] as DateTime?;
    _friStart = snapshotData['friStart'] as DateTime?;
    _friEnd = snapshotData['friEnd'] as DateTime?;
    _satStart = snapshotData['satStart'] as DateTime?;
    _satEnd = snapshotData['satEnd'] as DateTime?;
    _sunStart = snapshotData['sunStart'] as DateTime?;
    _sundEnd = snapshotData['sundEnd'] as DateTime?;
    _dtriverslicens = snapshotData['Dtriverslicens'] as String?;
    _profilepicture = snapshotData['profilepicture'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
    _trip = castToType<int>(snapshotData['trip']);
    _driver = snapshotData['driver'] as bool?;
    _available = snapshotData['available'] as bool?;
    _gender = snapshotData['gender'] as String?;
    _active = snapshotData['active'] as bool?;
    _totalrating = castToType<int>(snapshotData['totalrating']);
    _sumRating = getDataList(snapshotData['sumRating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Driver');

  static Stream<DriverRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverRecord.fromSnapshot(s));

  static Future<DriverRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverRecord.fromSnapshot(s));

  static DriverRecord fromSnapshot(DocumentSnapshot snapshot) => DriverRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverRecordData({
  DocumentReference? infor,
  LatLng? location,
  String? carplatenumber,
  String? carmodel,
  String? carColor,
  String? mon,
  String? tues,
  String? wed,
  String? thur,
  String? fri,
  String? sat,
  String? sun,
  DateTime? monStart,
  DateTime? monEnd,
  DateTime? tueStart,
  DateTime? tueEnd,
  DateTime? wedStart,
  DateTime? wedEnd,
  DateTime? thuStart,
  DateTime? thurEnd,
  DateTime? friStart,
  DateTime? friEnd,
  DateTime? satStart,
  DateTime? satEnd,
  DateTime? sunStart,
  DateTime? sundEnd,
  String? dtriverslicens,
  String? profilepicture,
  double? rating,
  int? trip,
  bool? driver,
  bool? available,
  String? gender,
  bool? active,
  int? totalrating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'infor': infor,
      'location': location,
      'carplatenumber': carplatenumber,
      'carmodel': carmodel,
      'carColor': carColor,
      'mon': mon,
      'tues': tues,
      'wed': wed,
      'thur': thur,
      'fri': fri,
      'sat': sat,
      'sun': sun,
      'monStart': monStart,
      'monEnd': monEnd,
      'tueStart': tueStart,
      'tueEnd': tueEnd,
      'wedStart': wedStart,
      'wedEnd': wedEnd,
      'thuStart': thuStart,
      'thurEnd': thurEnd,
      'friStart': friStart,
      'friEnd': friEnd,
      'satStart': satStart,
      'satEnd': satEnd,
      'sunStart': sunStart,
      'sundEnd': sundEnd,
      'Dtriverslicens': dtriverslicens,
      'profilepicture': profilepicture,
      'rating': rating,
      'trip': trip,
      'driver': driver,
      'available': available,
      'gender': gender,
      'active': active,
      'totalrating': totalrating,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverRecordDocumentEquality implements Equality<DriverRecord> {
  const DriverRecordDocumentEquality();

  @override
  bool equals(DriverRecord? e1, DriverRecord? e2) {
    const listEquality = ListEquality();
    return e1?.infor == e2?.infor &&
        e1?.location == e2?.location &&
        e1?.carplatenumber == e2?.carplatenumber &&
        e1?.carmodel == e2?.carmodel &&
        e1?.carColor == e2?.carColor &&
        e1?.mon == e2?.mon &&
        e1?.tues == e2?.tues &&
        e1?.wed == e2?.wed &&
        e1?.thur == e2?.thur &&
        e1?.fri == e2?.fri &&
        e1?.sat == e2?.sat &&
        e1?.sun == e2?.sun &&
        e1?.monStart == e2?.monStart &&
        e1?.monEnd == e2?.monEnd &&
        e1?.tueStart == e2?.tueStart &&
        e1?.tueEnd == e2?.tueEnd &&
        e1?.wedStart == e2?.wedStart &&
        e1?.wedEnd == e2?.wedEnd &&
        e1?.thuStart == e2?.thuStart &&
        e1?.thurEnd == e2?.thurEnd &&
        e1?.friStart == e2?.friStart &&
        e1?.friEnd == e2?.friEnd &&
        e1?.satStart == e2?.satStart &&
        e1?.satEnd == e2?.satEnd &&
        e1?.sunStart == e2?.sunStart &&
        e1?.sundEnd == e2?.sundEnd &&
        e1?.dtriverslicens == e2?.dtriverslicens &&
        e1?.profilepicture == e2?.profilepicture &&
        e1?.rating == e2?.rating &&
        e1?.trip == e2?.trip &&
        e1?.driver == e2?.driver &&
        e1?.available == e2?.available &&
        e1?.gender == e2?.gender &&
        e1?.active == e2?.active &&
        e1?.totalrating == e2?.totalrating &&
        listEquality.equals(e1?.sumRating, e2?.sumRating);
  }

  @override
  int hash(DriverRecord? e) => const ListEquality().hash([
        e?.infor,
        e?.location,
        e?.carplatenumber,
        e?.carmodel,
        e?.carColor,
        e?.mon,
        e?.tues,
        e?.wed,
        e?.thur,
        e?.fri,
        e?.sat,
        e?.sun,
        e?.monStart,
        e?.monEnd,
        e?.tueStart,
        e?.tueEnd,
        e?.wedStart,
        e?.wedEnd,
        e?.thuStart,
        e?.thurEnd,
        e?.friStart,
        e?.friEnd,
        e?.satStart,
        e?.satEnd,
        e?.sunStart,
        e?.sundEnd,
        e?.dtriverslicens,
        e?.profilepicture,
        e?.rating,
        e?.trip,
        e?.driver,
        e?.available,
        e?.gender,
        e?.active,
        e?.totalrating,
        e?.sumRating
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverRecord;
}
