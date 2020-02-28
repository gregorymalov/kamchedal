import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

void main() => runApp(Page2());

class Page2 extends StatelessWidget{
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
  Container(
  	padding: EdgeInsets.all(20.0),
    child: Text('Наше заведение принимает чаевые через Сбербанк Онлайн! Откройте приложение Сбербанк Онлайн на вашем смартфоне и в разделе платежи выберите \"Оплата через QR\", отсканируйте QR и введите произвольную сумму. ',
    style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,),),),
              Container(
  	padding: EdgeInsets.all(20.0),
    child: Text('Спасибо!',
    style: TextStyle(
            color: Colors.white, 
            fontSize: 18.0,),),),

            Container(
	width: 320,
	padding: EdgeInsets.all(10.0),
	child: GFImageOverlay(
  height: 200,
  width: 300,
  image: AssetImage('assets/qr.png')
),),

             ], 

     )
        )
    

    );

  }
}

    

