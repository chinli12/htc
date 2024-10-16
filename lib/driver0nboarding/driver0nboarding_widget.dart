import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'driver0nboarding_model.dart';
export 'driver0nboarding_model.dart';

class Driver0nboardingWidget extends StatefulWidget {
  /// i want create a driver onbording, i want an input for days of the week and
  /// opening and closing time of the the day, the location the driver oparate
  /// profile picture, first and last name
  const Driver0nboardingWidget({super.key});

  @override
  State<Driver0nboardingWidget> createState() => _Driver0nboardingWidgetState();
}

class _Driver0nboardingWidgetState extends State<Driver0nboardingWidget> {
  late Driver0nboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Driver0nboardingModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'driver0nboarding'});
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primarydark,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primarydark,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('DRIVER0NBOARDING_arrow_back_rounded_ICN_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60.0),
                            child: Image.network(
                              _model.isDataUploading2 != null
                                  ? _model.uploadedFileUrl1
                                  : 'https://images.unsplash.com/photo-1534790741270-1ecaaee38a98?w=500&h=500',
                              width: 120.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'DRIVER0NBOARDING_Container_h21cp9wh_ON_T');
                              logFirebaseEvent(
                                  'Container_upload_media_to_firebase');
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                safeSetState(
                                    () => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  safeSetState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  safeSetState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: MediaQuery.sizeOf(context).height * 1.0,
                              decoration: BoxDecoration(
                                color: Color(0x33000000),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.5, 0.5),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _model.textController1,
                        focusNode: _model.textFieldFocusNode1,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'car model',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        minLines: 1,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller: _model.textController2,
                        focusNode: _model.textFieldFocusNode2,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'color',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        minLines: 1,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
                      TextFormField(
                        controller: _model.textController3,
                        focusNode: _model.textFieldFocusNode3,
                        autofocus: false,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'plate number',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFE0E0E0),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                        minLines: 1,
                        validator: _model.textController3Validator
                            .asValidator(context),
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                  FlutterFlowPlacePicker(
                    iOSGoogleMapsApiKey:
                        'AIzaSyBBhmqN_YCkm8O_NZdodawB24DIbQFwNm0',
                    androidGoogleMapsApiKey:
                        'AIzaSyBjtx_May5RHT6l6aeZZHN8ifz2XL2xaUY',
                    webGoogleMapsApiKey:
                        'AIzaSyC7Bu8u2gMTxCuVppA4AwVb8KCKQyT2RPs',
                    onSelect: (place) async {
                      safeSetState(() => _model.placePickerValue = place);
                    },
                    defaultText: 'Select Operation Area',
                    icon: Icon(
                      Icons.place,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 20.0,
                    ),
                    buttonOptions: FFButtonOptions(
                      width: double.infinity,
                      height: 50.0,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondarydark,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Working Days',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowChoiceChips(
                              options: [
                                ChipData('Mon'),
                                ChipData('Tue'),
                                ChipData('Wed'),
                                ChipData('Thu'),
                                ChipData('Fri'),
                                ChipData('Sat'),
                                ChipData('Sun')
                              ],
                              onChanged: (val) async {
                                safeSetState(() =>
                                    _model.choiceChipsValue = val?.firstOrNull);
                                logFirebaseEvent(
                                    'DRIVER0NBOARDING_ChoiceChips_hl282e77_ON');
                                if (_model.choiceChipsValue == 'Mon') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.monday = 'Mon';
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == 'Tue') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.tuesday = 'Tue';
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == 'Wed') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.wed = 'Wed';
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == 'Thu') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.thur = 'Thu';
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == 'Fri') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.fiday = 'Fri';
                                  safeSetState(() {});
                                } else if (_model.choiceChipsValue == 'Sat') {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.satudaay = 'Sat';
                                  safeSetState(() {});
                                } else {
                                  logFirebaseEvent(
                                      'ChoiceChips_update_page_state');
                                  _model.sun = 'Sun';
                                  safeSetState(() {});
                                }
                              },
                              selectedChipStyle: ChipStyle(
                                backgroundColor:
                                    FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              unselectedChipStyle: ChipStyle(
                                backgroundColor: Color(0xFFF0F0F0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                    ),
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                iconSize: 18.0,
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              chipSpacing: 8.0,
                              rowSpacing: 8.0,
                              multiselect: false,
                              alignment: WrapAlignment.start,
                              controller: _model.choiceChipsValueController ??=
                                  FormFieldController<List<String>>(
                                [],
                              ),
                              wrapped: true,
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondarydark,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Working Hours for ${_model.choiceChipsValue}',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Start Time',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DRIVER0NBOARDING_Container_79lguxjo_ON_T');
                                          logFirebaseEvent(
                                              'Container_date_time_picker');

                                          final _datePicked1Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (_datePicked1Time != null) {
                                            safeSetState(() {
                                              _model.datePicked1 = DateTime(
                                                getCurrentTimestamp.year,
                                                getCurrentTimestamp.month,
                                                getCurrentTimestamp.day,
                                                _datePicked1Time.hour,
                                                _datePicked1Time.minute,
                                              );
                                            });
                                          }
                                          if (_model.datePicked1 != null) {
                                            if (_model.choiceChipsValue ==
                                                'Mon') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.mostart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Tue') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.tuestart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Wed') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.wedstart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Thu') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.thusstart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Fri') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.fristart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Sat') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.satstart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.sunstart =
                                                  _model.datePicked1;
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0F0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 10.0, 6.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.datePicked1 != null
                                                        ? dateTimeFormat(
                                                            "jm",
                                                            _model.datePicked1,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )
                                                        : dateTimeFormat(
                                                            "jm",
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                    'time',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.access_time,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'End Time',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'DRIVER0NBOARDING_Container_ombn14pn_ON_T');
                                          logFirebaseEvent(
                                              'Container_date_time_picker');

                                          final _datePicked2Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                getCurrentTimestamp),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (_datePicked2Time != null) {
                                            safeSetState(() {
                                              _model.datePicked2 = DateTime(
                                                getCurrentTimestamp.year,
                                                getCurrentTimestamp.month,
                                                getCurrentTimestamp.day,
                                                _datePicked2Time.hour,
                                                _datePicked2Time.minute,
                                              );
                                            });
                                          }
                                          if (_model.datePicked2 != null) {
                                            if (_model.choiceChipsValue ==
                                                'Mon') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.monend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Tue') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.tueend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Wed') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.wedend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Thu') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.thusend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Fri') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.friend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else if (_model
                                                    .choiceChipsValue ==
                                                'Sat') {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.satend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'Container_update_page_state');
                                              _model.sunend =
                                                  _model.datePicked2;
                                              safeSetState(() {});
                                            }
                                          }
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F0F0),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    6.0, 10.0, 6.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    _model.datePicked2 != null
                                                        ? dateTimeFormat(
                                                            "jm",
                                                            _model.datePicked2,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          )
                                                        : dateTimeFormat(
                                                            "jm",
                                                            getCurrentTimestamp,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                    'time',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.access_time,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 5.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'upload your driver license ',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 300.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondarydark,
                        ),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'DRIVER0NBOARDING_Column_1nwicrbq_ON_TAP');
                            logFirebaseEvent('Column_upload_media_to_firebase');
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(
                                  () => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                                showUploadMessage(context, 'Success!');
                              } else {
                                safeSetState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_model.uploadedFileUrl2 == null ||
                                  _model.uploadedFileUrl2 == '')
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.image_outlined,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              if (_model.uploadedFileUrl2 != null &&
                                  _model.uploadedFileUrl2 != '')
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    _model.uploadedFileUrl2,
                                    width: double.infinity,
                                    height: 300.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'DRIVER0NBOARDING_COMPLETE_ONBOARDING_BTN');
                      if ((_model.uploadedFileUrl1 != null &&
                              _model.uploadedFileUrl1 != '') &&
                          (_model.textController1.text != null &&
                              _model.textController1.text != '') &&
                          (_model.textController2.text != null &&
                              _model.textController2.text != '') &&
                          (_model.textController3.text != null &&
                              _model.textController3.text != '') &&
                          (_model.uploadedFileUrl2 != null &&
                              _model.uploadedFileUrl2 != '')) {
                        logFirebaseEvent('Button_backend_call');

                        var driverRecordReference =
                            DriverRecord.collection.doc();
                        await driverRecordReference.set(createDriverRecordData(
                          infor: currentUserReference,
                          location: _model.placePickerValue.latLng,
                          carplatenumber: _model.textController3.text,
                          carmodel: _model.textController1.text,
                          carColor: _model.textController2.text,
                          mon: _model.monday,
                          tues: _model.tuesday,
                          wed: _model.wed,
                          thur: _model.thur,
                          fri: _model.fiday,
                          sat: _model.satudaay,
                          sun: _model.sun,
                          monStart: _model.mostart,
                          monEnd: _model.monend,
                          tueStart: _model.tuestart,
                          tueEnd: _model.tueend,
                          wedStart: _model.wedstart,
                          wedEnd: _model.wedend,
                          thuStart: _model.thusstart,
                          thurEnd: _model.thusend,
                          friStart: _model.fristart,
                          friEnd: _model.friend,
                          satStart: _model.satstart,
                          satEnd: _model.satend,
                          sunStart: _model.sunstart,
                          sundEnd: _model.sunend,
                          dtriverslicens: _model.uploadedFileUrl2,
                          profilepicture: _model.uploadedFileUrl1,
                          available: true,
                          gender:
                              valueOrDefault(currentUserDocument?.gender, ''),
                        ));
                        _model.driver = DriverRecord.getDocumentFromData(
                            createDriverRecordData(
                              infor: currentUserReference,
                              location: _model.placePickerValue.latLng,
                              carplatenumber: _model.textController3.text,
                              carmodel: _model.textController1.text,
                              carColor: _model.textController2.text,
                              mon: _model.monday,
                              tues: _model.tuesday,
                              wed: _model.wed,
                              thur: _model.thur,
                              fri: _model.fiday,
                              sat: _model.satudaay,
                              sun: _model.sun,
                              monStart: _model.mostart,
                              monEnd: _model.monend,
                              tueStart: _model.tuestart,
                              tueEnd: _model.tueend,
                              wedStart: _model.wedstart,
                              wedEnd: _model.wedend,
                              thuStart: _model.thusstart,
                              thurEnd: _model.thusend,
                              friStart: _model.fristart,
                              friEnd: _model.friend,
                              satStart: _model.satstart,
                              satEnd: _model.satend,
                              sunStart: _model.sunstart,
                              sundEnd: _model.sunend,
                              dtriverslicens: _model.uploadedFileUrl2,
                              profilepicture: _model.uploadedFileUrl1,
                              available: true,
                              gender: valueOrDefault(
                                  currentUserDocument?.gender, ''),
                            ),
                            driverRecordReference);
                        logFirebaseEvent('Button_backend_call');

                        await currentUserReference!
                            .update(createUsersRecordData(
                          driver: _model.driver?.reference,
                        ));
                        logFirebaseEvent('Button_navigate_to');

                        context.goNamed(
                          'thankyou',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                            ),
                          },
                        );
                      } else {
                        logFirebaseEvent('Button_alert_dialog');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('please this infor is needed'),
                              content: Text(
                                  'car model, profile picture, plate number,color, drivers license'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      }

                      safeSetState(() {});
                    },
                    text: 'Complete Onboarding',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 56.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                ].divide(SizedBox(height: 24.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
