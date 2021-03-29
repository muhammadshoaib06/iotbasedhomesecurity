import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotbasedhomesecurity/Constants/size_config.dart';


class CustomDialogBox extends StatefulWidget {
  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Center(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: SizedBox(),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: SizeConfig.heightMultiplier * 25,
                  width: SizeConfig.heightMultiplier* 25,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Image.asset('images/fire (1).png')
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                    top: SizeConfig.heightMultiplier * 2
                ),
                child: Text(
                  'Fire Detected',
                  style: GoogleFonts.robotoMono(
                      color: Colors.red,
                      fontSize: SizeConfig.textMultiplier * 6,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
