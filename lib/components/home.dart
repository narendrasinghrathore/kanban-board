import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  final String title;
  final borderColors = Color.fromRGBO(65, 180, 158, 0.5);
  static final fontSize = 16.0;
  double _volume = 0.0;
  final textStyle = TextStyle(
    color: Colors.white,
    fontSize: fontSize,
  );
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              SvgPicture.asset('assets/images/notes.svg'),
              ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.volume_up),
                            tooltip: 'Increase volume by 10',
                            onPressed: () {
                              setState(() {
                                widget._volume += 10;
                              });
                            },
                          ),
                          Text('Volume : $widget._volume',
                              style: widget.textStyle)
                        ],
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add New Note',
                              style: widget.textStyle,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 2,
                            color: widget.borderColors,
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Setting',
                              style: widget.textStyle,
                            ),
                          ),
                        ),
                        width: 100.0,
                        height: 100.0,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 2,
                            color: widget.borderColors,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
