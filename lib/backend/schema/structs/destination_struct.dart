// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DestinationStruct extends FFFirebaseStruct {
  DestinationStruct({
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

  static DestinationStruct fromMap(Map<String, dynamic> data) =>
      DestinationStruct(
        country: data['country'] as String?,
        adress: data['adress'] as String?,
        city: data['city'] as String?,
        state: data['state'] as String?,
        zip: data['zip'] as String?,
      );

  static DestinationStruct? maybeFromMap(dynamic data) => data is Map
      ? DestinationStruct.fromMap(data.cast<String, dynamic>())
      : null;

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

  static DestinationStruct fromSerializableMap(Map<String, dynamic> data) =>
      DestinationStruct(
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
  String toString() => 'DestinationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DestinationStruct &&
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

DestinationStruct createDestinationStruct({
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
    DestinationStruct(
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

DestinationStruct? updateDestinationStruct(
  DestinationStruct? destination, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    destination
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDestinationStructData(
  Map<String, dynamic> firestoreData,
  DestinationStruct? destination,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (destination == null) {
    return;
  }
  if (destination.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && destination.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final destinationData =
      getDestinationFirestoreData(destination, forFieldValue);
  final nestedData =
      destinationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = destination.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDestinationFirestoreData(
  DestinationStruct? destination, [
  bool forFieldValue = false,
]) {
  if (destination == null) {
    return {};
  }
  final firestoreData = mapToFirestore(destination.toMap());

  // Add any Firestore field values
  destination.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDestinationListFirestoreData(
  List<DestinationStruct>? destinations,
) =>
    destinations?.map((e) => getDestinationFirestoreData(e, true)).toList() ??
    [];
