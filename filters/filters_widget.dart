import '../flutter_flow/flutter_flow_count_controller.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_google_map.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../studyspots_copy/studyspots_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FiltersWidget extends StatefulWidget {
  const FiltersWidget({Key key}) : super(key: key);

  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  LatLng googleMapsCenter;
  Completer<GoogleMapController> googleMapsController;
  String dropDownValue;
  double sliderValue1;
  double ratingBarValue;
  int countControllerValue1;
  int countControllerValue2;
  double sliderValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
          child: Text(
            'Fine tune your Study',
            style: FlutterFlowTheme.title2.override(
              fontFamily: 'Montserrat',
              color: FlutterFlowTheme.darkBG,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: Color(0xFF242424),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 10,
      ),
      backgroundColor: FlutterFlowTheme.grayBG,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowGoogleMap(
                  controller: googleMapsController,
                  onCameraIdle: (latLng) => googleMapsCenter = latLng,
                  initialLocation: googleMapsCenter ??=
                      LatLng(34.42083, -119.698189),
                  markerColor: GoogleMarkerColor.violet,
                  mapType: MapType.hybrid,
                  style: GoogleMapStyle.standard,
                  initialZoom: 14,
                  allowInteraction: true,
                  allowZoom: true,
                  showZoomControls: false,
                  showLocation: true,
                  showCompass: false,
                  showMapToolbar: false,
                  showTraffic: false,
                  centerMapOnMarkerTap: true,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: FlutterFlowDropDown(
                  initialOption: dropDownValue ??= 'Coffee Shop',
                  options: ['Coffee Shop', 'Library', 'School'].toList(),
                  onChanged: (val) => setState(() => dropDownValue = val),
                  height: 50,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.black,
                  ),
                  hintText: 'Location',
                  fillColor: Colors.white,
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Distance',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Slider.adaptive(
                        activeColor: FlutterFlowTheme.primaryColor,
                        inactiveColor: Color(0xFFDBE2E7),
                        min: 1,
                        max: 25,
                        value: sliderValue1 ??= 19,
                        label: sliderValue1.toString(),
                        divisions: 2,
                        onChanged: (newValue) {
                          setState(() => sliderValue1 = newValue);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Rating',
                    style: FlutterFlowTheme.bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                      child: RatingBar.builder(
                        onRatingUpdate: (newValue) =>
                            setState(() => ratingBarValue = newValue),
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: FlutterFlowTheme.primaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating: ratingBarValue ??= 4,
                        unratedColor: Color(0xFFDBE2E7),
                        itemCount: 10,
                        itemPadding: EdgeInsets.fromLTRB(0, 0, 4, 0),
                        itemSize: 28,
                        glowColor: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'People',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.primaryBlack,
                      fontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                    child: Container(
                      width: 160,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Color(0xFF9E9E9E),
                          width: 1,
                        ),
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.minus,
                          color:
                              enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        incrementIconBuilder: (enabled) => FaIcon(
                          FontAwesomeIcons.plus,
                          color: enabled
                              ? FlutterFlowTheme.primaryColor
                              : Color(0xFFEEEEEE),
                          size: 20,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        count: countControllerValue1 ??= 0,
                        updateCount: (count) =>
                            setState(() => countControllerValue1 = count),
                        stepSize: 1,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Outlets',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryBlack,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
                      child: Container(
                        width: 160,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: Color(0xFF9E9E9E),
                            width: 1,
                          ),
                        ),
                        child: FlutterFlowCountController(
                          decrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.minus,
                            color:
                                enabled ? Color(0xDD000000) : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          incrementIconBuilder: (enabled) => FaIcon(
                            FontAwesomeIcons.plus,
                            color: enabled
                                ? FlutterFlowTheme.primaryColor
                                : Color(0xFFEEEEEE),
                            size: 20,
                          ),
                          countBuilder: (count) => Text(
                            count.toString(),
                            style: GoogleFonts.getFont(
                              'Roboto',
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          count: countControllerValue2 ??= 0,
                          updateCount: (count) =>
                              setState(() => countControllerValue2 = count),
                          stepSize: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Silent Library               Skrillex Concert',
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.primaryBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 350,
                    child: Slider.adaptive(
                      activeColor: FlutterFlowTheme.primaryColor,
                      inactiveColor: FlutterFlowTheme.primaryBlack,
                      min: 0,
                      max: 100,
                      value: sliderValue2 ??= 40,
                      onChanged: (newValue) {
                        setState(() => sliderValue2 = newValue);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 24),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudyspotsCopyWidget(),
                      ),
                    );
                  },
                  text: 'Save Changes',
                  options: FFButtonOptions(
                    width: 300,
                    height: 50,
                    color: Color(0xFF3474E0),
                    textStyle: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                    elevation: 2,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
