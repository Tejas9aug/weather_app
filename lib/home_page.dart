import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
   try{
     data = data.isNotEmpty ?data : ModalRoute
        .of(context)!
        .settings
        .arguments as Map;}
   catch(e){
     data=data;
   }
    return Scaffold(

      backgroundColor: Colors.yellow,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.035,
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings,
                  size: MediaQuery.of(context).size.height*0.035,),
                  SizedBox(height: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Settings",style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.height*0.02,
                        ),
                      ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/location_adobe_express.svg",
              width: MediaQuery.of(context).size.height*0.035,),
              title: Text("Choose Location",style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.height*0.02),
            ),
              ),
             onTap: ()async{
                dynamic result = await Navigator.pushNamed(context, "/location");
                setState(() {
                  data = {
                    "city":result['city'],
                    "latitude":result['latitude'],
                    "longitude":result['longitude'],
                    "main_weather":result['main_weather'],
                    "current_temp": result['current_temp'],
                    "max_temp": result['max_temp'],
                    "min_temp": result["min_temp"],
                    "humidity": result['humidity'],
                    "date": result["date"],
                    "weekday": result["weekday"],
                    "sunrise": result["sunrise"],
                    "sunset": result["sunset"],
                    "cloudiness": result["cloudiness"],
                    "pressure": result["pressure"],
                    "windspeed": result["windspeed"],
                    "grnd_level": result["grnd_level"],



                  };
                });

             },
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Developed by :",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ),
                  Text("Tejas Patange",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height*0.02),
                    ),
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "home",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: Colors.black,

        ),
      ),
    ),
        backgroundColor: Colors.amber,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height*0.35,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.03),
                  image: const DecorationImage(image:AssetImage( 'assets/Thunder.jpg',),fit: BoxFit.cover),
                ),
                child: Padding(padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      //  Text("TimePass")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                            Row(
                              children: [
                                SvgPicture.asset('assets/location_adobe_express.svg',
                                width: MediaQuery.of(context).size.height*0.03,),
                                Text(data["city"],
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context).size.height*0.03,
                                        color: Colors.black,

                                      ),
                                    )
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(" lat ",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context).size.height*0.03,
                                        color: Colors.black,

                                      ),
                                    )
                                ),
                                Text("${data["latitude"]}/",
                                    style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: MediaQuery.of(context).size.height*0.03,
                                        color: Colors.black,

                                      ),
                                    ),
                                ),
                                Text('lon = ',
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                            MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.03,
                                          fontWeight: FontWeight.w700,))),
                                Text(data['longitude'].toString(),
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                            MediaQuery.of(context)
                                                .size
                                                .height *
                                                0.03,
                                          fontWeight: FontWeight.w700,))),

                              ],
                            ),
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height *
                                    0.043),

                            Text(
                                data["weekday"] == null
                                    ? " "
                                    : data["weekday"],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.029,
                                        fontWeight: FontWeight.w700))),
                            const SizedBox(
                              height: 0,
                            ),
                            Text(
                                data["date"] == null ? " " : data["date"],
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.029,
                                        fontWeight: FontWeight.w700)))

                          ],
                        )
                        
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                            data['main_weather'] == null
                                ? " "
                                : data['main_weather'] + " : ",
                            //
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.027,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            )),

                      ),
                      Text(
                          data["cloud_description"] == null
                              ? " "
                              : data["cloud_description"],
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize:
                                MediaQuery.of(context).size.height *
                                    0.024,
                              )))
                  ],
                ),
                ]
                ),
              ),
            ),



            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
              
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.07,
                ),
                Container(
                  height: MediaQuery.of(context).size.width*0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset("assets/sunrise_adobe_express.svg",

                        width: MediaQuery.of(context).size.width*0.09,
                      ),
                    ],
                  )
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.05),
    Text(data["sunrise"]==null ? " ":data["sunrise"],
    style: GoogleFonts.lato(
    textStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: MediaQuery.of(context).size.height*0.03,
    color: Colors.black,
    ),),),
                SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                Container(
                  height: MediaQuery.of(context).size.width*0.09,

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset("assets/sunset_adobe_express.svg",

                            width: MediaQuery.of(context).size.width*0.09,
                          ),
                        ],
                      )
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width*0.03),
                  Text(data["sunset"]==null ? " ":data["sunset"],
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height*0.03,
                        color: Colors.black,
                      ),),),


              ],
            ),
            const Divider(thickness: 1,
            color: Colors.black12,),
            Row(

              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width*0.11,),

                    SvgPicture.asset("assets/heat_adobe_express.svg",

                    width: MediaQuery.of(context).size.width*0.10,),
                      Text(' Temperature: ',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                  MediaQuery.of(context).size.width * 0.05))),


                ]
            ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("min : ",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                          Text(
                            data["min_temp"].toString(),
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),



                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange[400]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("current: ",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                          Text(data["current_temp"].toString(),
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange[600]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("max: ",
                              style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))),
                          Text(data["max_temp"].toString(),
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    ),
              ],
            ),
                Divider(
                  thickness: 2,
                  color: Colors.black12,
                ),
        Container(
         // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          padding: EdgeInsets.all(10.0),
          // width: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/Humidity.svg',
                    width: 20,
                  ),

                Text(' Humidity: ',
                    style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:
                           20))),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset("assets/cloudy.svg", width: 30),
                  Text(' Cloudiness: ',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 20))),

              ],
            ),
              SizedBox(
                height: 10,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                    customWidths:
                    CustomSliderWidths(progressBarWidth: 10),
                    size: 130,
                    startAngle: 180,
                    angleRange: 360,
                    customColors: CustomSliderColors(
                        trackColor: Colors.indigo[300],
                        progressBarColor: Colors.indigo[900],
                        dotColor: Colors.white)),
                min: 0,
                max: 100,
                initialValue: data['humidity'].toDouble(),
              ),
              SizedBox(
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20,),
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      customWidths:
                      CustomSliderWidths(progressBarWidth: 10),
                        size: 130,
                        startAngle: 180,
                        angleRange: 360,
                        customColors: CustomSliderColors(
                            trackColor: Colors.indigo[300],
                            progressBarColor: Colors.indigo[900],
                            dotColor: Colors.white)
                    ),
                    min: 0,
                    max: 100,
                    initialValue: data['cloudiness'].toDouble(),
                  ),

                ],
              ),
              ]),

          ],
        ),
      ),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10,

                ),
                SvgPicture.asset('assets/speed.svg',
                width: 20,),
                Text("Wind Speed:",style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                  color: Colors.black)
                ),),
                SizedBox(width: 20,),
                SvgPicture.asset('assets/meter.svg',
                  width: 20,),
                Text("Pressure:",style: GoogleFonts.montserrat(
                    textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,
                        color: Colors.black)
                ),),

              ],
            ),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Text(data['windspeed'].toString(),
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      )

                    ),),
                    Container(
                      width: 60,
                      height: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 6,),
                          Text("/mph",
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                )

                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(data["pressure"].toString(),style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )
                ),),
                Container(
                  width: 30,
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("/hpa",
                        style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )
                        ),),
                    ],
                  ),
                )

              ],


            ),
            const Divider(
              thickness: 2,
              color: Colors.black12,
            ),
            const SizedBox(
              width: 20,
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[

                  Text("Ground Level:",
                    style: GoogleFonts.lato(
                        textStyle:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        )
                    ),),
                  Text(data["grnd_level"].toString(),style: GoogleFonts.lato(
                      textStyle:  TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  ),
                ]
              ),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            )



    ],

    ),

      ),

    );


  }
}
