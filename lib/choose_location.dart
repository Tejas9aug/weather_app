import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/weather_data.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String? city;
  String error = " ";
  WeatherData? data;
  bool isNull=false;
  TextEditingController t1 = TextEditingController(text:"");
  Future updateData() async{
    data = WeatherData(city: city);
    await data?.getData();
    if(data?.main!=null){
      Navigator.pop(context,{
        "city" : data?.city,
        "latitude" : data?.latitude,
        "longitude" : data?.longitude,
        "main_weather": data?.main,
        "current_temp" : data?.temp,
        "max_temp": data?.maxTemp,
        "min_temp" : data?.minTemp,
        "humidity": data?.humidity,
        "cloud_description" : data?.cloudDescription,
        "date": data?.date2,
        "weekday":data?.weekDay,
        "sunrise": data?.sunrise,
        "sunset": data?.sunset,
        "cloudiness": data?.cloudiness,
        "pressure": data?.pressure,
        "windspeed": data?.windSpeed,
        "grnd_level":data?.grnd_level,

      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location",
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            //backgroundColor: Colors.tealAccent


          )
        ),),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          TextField(
            keyboardType: TextInputType.text,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Enter name of city",
              focusColor: Colors.amber,

            ),
            controller: t1,
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: ()
          async{
            city= t1.text;
            await updateData();
            if(data?.main==null){
              setState(() {
                error="No data found";
              });
            }

          }, child: Text("Enter")),
          Text(error,style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  backgroundColor: Colors.tealAccent


              )
          ),)

        ],

    ),
    );
  }
}
