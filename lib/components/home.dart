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

  final firstRow = <Map<String, dynamic>>[
    {'text': 'Add New Note', 'icon': Icons.note_add},
    {'text': 'Settings', 'icon': Icons.settings},
    {'text': 'Profile', 'icon': Icons.account_circle},
    {'text': 'List', 'icon': Icons.list}
  ];
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
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                SvgPicture.asset('assets/images/notes.svg'),
                ListView(
                  children: [
                    Wrap(
                      children: <Widget>[
                        ...widget.firstRow.map((element) {
                          return MyRowItem(widget: widget, element: element);
                        }).toList(),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Setting',
                                style: widget.textStyle,
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
      ),
    );
  }
}

class MyRowItem extends StatelessWidget {
  const MyRowItem({Key key, @required this.widget, this.element})
      : super(key: key);

  final Home widget;
  final element;

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
                  // setState(() {
                  //   widget._volume += 10;
                  // });
                },
              ),
              Text(
                element['text'],
                style: TextStyle(color: Colors.white),
              ),
            ],
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
    );
  }
}
