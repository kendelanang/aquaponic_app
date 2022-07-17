import 'package:aquaponic_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class Manual extends StatefulWidget {
  const Manual({Key key}) : super(key: key);

  @override
  _ManualState createState() => _ManualState();
}

class _ManualState extends State<Manual> {
  final _rdatabase = FirebaseDatabase.instance.ref();
  String _phup;
  bool switchListTileValue;

  @override
  void initState() {
    super.initState();
    _activateListener();
  }

  void _activateListener() {
    _rdatabase.child('test/phup').onValue.listen((event) {
      final String _baca = event.snapshot.value;
      setState(() {
        _phup = _baca;
      });
    });
  }

  void phup() {
    _rdatabase.child('test').update({"phup": "on"});
    _rdatabase.child('test').update({"phdown": "off"});
  }

  void phdown() {
    _rdatabase.child('test').update({"phdown": "on"});
    _rdatabase.child('test').update({"phup": "off"});
  }

  void ppmup() {
    _rdatabase.child('test').update({"ppmup": "on"});
    _rdatabase.child('test').update({"ppmdown": "off"});
  }

  void ppmdown() {
    _rdatabase.child('test').update({"ppmdown": "on"});
    _rdatabase.child('test').update({"ppmup": "off"});
  }

  void offall() {
    _rdatabase.child('test').update({"phdown": "off"});
    _rdatabase.child('test').update({"phup": "off"});
    _rdatabase.child('test').update({"ppmdown": "off"});
    _rdatabase.child('test').update({"ppmup": "off"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(0, 38, 50, 56),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4FC3F7),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: Image.asset(
                'assets/images/background.jpg',
              ).image,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 50),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Aqua Ponics',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Monitoring System',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                  child: Text(
                    'Manual Control',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF134059),
                      fontSize: 25,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00CCCB), Color(0xFF39AFD2)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, 0),
                        end: AlignmentDirectional(-1, 0),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Image.asset(
                            'assets/images/ph.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Keasaman (pH) Air',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Kadar pH untuk Aquarium\nsehat adalah 6 - 7.5',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.7, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'pH :',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    "$_phup",
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF10A0D0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          phup();
                          print('Button pressed ...');
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 15,
                        ),
                        label: Text('pH +'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF10A0D0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          phdown();
                          print('Button pressed ...');
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 15,
                        ),
                        label: Text('pH -'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF00CCCB), Color(0xFF39AFD2)],
                        stops: [0, 1],
                        begin: AlignmentDirectional(1, 0),
                        end: AlignmentDirectional(-1, 0),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: Image.asset(
                            'assets/images/tds.png',
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kejernihan Air (TDS)',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Semakin tinggi Nilai\nSemakin keruh',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'ppm :',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    '0',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF10A0D0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          ppmup();
                          print('Button pressed ...');
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 15,
                        ),
                        label: Text('ppm +'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF10A0D0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          ppmdown();
                          print('Button pressed ...');
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 15,
                        ),
                        label: Text('ppm -'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFF10A0D0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      offall();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard()),
                      );
                      print('Button pressed ...');
                    },
                    icon: Icon(
                      Icons.home,
                      size: 15,
                    ),
                    label: Text('Kembali Ke Dashboard'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
