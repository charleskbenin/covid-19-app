import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


TextStyle dataStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.white
);

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

myNewButtons(Function onPressed, String text, Color color){
  return Container(
    height: 40,
    width: 170,
    child: MaterialButton(
      onPressed: onPressed,
      elevation: 0.00,
      shape: StadiumBorder(),
      color: color,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
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


myContainer({String text, String dataText, Color color}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 100,
    width: 165,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: dataStyle.copyWith(fontSize: 18, fontWeight: FontWeight.normal),),
        Text(dataText, style: dataStyle,)
      ],
    ),
  );
}


myNewContainer({String text, String dataText, Color color}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10),
    height: 100,
    width: 107,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: dataStyle.copyWith(fontSize: 18)),
        Text(dataText, style: dataStyle)
      ],
    ),
  );
}