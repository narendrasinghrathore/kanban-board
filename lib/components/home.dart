import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynoteapp/models/Album.dart';
import 'package:mynoteapp/models/Weather.dart';
import 'package:mynoteapp/services/core.service.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  final String title;
  final borderColors = Colors.black; //Color.fromRGBO(65, 180, 158, 0.5);
  static final fontSize = 16.0;
  final double _volume = 0.0;
  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: fontSize,
  );
  double _height = 150;
  double _opacity = 0.5;
  double weatherWidgetOpacity = 1;
  var _duration = Duration(milliseconds: 500);

  double _weatherContainerHeight = 150;
  bool showSpinner = false;

  final weatherWidgetTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
  );

  final firstRow = <Map<String, dynamic>>[
    {
      'text': 'Add New Note',
      'icon': Icons.note_add,
      'id': 1,
    },
    {
      'text': 'Settings',
      'icon': Icons.settings,
      'id': 2,
    },
    {
      'text': 'Profile',
      'icon': Icons.account_circle,
      'id': 3,
    },
    {
      'text': 'List',
      'icon': Icons.list,
      'id': 4,
    }
  ];
}

class _HomeState extends State<Home> {
  Album user;
  Weather weatherData;
  TextEditingController _textFieldController;
  String cityName = 'Jaipur';

  updateSpinner(bool onOff) {
    setState(() {
      widget.showSpinner = onOff;
      widget._weatherContainerHeight = onOff == true ? 0 : 150;
    });
  }

  getWeather(String name) {
    print("***   " + name + "   ***");
    updateSpinner(true);
    getWeatherData(name)
        .then((value) => {
              setState(() =>
                  {weatherData = value, widget._weatherContainerHeight = 150})
            })
        .whenComplete(() => {updateSpinner(false)});
  }

  getData(int id) {
    updateSpinner(true);
    fetchAlbum(id)
        .then((value) => {
              setState(() => {user = value})
            })
        .whenComplete(() => {updateSpinner(false)});
  }

  @override
  void initState() {
    super.initState();
    _textFieldController = TextEditingController(text: cityName);
  }

  updateHeight() {
    double newHeight = widget._height == 100 ? 200 : 100;
    double newOpacity = widget._opacity == 1 ? 0.5 : 1;
    setState(() {
      widget._height = newHeight;
      widget._opacity = newOpacity;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bodyContainer = SafeArea(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              SvgPicture.asset('assets/images/notes.svg'),
              ListView(
                children: [
                  TextField(
                    style: widget.weatherWidgetTextStyle,
                    controller: _textFieldController,
                    onSubmitted: (String value) async {
                      getWeather(value);
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.red,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 10, color: Colors.white),
                      ),
                    ),
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: widget._duration,
                        height: widget._weatherContainerHeight,
                        child: AnimatedOpacity(
                          opacity: widget.weatherWidgetOpacity,
                          duration: widget._duration,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: weatherWidget(),
                            ),
                            width: 100.0,
                            height: 100.0,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                style: BorderStyle.solid,
                                width: 2,
                                color: widget.borderColors,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      ...widget.firstRow.map((element) {
                        return MyRowItem(
                          widget: widget,
                          element: element,
                          callbackFn: getData,
                        );
                      }).toList(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: AnimatedContainer(
                          curve: Curves.fastOutSlowIn,
                          duration: widget._duration,
                          height: widget._height,
                          child: AnimatedOpacity(
                            opacity: widget._opacity,
                            duration: widget._duration,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Details',
                                  style: widget.textStyle,
                                ),
                              ),
                              width: 100.0,
                              height: 100.0,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: widget.borderColors,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Container(
                      //   child: Center(
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Expanded(
                      //         child: Text(
                      //           'Setting',
                      //           style: widget.textStyle,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      //   width: 100.0,
                      //   height: 100.0,
                      //   margin: EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     border: Border.all(
                      //       style: BorderStyle.solid,
                      //       width: 2,
                      //       color: widget.borderColors,
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        primary: true,
      ),
      body: bodyContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.search),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Image weatherIcon(icon) {
    return Image(
      image: NetworkImage("http://openweathermap.org/img/wn/$icon@2x.png"),
    );
  }

  weatherWidget() {
    return widget.showSpinner == false
        ? (weatherData != null
            ? Row(
                children: [
                  Text(
                    weatherData.weather[0].main,
                    style: widget.weatherWidgetTextStyle,
                  ),
                  weatherIcon(weatherData.weather[0].icon),
                  Text(
                    "${weatherData.main.temp.toString()}",
                    style: widget.weatherWidgetTextStyle,
                  ),
                  Text(
                    "° C",
                    style: widget.weatherWidgetTextStyle,
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    "No data",
                    style: widget.weatherWidgetTextStyle,
                  ),
                ],
              ))

        // By default, show a loading spinner.
        : Row(children: [
            CircularProgressIndicator(),
          ]);
  }
}

class MyRowItem extends StatelessWidget {
  const MyRowItem(
      {Key key, @required this.widget, this.element, this.callbackFn})
      : super(key: key);

  final Home widget;
  final element;
  final callbackFn;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                iconSize: 50.0,
                color: Colors.white,
                icon: Icon(element['icon']),
                tooltip: 'Increase volume by 10',
                highlightColor: Colors.red[300],
                onPressed: () {
                  callbackFn(element['id']);
                },
              ),
              Text(
                element['text'],
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      width: 200.0,
      height: 140.0,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            const Color.fromRGBO(142, 158, 171, 1),
            const Color.fromRGBO(238, 242, 243, 1),
          ], // whitish to gray
          tileMode: TileMode.clamp, // repeats the gradient over the canvas
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black87, spreadRadius: 5)
        ],
        // border: Border.all(
        //   style: BorderStyle.solid,
        //   width: 2,
        //   color: widget.borderColors,
        // ),
      ),
    );
  }
}
