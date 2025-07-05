// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class moreIformation extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  const moreIformation({
    Key? key,
    required this.value,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
     borderRadius : BorderRadius.circular(16),
      child: Card(   
        elevation: 8,          
         color:  Color.fromARGB(255, 203, 152, 211),
        child: Padding(
          padding:  const EdgeInsets.all(10),
          child:    Column(
                   children: [Icon(icon,size: 35,color: Colors.white),
                 const   SizedBox(
                    height: 8,
                   ),
                   Text(label,style: TextStyle(fontSize: 16,color: Colors.white),),
                     const  SizedBox(
                    height: 8,
                   ),
                    Text(value,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
              
                   ],
              
                 ),
        ),
      ),
    );
  }
}
