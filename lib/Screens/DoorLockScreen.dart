import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotbasedhomesecurity/Constants/size_config.dart';

class DoorLockScreen extends StatefulWidget {
  @override
  _DoorLockScreenState createState() => _DoorLockScreenState();
}

class _DoorLockScreenState extends State<DoorLockScreen> {
  static final databaseReferenceTest = FirebaseDatabase.instance.reference();
  String statusLock = 'Locked';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // statusLock = 'Locked';
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.green,
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
                    'Lock Screen',
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
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    )
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: statusLock =='Locked'?InkWell(
                          onTap: (){
                            setState(() {
                              statusLock = 'Unlocked';
                              updateData('Command', 'unlocked');
                            });
                          },
                          child: Container(
                            child: Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: SizeConfig.textMultiplier * 20,
                            ),
                          ),
                        ):
                        InkWell(
                          onTap: (){
                            setState(() {
                              statusLock = 'Locked';
                              updateData('Command', 'locked');
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset('images/unlock.png',
                              color: Colors.white,
                              width: SizeConfig.imageSizeMultiplier * 35,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            statusLock,
                            style: GoogleFonts.robotoMono(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.textMultiplier * 4
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ),

    );
  }
  void updateData(String appliance, String state){
    databaseReferenceTest.update({
      '$appliance': '$state'
    });
  }
}
