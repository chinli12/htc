import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bookedview_model.dart';
export 'bookedview_model.dart';

class BookedviewWidget extends StatefulWidget {
  const BookedviewWidget({
    super.key,
    required this.docref,
    required this.doc,
  });

  final DocumentReference? docref;
  final BookingRecord? doc;

  @override
  State<BookedviewWidget> createState() => _BookedviewWidgetState();
}

class _BookedviewWidgetState extends State<BookedviewWidget> {
  late BookedviewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookedviewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookedview'});
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
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1500087326943-dcabb70c026f?w=500&h=500',
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 120.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x99000000), Colors.transparent],
                        stops: [0.0, 1.0],
                        begin: AlignmentDirectional(0.0, 1.0),
                        end: AlignmentDirectional(0, -1.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FlutterFlowIconButton(
                            borderRadius: 20.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x33FFFFFF),
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOOKEDVIEW_PAGE_arrow_back_ICN_ON_TAP');
                              logFirebaseEvent('IconButton_navigate_back');
                              context.safePop();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primarydark,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 24.0, 32.0, 24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your ride is booked!',
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Container(
                                width: 60.0,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).success,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                          Container(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Pick-up',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            Text(
                                              '${widget!.doc?.sourceAdress?.adress}${widget!.doc?.sourceAdress?.city}${widget!.doc?.sourceAdress?.country}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Drop-off',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodySmall
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                            Text(
                                              '${widget!.doc?.destiAdress?.adress}${widget!.doc?.destiAdress?.city}${widget!.doc?.destiAdress?.country}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 16.0)),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            ),
                          ),
                          Container(
                            height: 200.0,
                            child: FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  LatLng(13.106061, -59.613158),
                              markers: (widget!.doc?.driversPositions ?? [])
                                  .map(
                                    (marker) => FlutterFlowMarker(
                                      marker.serialize(),
                                      marker,
                                    ),
                                  )
                                  .toList(),
                              markerColor: GoogleMarkerColor.violet,
                              markerImage: MarkerImage(
                                imagePath:
                                    'assets/images/driver-marker-icon.png',
                                isAssetImage: true,
                                size: 20.0 ?? 20,
                              ),
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: true,
                              showTraffic: true,
                              centerMapOnMarkerTap: true,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'BOOKEDVIEW_PAGE_RATE_DRIVER_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'ratingpage',
                                queryParameters: {
                                  'driver': serializeParam(
                                    widget!.doc?.driver,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            text: 'Rate Driver',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 2.0,
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Need help?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                'Contact support',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ].divide(SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
