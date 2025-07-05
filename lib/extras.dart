import 'package:flutter/material.dart';

class AdditinalInfoItem extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temp;

  const AdditinalInfoItem({super.key,required this.time,required this.icon,required this.temp });
  @override
  Widget build(BuildContext context) {
    return     ClipRRect(
                  borderRadius:BorderRadius.circular(16),
                  child: Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                
                    elevation:10 ,
                    color:const  Color.fromARGB(255, 203, 152, 211),
                    child:  Padding(
                      padding:  EdgeInsets.all(16),
                      child: Column(children: [
                        Text(time,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                        SizedBox(height: 3),
                        Icon(icon, size: 40, color: Colors.white),
                      Text(temp,style: TextStyle(color: Colors.white,),),
                    
                      ]),
                    ),
                    
                    
                  ),
                );
  }
}