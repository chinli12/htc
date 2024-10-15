// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SourceStruct extends FFFirebaseStruct {
  SourceStruct({
    String? country,
    String? adress,
    String? city,
    String? state,
    String? zip,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _country = country,
        _adress = adress,
        _city = city,
        _state = state,
        _zip = zip,
        super(firestoreUtilData);

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;

  bool hasCountry() => _country != null;

  // "adress" field.
  String? _adress;
  String get adress => _adress ?? '';
  set adress(String? val) => _adress = val;

  bool hasAdress() => _adress != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;

  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  // "zip" field.
  String? _zip;
  String get zip => _zip ?? '';
  set zip(String? val) => _zip = val;

  bool hasZip() => _zip != null;

  static SourceStruct fromMap(Map<String, dynamic> data) => SourceStruct(
        country: data['country'] as String?,
        adress: data['adress'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        zip: data['zip'] as String?,
      );

  static SourceStruct? maybeFromMap(dynamic data) =>
      data is Map ? SourceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'country': _country,
        'adress': _adress,
        'city': _city,
        'state': _state,
        'zip': _zip,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'adress': serializeParam(
          _adress,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'zip': serializeParam(
          _zip,
          ParamType.String,
        ),
      }.withoutNulls;

  static SourceStruct fromSerializableMap(Map<String, dynamic> data) =>
      SourceStruct(
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        adress: deserializeParam(
          data['adress'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        zip: deserializeParam(
          data['zip'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SourceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SourceStruct &&
        country == other.country &&
        adress == other.adress &&
        city == other.city &&
        state == other.state &&
        zip == other.zip;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([country, adress, city, state, zip]);
}

SourceStruct createSourceStruct({
  String? country,
  String? adress,
  String? city,
  String? state,
  String? zip,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SourceStruct(
      country: country,
      adress: adress,
      city: city,
      state: state,
      zip: zip,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SourceStruct? updateSourceStruct(
  SourceStruct? source, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    source
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSourceStructData(
  Map<String, dynamic> firestoreData,
  SourceStruct? source,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (source == null) {
    return;
  }
  if (source.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && source.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sourceData = getSourceFirestoreData(source, forFieldValue);
  final nestedData = sourceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = source.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSourceFirestoreData(
  SourceStruct? source, [
  bool forFieldValue = false,
]) {
  if (source == null) {
    return {};
  }
  final firestoreData = mapToFirestore(source.toMap());

  // Add any Firestore field values
  source.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSourceListFirestoreData(
  List<SourceStruct>? sources,
) =>
    sources?.map((e) => getSourceFirestoreData(e, true)).toList() ?? [];
