import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

void main() => runApp(Kamchedal());

  double _rating = 3;

class Kamchedal extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'КамчЕДАл Отзывы',
      theme: ThemeData(
          primaryColor: Colors.lightGreen,
          textTheme: TextTheme(title: TextStyle(color: Colors.white))
        ),
      home: Scaffold(
        backgroundColor: GFColors.DARK,
        appBar: AppBar(
        title: Text('КамчЕДАл Отзывы'),
    
        ),
      body: Column(
  
        children: <Widget>[
      GFImageOverlay(
   height: 180,
   width: 180,
   shape: BoxShape.circle,
   image:AssetImage('assets/kamlogo.png'),
 ),
 //Container(
  	//padding: EdgeInsets.all(20.0),
    //child: GFListTile(
  
  //titleText:'Нам важно Ваше мнение',
  //subtitleText:'Пожалуйста оцените данное заведение нажав соответственную звёздочку и ниже оставьте свой отзыв',
  //color: Colors.white,
//), ),
 Container(
  	padding: EdgeInsets.all(20.0),
    child: Text('Пожалуйста оцените данное заведение нажав соответственную звёздочку и ниже оставьте свой отзыв. Мы работаем, над усовершенствованием сервиса обслуживания в нашем крае, ваши отзывы, предложения и замечания не останутся без внимания!',
    style: TextStyle( // а у текста появился виджет, который его стилизует
            color: Colors.white, // задаем ему цвет текста
            fontSize: 16.0,),),),

 Container(

	width: 320,
	padding: EdgeInsets.all(10.0),

	child: 
  GFRating(
  value: _rating,
  onChanged: (value) {
    //setState(() {
    //  _rating = value;
   // });
  },
),),



 Container(
	width: 320,
	padding: EdgeInsets.all(10.0),
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Введите Ваше Имя',
	  prefixIcon: Icon(Icons.person),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	  ),
	),),),
 
  Container(
	width: 320,
	padding: EdgeInsets.all(10.0),
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Введите Ваш Телефон',
	  prefixIcon: Icon(Icons.phone),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	  ),
	),),),

   Container(
	width: 320,
	padding: EdgeInsets.all(10.0),
	child: TextField(
	autocorrect: true,
	decoration: InputDecoration(
	  hintText: 'Ваш Отзыв',
	  prefixIcon: Icon(Icons.star_border),
	  hintStyle: TextStyle(color: Colors.grey),
	  filled: true,
	  fillColor: Colors.white,
	  enabledBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(12.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	   ),
	  focusedBorder: OutlineInputBorder(
		borderRadius: BorderRadius.all(Radius.circular(10.0)),
		borderSide: BorderSide(color: Colors.green, width: 2),
	  ),
	),),),

  //   double _rating = 3; где объявить?
   Container(
	width: 320,
	padding: EdgeInsets.all(10.0),
	child: GFButton(
    onPressed: null,
    color: Color(0x00FF00),
    text: "ОТПРАВИТЬ",
 ),)

      ], 

     )
        )
    

    );

  }
}
