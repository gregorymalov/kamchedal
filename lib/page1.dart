import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:kamchedal/page2.dart';

double _rating = 3;

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String review = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GFColors.DARK,
        appBar: AppBar(
          title: Text('КамчЕДАл Отзывы'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//Лого
              GFImageOverlay(
                height: 180,
                width: 180,
                shape: BoxShape.circle,
                image: AssetImage('assets/kamlogo.png'),
              ),

//Текст
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Пожалуйста оцените данное заведение нажав соответственную звёздочку и ниже оставьте свой отзыв. Мы работаем, над усовершенствованием сервиса обслуживания в нашем крае, ваши отзывы, предложения и замечания не останутся без внимания!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),

//Звёзды
              Container(
                width: 320,
                padding: EdgeInsets.all(9.0),
                child: GFRating(
                  value: _rating,
                  onChanged: (value) {
                    //setState(() {
                    //  _rating = value;
                    // });
                  },
                ),
              ),

//Филд Ваше Имя
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
                  ),
                ),
              ),

              //Филд ваш телефон
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
                  ),
                ),
              ),

//Филд Ваш отзыв
              Container(
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  autocorrect: true,
                  onChanged: (text) {
                    review = text;
                  },
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
                  ),
                ),
              ),

              //Кнопка отправить
              Container(
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: GFButton(
                  onPressed: () async {
                    print(review);
                
                   await  Firestore.instance.runTransaction((t){
                      return t.set(Firestore.instance.document('reviews/1'), {'review': review});
                    });
                   
                    return Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()));
                  },

                  // Ошибка при переходе на Page2, также при включении кода навигатор пуш, пропадает зелёная заливка кнопки

                  text: "ОТПРАВИТЬ",
                  color: Color(0x00FF00),
                ),
              )
            ],
          ),
        ));
  }
}
