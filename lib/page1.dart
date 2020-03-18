import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:kamchedal/page2.dart';
import 'package:http/http.dart' as http;
import 'package:kamchedal/controller/form_controller.dart';
import 'package:kamchedal/model/form.dart';

double _rating = 0;
double _rating2 = 0;
const url = 'https://uinames.com/api/'; //url запроса

class Page1 extends StatefulWidget {
  Page1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String review = '';
  String phone = '';
  String name = '';
  String waiter = '';
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  TextEditingController waiternameController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  void _submitForm() {
      var date = DateTime.now();
    // Validate returns true if the form is valid, or false
    // otherwise.
    setState(() {
      loading = !loading;
    });
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          mobileNoController.text,
          feedbackController.text,
          waiternameController.text,
          _rating,
          _rating2,
          date.toString() );

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          setState(() {
            loading = !loading;
          });
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          setState(() {
            loading = !loading;
          });
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Feedback");

      send(
          nameController.text,
          mobileNoController.text,
          waiternameController.text,
          _rating,
          _rating2,
          feedbackController.text
         );

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
            Builder(builder: (context) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//Лого
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: GFImageOverlay(
                        height: 160,
                        width: 160,
                        padding: EdgeInsets.all(10.0),
                        shape: BoxShape.circle,
                        image: AssetImage('assets/icon.png'),
                      ),
                    ),

//Текст
Container(
    constraints:  BoxConstraints(minHeight: 100),
        padding:  EdgeInsets.all(1.0),
        margin: EdgeInsets.all(10.0),
        // margin: padding,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius:  BorderRadius.all(Radius.circular(10)),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
         
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   Text('Помогите держать уровень сервиса в заведениях нашего Края на высоте!',
                             textAlign: TextAlign.center, 
                            
                            style: TextStyle(
                      
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: GFColors.DARK),
                          ),
                      Text( 'Отметьте, насколько вы довольны посещением этого места, и оставьте отзыв. Руководство (кафе/ресторана) прочитает его. Пишите, и вы напрямую повлияете на качество кухни и обслуживания здесь!',
                             textAlign: TextAlign.center,
                          
                            style: TextStyle(
                              fontSize: 14.5,
                              color: Colors.black87,
                            ),
                          ),
                
                  ],
                ),
              ),
            ),
          ],
        ),
),
                  //  Container(
                  //    width: 580,
                   //   padding: EdgeInsets.all(5.0),
                   //   child: GFListTile(
                   //     color: Colors.white70,
                        
                  //      //avatar: GFAvatar(),
                   //     titleText:
                    //        'Помогите держать уровень сервиса в заведениях нашего Края на высоте!',
                  //      subtitleText:
                   //         'Отметьте, насколько вы довольны посещением этого места, и оставьте отзыв. Руководство (кафе/ресторана) прочитает его. Пишите, и вы напрямую повлияете на качество кухни и обслуживания здесь!',
                        //icon: Icon(Icons.favorite)
                  //    ),
                //    ),

//Звёзды

                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                'Оцените работу официанта',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(1.0),
                              child: GFRating(
                                value: _rating,
                                onChanged: (value) {
                                  setState(() {
                                    _rating = value;

                                    // ratingController(_rating: double.parse(TextEditingValue.fromJSON(encoded)))

                                    //   LevelEventCreate(price: double.parse(targetPriceController.text)),
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(1.0),
                              child: Text(
                                'Насколько вам понравились блюда',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(1.0),
                              child: GFRating(
                                value: _rating2,
                                onChanged: (value) {
                                  setState(() {
                                    _rating2 = value;

                                    // ratingController(_rating: double.parse(TextEditingValue.fromJSON(encoded)))

                                    //   LevelEventCreate(price: double.parse(targetPriceController.text)),
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                autocorrect: true,
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: 'Введите Ваше Имя',
                                  prefixIcon: Icon(Icons.person),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                              //  validator: (phone) {},
                                autocorrect: true,
                                controller: mobileNoController,
                                decoration: InputDecoration(
                                  hintText: 'Введите Ваш Телефон',
                                  prefixIcon: Icon(Icons.phone),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(10.0),
                              child: TextFormField(
                              //  validator: (phone) {},
                                autocorrect: true,
                                controller: waiternameController,
                                decoration: InputDecoration(
                                  hintText: 'Имя Официанта',
                                  prefixIcon: Icon(Icons.person_pin_circle),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 380,
                              padding: EdgeInsets.all(10.0),
                              child: TextField(
                                autocorrect: true,
                                controller: feedbackController,
                                decoration: InputDecoration(
                                  hintText: 'Ваш Отзыв',
                                  prefixIcon: Icon(Icons.star),
                                  hintStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                            var time = DateTime.now();
                            await Firestore.instance.runTransaction((t) {
                              return t.set(
                                  Firestore.instance
                                      //  .document('reviews/$phone|$name'),
                                      .document('reviews/$time|$name'),
                                  {
                                    'review': review,
                                    'phone': phone,
                                    'name': name,
                                    'rating_waiter': _rating,
                                    'rating_ eat': _rating2,
                                    'Дата': time
                                  });
                            });

                            _submitForm();

                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page2()));
                          } catch (e) {
                            print(e);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Произошла ошибка $e'),
                            ));
                          }
                        },

                        // Ошибка при переходе на Page2, также при включени�� кода навигатор пуш, пропадает зелёная заливка кнопки

                        text: loading ? null : "ОТПРАВИТЬ",
                        color: Colors.green,
                        type: GFButtonType.outline,
                        child: loading ? CircularProgressIndicator() : null,
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ));
  }

  void send(
    String name,
    String phone,
    String waiter,
    double rating,
    double rating2,
    String review,
  ) async {
    var result = await http.get(
        'http://194.40.243.109//bot1090331552:AAF8p99EDmemwTu16YJLgT89VQ5tXbCg8W4/sendMessage?chat_id=806652480&text=Имя: $name \nТелефон: $phone \nИмя официанта: $waiter \nОценка официанта: $rating \nОценка блюд: $rating2 \nОтзыв: $review');

    print(result.body);
    print(TimeOfDay.now());
    // var js = json.decode(result.body);
    //var user = User(js["name"]);
    //print(user.name);
  }
}
