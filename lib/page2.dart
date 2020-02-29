import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GFColors.DARK,
        appBar: AppBar(
          title: Text('КамчЕДАл Отзывы'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GFImageOverlay(
                height: 180,
                width: 180,
                shape: BoxShape.circle,
                image: AssetImage('assets/kamlogo.png'),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Наше заведение принимает чаевые через Сбербанк Онлайн! Откройте приложение Сбербанк Онлайн на вашем смартфоне и в разделе платежи выберите \"Оплата через QR\", отсканируйте QR и введите произвольную сумму. ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text.rich(
                  TextSpan(
                      text: 'Спасибо ',
                      children: [WidgetSpan(child: Icon(Icons.star, color: Colors.red,))]),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: Image.asset('assets/qr.png'),
              ),
            ],
          ),
        ));
  }
}
