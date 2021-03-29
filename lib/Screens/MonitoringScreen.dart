import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotbasedhomesecurity/Constants/size_config.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:firebase_database/firebase_database.dart';

import 'CustomDialog.dart';


class MonitoringScreen extends StatefulWidget {
  @override
  _MonitoringScreenState createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  static final databaseReferenceTest = FirebaseDatabase.instance.reference();
  var temp;
  //var data = databaseReferenceTest.child('Butane');
  var data2 = databaseReferenceTest.child('Methane');
  var data3 = databaseReferenceTest.child('Flame');
  double progress = 0.2;


  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff00A9A5),
                        Color(0xffFFB843)
                      ]
                  )
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'IoT Based Home Security',
                        style: GoogleFonts.robotoMono(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.textMultiplier * 4
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: SizeConfig.isMobilePortrait ? 6 : 4,
                    child: Container(
                      decoration: BoxDecoration(
                         // color: Color(0xff393733),
                        color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50)
                          )
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 4,
                          ),
                          Container(
                              child: StreamBuilder(
                                  stream: data2.onValue,
                                  builder: (context,snap){
                                    if(snap.hasData){
                                      double percent = (int.parse(snap.data.snapshot.value.toString()).toDouble())/1024.0;
                                      return CircularPercentIndicator(
                                        backgroundColor: Color(0xff2D2D2D),
                                        progressColor: Color(0xff00A9A5),
                                        percent: percent,
                                        animation: false,
                                        radius: 200.0,
                                        lineWidth: 10.0,
                                        circularStrokeCap: CircularStrokeCap.round,
                                        center: Container(
                                          height: SizeConfig.heightMultiplier * 16,
                                          width: SizeConfig.widthMultiplier * 40,
                                          margin: EdgeInsets.only(
                                              left: SizeConfig.widthMultiplier * 8
                                          ),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        left: SizeConfig.widthMultiplier * 6.5
                                                    ),
                                                    alignment: Alignment.centerLeft,
                                                    child:Text(snap.data.snapshot.value.toString(),
                                                      style: GoogleFonts.robotoMono(
                                                         // color: Color(0xffF6C85F),
                                                        color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: SizeConfig.textMultiplier * 6
                                                      ),
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        header: Container(
                                          margin: EdgeInsets.only(
                                              bottom: SizeConfig.heightMultiplier * 3
                                          ),
                                          child: Text(
                                            'Methane',
                                            style: GoogleFonts.robotoMono(
                                               // color: Color(0xffF6C85F),
                                              color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: SizeConfig.textMultiplier * 4
                                            ),
                                          ),
                                        ),
                                      );
                                    }else {
                                      return Center(
                                          child: CircularProgressIndicator()
                                      );
                                    }
                                  }
                              )
                          ),
                          SizedBox(
                            height: SizeConfig.heightMultiplier * 4,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: SizeConfig.widthMultiplier * 20,
                              right: SizeConfig.widthMultiplier * 20
                            ),
                              child: StreamBuilder(
                                  stream: data3.onValue,
                                  builder: (context,snap){
                                    if(snap.hasData){
                                      var fire = snap.data.snapshot.value.toString();
                                      if(fire == "0"){
                                        WidgetsBinding.instance.addPostFrameCallback((_){
                                          showDialog(context: context,
                                              builder: (BuildContext context){
                                                return CustomDialogBox();
                                              }
                                          );
                                        });
                                      }

                                      return Container(
                                        height: SizeConfig.heightMultiplier * 25,
                                        child: fire == '0'?Image.asset('images/fire.png', color: Colors.red,):
                                        Image.asset('images/fire.png', color: Colors.white,),
                                      );
                                    }else {
                                      return Center(
                                          child: CircularProgressIndicator()
                                      );
                                    }
                                  }
                              ),
                          ),
                          // Row(
                          //   children: [
                          //     // Expanded(
                          //     //   child: Container(
                          //     //       child: StreamBuilder(
                          //     //           stream: data.onValue,
                          //     //           builder: (context,snap){
                          //     //             if(snap.hasData){
                          //     //               return CircularPercentIndicator(
                          //     //                 backgroundColor: Color(0xff2D2D2D),
                          //     //                 progressColor: Color(0xffF6C85F),
                          //     //                 percent:(int.parse(snap.data.snapshot.value.toString()).toDouble())/125.0,
                          //     //                 animation: true,
                          //     //                 radius: 120.0,
                          //     //                 lineWidth: 10.0,
                          //     //                 circularStrokeCap: CircularStrokeCap.round,
                          //     //                 center: Container(
                          //     //                   height: SizeConfig.heightMultiplier * 16,
                          //     //                   width: SizeConfig.widthMultiplier * 40,
                          //     //                   margin: EdgeInsets.only(
                          //     //                       left: SizeConfig.widthMultiplier * 8
                          //     //                   ),
                          //     //                   child: Container(
                          //     //                     child: Row(
                          //     //                       children: [
                          //     //                         Expanded(
                          //     //                           flex: 3,
                          //     //                           child: Container(
                          //     //                             padding: EdgeInsets.only(
                          //     //                                 left: SizeConfig.widthMultiplier * 4.5
                          //     //                             ),
                          //     //                             alignment: Alignment.centerLeft,
                          //     //                             child:Text(snap.data.snapshot.value.toString(),
                          //     //                               style: GoogleFonts.robotoMono(
                          //     //                                   color: Color(0xffF6C85F),
                          //     //                                   fontWeight: FontWeight.bold,
                          //     //                                   fontSize: SizeConfig.textMultiplier * 3.7
                          //     //                               ),
                          //     //                               overflow: TextOverflow.ellipsis,
                          //     //                               maxLines: 1,
                          //     //                             ),
                          //     //                           ),
                          //     //                         ),
                          //     //                       ],
                          //     //                     ),
                          //     //                   ),
                          //     //                 ),
                          //     //                 header: Container(
                          //     //                   margin: EdgeInsets.only(
                          //     //                       bottom: SizeConfig.heightMultiplier * 3
                          //     //                   ),
                          //     //                   child: Text(
                          //     //                     'Butane',
                          //     //                     style: GoogleFonts.robotoMono(
                          //     //                         color: Color(0xffF6C85F),
                          //     //                         fontWeight: FontWeight.w500,
                          //     //                         fontSize: SizeConfig.textMultiplier * 4
                          //     //                     ),
                          //     //                   ),
                          //     //                 ),
                          //     //               );
                          //     //             }else {
                          //     //               return Center(
                          //     //                 child: CircularProgressIndicator(),
                          //     //               );
                          //     //             }
                          //     //           }
                          //     //       )
                          //     //   ),
                          //     // ),
                          //
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
  void updateData(String appliance, String state){
    databaseReferenceTest.update({
      '$appliance': '$state'
    });
  }
  getTemperatureValue(String value) async{
    int initialValue = int.parse(value);
    double finalValue = initialValue.toDouble()/125.0;

    setState(() async{
      progress=  await finalValue;
    });
  }
}