import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:kamchedal/page2.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:kamchedal/user.dart';
import 'package:date_format/date_format.dart';

double _rating = 0;
const url = 'https://uinames.com/api/'; //url запроса
var time = DateTime.now();

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String review = '';
  String phone = '';
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GFColors.DARK,
        appBar: AppBar(
          title: Text('КамчЕДАл Отзывы'),
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//Лого
                Container(
                  padding: EdgeInsets.all(50.0),
                  child: GFImageOverlay(
                    height: 180,
                    width: 180,
                    padding: EdgeInsets.all(20.0),
                    shape: BoxShape.circle,
                    image: AssetImage('assets/icon.png'),
                  ),
                ),

//Текст
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Пожалуйста оцените данное заведение нажав соответственную звёздочку и ниже оставьте свой отзыв. Мы работаем, над усовершенствованием сервиса обслуживания в нашем крае, ваши отзывы, предложения и замечания не останутся без внимания!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),

//Звёзды
                Container(
                  width: 350,
                  padding: EdgeInsets.all(20.0),
                  child: GFRating(
                    value: _rating,
                    onChanged: (value) {
                      setState(() {
                        _rating = value;
                      });
                    },
                  ),
                ),

//Филд Ваше Имя
                Container(
                  width: 350,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    autocorrect: true,
                    onChanged: (text) {
                      name = text;
                    },
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
                  width: 350,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    autocorrect: true,
                    onChanged: (text) {
                      phone = text;
                    },
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
                  width: 350,
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
                  width: 350,
                  padding: EdgeInsets.all(10.0),
                  child: GFButton(
                    onPressed: () async {
                      print(review);
                      // FlutterOpenWhatsapp.sendSingleMessage("9004387824", "Hello");
                      try {
                        await Firestore.instance.runTransaction((t) {
                          return t.set(
                              Firestore.instance
                                  //  .document('reviews/$phone|$name'),
                                  .document('reviews/$time|$name'),
                              {
                                'review': review,
                                'phone': phone,
                                'name': name,
                                'rating': _rating,
                                'Дата': time
                              });
                        });

                        send();

                        return Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Page2()));
                      } catch (e) {
                        print(e);
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('Произошла ошибка $e'),
                        ));
                      }
                    },

                    // Ошибка при переходе на Page2, также при включени�� кода навигатор пуш, пропадает зелёная заливка кнопки

                    text: "ОТПРАВИТЬ",
                    color: Colors.lightGreen,
                    type: GFButtonType.outline,
                  ),
                )
              ],
            ),
          );
        }));
  }

  void send() async {
    var result = await http.get(
        'http://194.40.243.109//bot1090331552:AAF8p99EDmemwTu16YJLgT89VQ5tXbCg8W4/sendMessage?chat_id=806652480&text=Имя: $name \nТелефон: $phone \nРейтинг: $_rating \nОтзыв: $review');

    print(result.body);
    print(TimeOfDay.now());
    // var js = json.decode(result.body);
    //var user = User(js["name"]);
    //print(user.name);
  }
}
