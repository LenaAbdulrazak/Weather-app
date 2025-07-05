import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'extras.dart';
import 'moreInformation.dart';
import 'package:http/http.dart' as http;

import 'secret.dart';

class MainScreen extends StatefulWidget {
   MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 
  @override
 
    Future getCurrentweather() async{
      try{
       
   String CityName='london';

      final response=await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$CityName&APPID=$openWheatherApiKey'));
        final data =jsonDecode(response.body);
      if(data['cod']!='200'){
        throw'an unexpected error occurred';
      }
      return data;
           
      
      }catch(e){
throw e.toString();
      }
   
      
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
        appBar: AppBar(
          title: const Text(
            'Weather App',
            style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 66, 12, 81)),
            
          ),
          
          centerTitle: true,
        ),
        body: 
         FutureBuilder(
          future: getCurrentweather(),
           builder:(context,snapshot) {
             if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child:   CircularProgressIndicator.adaptive());
             }
             if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()));
             }
             final data=snapshot.data;
             final repetive=data['list'][0];//store it in a seperate 
             final currentTemp=repetive['main']['temp'];
             final sky=repetive['weather'][0]['main'];
            double tempInCelsius=currentTemp-273.15;
             final humidityf=repetive['main']['humidity'];
            final wind=repetive['wind']['speed'];
            final pressure=repetive['main']['pressure'];
             
             return Padding(
            padding:const   EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    color:const  Color.fromARGB(255, 203, 152, 211),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
                        child:  Padding(
                          padding:  EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '${tempInCelsius.toStringAsFixed(3)} C',
                                textAlign: TextAlign.center,
                                style:const  TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                             const  SizedBox(
                                height: 8,
                              ),
                              Icon(
                                sky=='Clouds'|| sky=='Rain'?Icons.cloud:Icons.sunny, size: 65, color: Colors.white),
                             const  SizedBox(
                                height: 8,
                              ),
                              Text(
                                sky,
                                textAlign: TextAlign.center,
                                style:  const TextStyle(
                                    fontSize: 20,
                                    color:  Color.fromARGB(255, 255, 255, 255),),
                              ),
                            const   SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
               const  SizedBox(
                  height: 40,
                ),
              const   Align(
                  alignment: Alignment.topLeft,
                  child: Text('daily forecast',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 66, 12, 81)),)),
                   const SizedBox(
                  height: 15,
                ),
             const  SingleChildScrollView(
              scrollDirection : Axis.horizontal,
                child:    Row(children: [
                    AdditinalInfoItem(time: '00:00',icon: Icons.cloud,temp: '301,2',),
                    AdditinalInfoItem(time: '03:00',icon: Icons.sunny,temp: '301,2',),
                     AdditinalInfoItem(time: '00:00',icon: Icons.cloud,temp: '301,2',),
                    AdditinalInfoItem(time: '00:00',icon:  Icons.sunny,temp: '301,2',),
                    AdditinalInfoItem(time: '00:00',icon: Icons.cloud,temp: '301,2',),
                    AdditinalInfoItem(time: '00:00',icon: Icons.cloud,temp: '301,2',),
                 
                  ],),
              ),
               const  SizedBox(
                  height: 40,
                ),
                const Align(
                  alignment : Alignment.topLeft,
                  child: Text('Extra information',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 66, 12, 81)),)),
                     const SizedBox(
                  height: 15,
                ),
               Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                children: [
            moreIformation(label: 'humidity',icon: Icons.water_drop,value:humidityf.toString(),),
             moreIformation(label: 'wind speed',icon: Icons.air,value:wind.toString(),),
             moreIformation(label: 'pressure',icon: Icons.umbrella,value: pressure.toString(),),
                ],
               ),
              ],
            ),
                 );
           },
         ));
  }
}
