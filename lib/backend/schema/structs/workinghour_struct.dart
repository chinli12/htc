// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkinghourStruct extends FFFirebaseStruct {
  WorkinghourStruct({
    DateTime? days,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _days = days,
        super(firestoreUtilData);

  // "days" field.
  DateTime? _days;
  DateTime? get days => _days;
  set days(DateTime? val) => _days = val;

  bool hasDays() => _days != null;

  static WorkinghourStruct fromMap(Map<String, dynamic> data) =>
      WorkinghourStruct(
        days: data['days'] as DateTime?,
      );

  static WorkinghourStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkinghourStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'days': _days,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'days': serializeParam(
          _days,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static WorkinghourStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkinghourStruct(
        days: deserializeParam(
          data['days'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'WorkinghourStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkinghourStruct && days == other.days;
  }

  @override
  int get hashCode => const ListEquality().hash([days]);
}

WorkinghourStruct createWorkinghourStruct({
  DateTime? days,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkinghourStruct(
      days: days,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkinghourStruct? updateWorkinghourStruct(
  WorkinghourStruct? workinghour, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workinghour
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkinghourStructData(
  Map<String, dynamic> firestoreData,
  WorkinghourStruct? workinghour,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workinghour == null) {
    return;
  }
  if (workinghour.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workinghour.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workinghourData =
      getWorkinghourFirestoreData(workinghour, forFieldValue);
  final nestedData =
      workinghourData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workinghour.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkinghourFirestoreData(
  WorkinghourStruct? workinghour, [
  bool forFieldValue = false,
]) {
  if (workinghour == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workinghour.toMap());

  // Add any Firestore field values
  workinghour.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkinghourListFirestoreData(
  List<WorkinghourStruct>? workinghours,
) =>
    workinghours?.map((e) => getWorkinghourFirestoreData(e, true)).toList() ??
    [];
