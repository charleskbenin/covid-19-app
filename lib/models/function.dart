import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

myfavRow(BuildContext context,{Widget firstWidget, secondWidget}){
  return
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      firstWidget, 
      secondWidget
    ],
  );
}

mybuttons(BuildContext context, {IconData iconData, Text text, Function onpress, Color colors}){

  return GestureDetector(
    onTap: onpress,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      decoration: mydeco(colors),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(iconData, color: Colors.white,),
          SizedBox(width: 10,),
          text,
        ],
      ),
    ),
  );
}

mydeco (Color color){
  return BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color
      );
}
myactiveIcon(IconData activeIcon){
  return Container(
    width: 100,
    height: 50,
    // padding: EdgeInsets.all(20),
    decoration: mydeco(Color(0xff4D79FF)),
    child: Center(child: Icon(activeIcon, color: Colors.white,)));
}
  var prevention = [{
    'image': 'images/close_contact.png',
    'title': 'Avoid close contact'
  },
  {
    'image': 'images/close_contact.png',
    'title': 'Avoid close contact'
  },
  {
    'image': 'images/close_contact.png',
    'title': 'Wear nose mask'
  },
  {
    'image': 'images/close_contact.png',
    'title': 'Avoid close contact'
  },
  {
    'image': 'images/wash_hands.jpg',
    'title': 'sleep like that'
  }
];


// }