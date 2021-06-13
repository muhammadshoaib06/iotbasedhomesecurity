import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotbasedhomesecurity/Constants/size_config.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../Constants/size_config.dart';

class ButtonScreen extends StatefulWidget {
  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  static final databaseReferenceTest = FirebaseDatabase.instance.reference();
  bool bulb1 = true;
  bool bulb1x = false;
  bool bulb2 = true;
  bool bulb2x = false;
  bool bulb3 = true;
  bool bulb3x = false;
  bool bulb4 = true;
  bool bulb4x = false;
  bool _isListening = false;
  stt.SpeechToText _speech;
  String _text = '';
  double _confidence = 1.0;
  String _micText = 'Tap to start listening!';

  @override
  void initState() {
    // TODO: implement initState
    _speech = stt.SpeechToText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_text);
    updateData('voiceCommand', '$_text');
    return Material(
        child: SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00A9A5), Color(0xffFFB843)])),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Appliances Control',
                    style: GoogleFonts.robotoMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.textMultiplier * 3.5),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                flex: SizeConfig.isMobilePortrait ? 6 : 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: SizeConfig.heightMultiplier * 5,
                        left: SizeConfig.widthMultiplier * 5,
                        right: SizeConfig.widthMultiplier * 5,
                        bottom: SizeConfig.heightMultiplier * 3),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                if (bulb1)
                                  Expanded(
                                    child: Visibility(
                                      visible: bulb1,
                                      child: InkWell(
                                        onTap: () {
                                          updateData('AC', 'on');
                                          setState(() {
                                            bulb1 = false;
                                            bulb1x = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff00A9A5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 0.5,
                                                      blurRadius: 5,
                                                      offset: Offset(0.0, 3.0))
                                                ]),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.lightbulb_outline,
                                                      color: Colors.white,
                                                      size: SizeConfig
                                                              .textMultiplier *
                                                          8,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'Lights',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              3.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  Expanded(
                                    child: Visibility(
                                      visible: bulb1x,
                                      child: InkWell(
                                        onTap: () {
                                          updateData('AC', 'off');
                                          setState(() {
                                            bulb1 = true;
                                            bulb1x = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff00A9A5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 0.5,
                                                      blurRadius: 5,
                                                      offset: Offset(0.0, 3.0))
                                                ]),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.lightbulb,
                                                      color: Colors.white,
                                                      size: SizeConfig
                                                              .textMultiplier *
                                                          10,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'Lights',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              3.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                bulb2
                                    ? Expanded(
                                        child: Visibility(
                                          visible: bulb2,
                                          child: InkWell(
                                            onTap: () {
                                              updateData('Fan', 'on');
                                              setState(() {
                                                bulb2 = false;
                                                bulb2x = true;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xff00A9A5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 0.5,
                                                          blurRadius: 5,
                                                          offset:
                                                              Offset(0.0, 3.0))
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Icon(
                                                          Icons
                                                              .lightbulb_outline,
                                                          color: Colors.white,
                                                          size: SizeConfig
                                                                  .textMultiplier *
                                                              8,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          'Fans',
                                                          style: GoogleFonts.roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: SizeConfig
                                                                      .textMultiplier *
                                                                  3.0),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: Visibility(
                                          visible: bulb2x,
                                          child: InkWell(
                                            onTap: () {
                                              updateData('Fan', 'off');
                                              setState(() {
                                                bulb2 = true;
                                                bulb2x = false;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xff00A9A5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 0.5,
                                                          blurRadius: 5,
                                                          offset:
                                                              Offset(0.0, 3.0))
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Icon(
                                                          Icons.lightbulb,
                                                          color: Colors.white,
                                                          size: SizeConfig
                                                                  .textMultiplier *
                                                              10,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          'Fans',
                                                          style: GoogleFonts.roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: SizeConfig
                                                                      .textMultiplier *
                                                                  3.0),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              children: [
                                if (bulb3)
                                  Expanded(
                                    child: Visibility(
                                      visible: bulb3,
                                      child: InkWell(
                                        onTap: () {
                                          updateData('Heater', 'on');
                                          setState(() {
                                            bulb3 = false;
                                            bulb3x = true;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(20),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff00A9A5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 0.5,
                                                      blurRadius: 5,
                                                      offset: Offset(0.0, 3.0))
                                                ]),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.lightbulb_outline,
                                                      color: Colors.white,
                                                      size: SizeConfig
                                                              .textMultiplier *
                                                          8,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'A C',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              3.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                  Expanded(
                                    child: Visibility(
                                      visible: bulb3x,
                                      child: InkWell(
                                        onTap: () {
                                          updateData('Heater', 'off');
                                          setState(() {
                                            bulb3 = true;
                                            bulb3x = false;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff00A9A5),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      spreadRadius: 0.5,
                                                      blurRadius: 5,
                                                      offset: Offset(0.0, 3.0))
                                                ]),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    child: Icon(
                                                      Icons.lightbulb,
                                                      color: Colors.white,
                                                      size: SizeConfig
                                                              .textMultiplier *
                                                          10,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: Text(
                                                      'A C',
                                                      style: GoogleFonts.roboto(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              3.0),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                bulb4
                                    ? Expanded(
                                        child: Visibility(
                                          visible: bulb4,
                                          child: InkWell(
                                            onTap: () {
                                              updateData('Light', 'on');
                                              setState(() {
                                                bulb4 = false;
                                                bulb4x = true;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(20),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xff00A9A5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 0.5,
                                                          blurRadius: 5,
                                                          offset:
                                                              Offset(0.0, 3.0))
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Icon(
                                                          Icons
                                                              .lightbulb_outline,
                                                          color: Colors.white,
                                                          size: SizeConfig
                                                                  .textMultiplier *
                                                              8,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          'Heater',
                                                          style: GoogleFonts.roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: SizeConfig
                                                                      .textMultiplier *
                                                                  3.0),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: Visibility(
                                          visible: bulb4x,
                                          child: InkWell(
                                            onTap: () {
                                              updateData('Light', 'off');
                                              setState(() {
                                                bulb4 = true;
                                                bulb4x = false;
                                              });
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xff00A9A5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 0.5,
                                                          blurRadius: 5,
                                                          offset:
                                                              Offset(0.0, 3.0))
                                                    ]),
                                                child: Column(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Icon(
                                                          Icons.lightbulb,
                                                          color: Colors.white,
                                                          size: SizeConfig
                                                                  .textMultiplier *
                                                              10,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: Text(
                                                          'Heater',
                                                          style: GoogleFonts.roboto(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: SizeConfig
                                                                      .textMultiplier *
                                                                  3.5),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: SizeConfig.widthMultiplier * 100,
                color: Colors.black,
                padding: EdgeInsets.only(bottom: 10.0, top: 5.0),
                child: Text(
                  _micText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  color: Colors.black,
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                          bottom: SizeConfig.heightMultiplier * 2),
                      decoration: BoxDecoration(
                          color: Color(0xff00A9A5), shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          _listen();
                        },
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: SizeConfig.textMultiplier * 5,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void updateData(String appliance, String state) {
    databaseReferenceTest.update({'$appliance': '$state'});
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
            _micText = _text;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
