import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Exception extends StatelessWidget {
  const Exception({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Sorry",
                style: GoogleFonts.montserrat(

                  textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black)
                ),),
                Text("request",
                style: GoogleFonts.montserrat(

                    textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black)
                ),),
                SizedBox(height: 10,),
                Text("Check Internet Connection",
                  style: GoogleFonts.montserrat(

                      textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black)
                  ),),
                Icon(Icons.network_check,color: Colors.black,size: 25,)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
