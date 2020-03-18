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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: GFImageOverlay(
                    height: 160,
                    width: 160,
                    padding: EdgeInsets.all(20.0),
                    shape: BoxShape.circle,
                    image: AssetImage('assets/icon.png'),
                  ),
                ),
                Container(
                      width: 580,
                      padding: EdgeInsets.all(20.0),
                      child: GFListTile(
                        color: Colors.white70,
                        //avatar: GFAvatar(),
                        titleText:
                            'У нас Вы можете оставить чаевые через Сбербанк Онлайн!',
                        subtitleText:
                            'Если Вам удобно отблагодарить персонал безналичным переводом, откройте Сбербанк Онлайн на смартфоне и в разделе "Платежи" выберите "Оплата через QR, отсканируйте код ниже и введите сумму чаевых. 😉',
                        //icon: Icon(Icons.favorite)
                      ),
                    ),
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Text.rich(
                    TextSpan(text: 'Спасибо ', children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                    ]),
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
          ),
        ],
      ),
    );
  }
}
