import '../adddash/adddash_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_web_view.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  DateTimeRange calendarSelectedDay;
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
          style: FlutterFlowTheme.title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.darkBG,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 48,
          icon: Icon(
            Icons.add_rounded,
            color: FlutterFlowTheme.white,
            size: 30,
          ),
          onPressed: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 270),
                reverseDuration: Duration(milliseconds: 270),
                child: AdddashWidget(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 53,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.darkBG,
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: Image.asset(
                        'assets/images/waves@2x.png',
                      ).image,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(50, 0, 0, 10),
                    child: Text(
                      'Welcome Back Scholar!',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.grayBG,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_aZTdD5.json',
              width: 150,
              height: 130,
              fit: BoxFit.cover,
              animate: true,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: LinearPercentIndicator(
                percent: 0.3,
                width: 240,
                lineHeight: 24,
                animation: true,
                progressColor: FlutterFlowTheme.primaryColor,
                backgroundColor: Color(0xFFF1F4F8),
                center: Text(
                  '30%',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.primaryBlack,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NavBarPage(initialPage: 'myTasks'),
                                  ),
                                );
                              },
                              child: Text(
                                'Lets Check your TO-DO list',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.primaryBlack,
                                ),
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: FlutterFlowCalendar(
                              color: FlutterFlowTheme.primaryColor,
                              weekFormat: false,
                              weekStartsMonday: false,
                              onChange: (DateTimeRange newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: TextStyle(),
                              dayOfWeekStyle: TextStyle(),
                              dateStyle: TextStyle(),
                              selectedDateStyle: TextStyle(),
                              inactiveDateStyle: TextStyle(),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                hintText:
                                    'Use me to clear your brain! Type Away',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.primaryBlack,
                              ),
                            ),
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: FlutterFlowYoutubePlayer(
                              url:
                                  'https://www.youtube.com/watch?v=5qap5aO4i9A',
                              autoPlay: false,
                              looping: true,
                              mute: false,
                              showControls: true,
                              showFullScreen: true,
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: FlutterFlowWebView(
                              url: 'https://pomofocus.io/',
                              bypass: false,
                              verticalScroll: false,
                              horizontalScroll: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
